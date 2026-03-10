import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart' as protocol;
import 'package:crypto/crypto.dart';
import 'dart:convert';

/// Endpoint for transaction management and checkout
class TransactionEndpoint extends Endpoint {
  /// Checkout - Create purchase transaction (atomic operation)
  Future<protocol.Transaction> checkout(
    Session session,
    int userId,
    String pin,
  ) async {
    try {
      // Validate PIN first
      final user = await protocol.User.db.findById(session, userId);

      if (user == null) {
        throw Exception('Utilisateur non trouvé');
      }

      // Verify PIN (should use auth endpoint's hash method)
      final pinHash = _hashPassword(pin);
      if (user.pin != pinHash) {
        throw Exception('Code PIN incorrect');
      }

      // Execute atomic transaction
      return await session.db.transaction((transaction) async {
        // 1. Get cart items
        final cartItems = await protocol.CartItem.db.find(
          session,
          where: (t) => t.userId.equals(userId),
        );

        if (cartItems.isEmpty) {
          throw Exception('Le panier est vide');
        }

        // 2. Calculate total and verify stock
        double totalAmount = 0;
        final transactionItems = <protocol.TransactionItem>[];

        for (final cartItem in cartItems) {
          final product = await protocol.Product.db.findById(
            session,
            cartItem.productId,
          );

          if (product == null) {
            throw Exception('Produit ${cartItem.productId} non trouvé');
          }

          if (!product.isActive) {
            throw Exception(
              'Le produit ${product.name} n\'est plus disponible',
            );
          }

          // Get effective price and calculate required stock quantity
          double unitPrice = product.price;
          String productName = product.name;
          double requiredStockQuantity = cartItem.quantity.toDouble();

          if (cartItem.productPortionId != null) {
            final portion = await protocol.ProductPortion.db.findById(
              session,
              cartItem.productPortionId!,
            );

            if (portion != null) {
              unitPrice = portion.price;
              productName = '${product.name} - ${portion.name}';
              // Calculate actual stock needed (e.g., 2 portions × 0.25L = 0.5L)
              requiredStockQuantity = cartItem.quantity * portion.quantity;
            } else {
              session.log(
                'Warning: Portion ${cartItem.productPortionId} not found for cart item',
                level: LogLevel.warning,
              );
            }
          }

          // Verify stock with actual required quantity
          double availableStock;
          if (product.isBulkProduct &&
              cartItem.productPortionId != null &&
              product.bulkTotalQuantity != null) {
            // For bulk products: calculate total available in units (e.g., liters)
            availableStock = (product.stockQuantity * product.bulkTotalQuantity!) +
                (product.currentUnitRemaining ?? 0);
          } else {
            // For regular products: use stockQuantity directly
            availableStock = product.stockQuantity.toDouble();
          }

          if (availableStock < requiredStockQuantity) {
            throw Exception(
              'Stock insuffisant pour ${productName}. Disponible: ${availableStock.toStringAsFixed(2)}, Requis: ${requiredStockQuantity.toStringAsFixed(2)}',
            );
          }

          final subtotal = unitPrice * cartItem.quantity;
          totalAmount += subtotal;

          // Create transaction item (snapshot)
          transactionItems.add(
            protocol.TransactionItem(
              transactionId: 0, // Will be set after transaction creation
              productId: product.id!,
              productName: productName,
              quantity: cartItem.quantity,
              unitPrice: unitPrice,
              subtotal: subtotal,
            ),
          );
        }

        // 3. Verify sufficient balance
        if (user.balance < totalAmount) {
          throw Exception(
            'Solde insuffisant. Requis: ${totalAmount.toStringAsFixed(2)}€, Disponible: ${user.balance.toStringAsFixed(2)}€',
          );
        }

        // 4. Debit user account
        user.balance -= totalAmount;
        user.updatedAt = DateTime.now();
        await protocol.User.db.updateRow(session, user);

        // 5. Create transaction
        final trans = protocol.Transaction(
          userId: userId,
          type: protocol.TransactionType.purchase,
          totalAmount: totalAmount,
          timestamp: DateTime.now(),
          notes: null,
          refundedTransactionId: null,
        );

        final createdTransaction = await protocol.Transaction.db.insertRow(
          session,
          trans,
        );

        // 6. Create transaction items
        for (final item in transactionItems) {
          item.transactionId = createdTransaction.id!;
          await protocol.TransactionItem.db.insertRow(session, item);
        }

        // 7. Update stock and create stock movements
        for (final cartItem in cartItems) {
          final product = await protocol.Product.db.findById(
            session,
            cartItem.productId,
          );

          if (product != null) {
            double stockDeduction = 0.0;
            String movementNote =
                'Vente - Transaction #${createdTransaction.id}';

            // Handle bulk products with portions (unit-based management)
            if (product.isBulkProduct && cartItem.productPortionId != null) {
              final portion = await protocol.ProductPortion.db.findById(
                session,
                cartItem.productPortionId!,
              );

              if (portion != null && product.bulkTotalQuantity != null) {
                // Calculate total quantity needed (e.g., 2 portions × 0.25L = 0.5L)
                double requiredQuantity = cartItem.quantity * portion.quantity;
                stockDeduction = requiredQuantity;

                // Check if there's an opened unit
                if (product.currentUnitRemaining != null &&
                    product.currentUnitRemaining! > 0) {
                  if (product.currentUnitRemaining! >= requiredQuantity) {
                    // Current unit is sufficient
                    product.currentUnitRemaining =
                        product.currentUnitRemaining! - requiredQuantity;
                    movementNote =
                        'Vente ${cartItem.quantity}×${portion.name} (unité entamée) - Transaction #${createdTransaction.id}';
                  } else {
                    // Current unit is insufficient, need to open new unit(s)
                    double usedFromCurrent = product.currentUnitRemaining!;
                    double remaining = requiredQuantity - usedFromCurrent;

                    // Calculate how many complete units are needed
                    int unitsNeeded = (remaining / product.bulkTotalQuantity!)
                        .ceil();

                    // Deduct from stock
                    product.stockQuantity -= unitsNeeded;

                    // Calculate what remains in the last opened unit
                    double totalFromNewUnits =
                        unitsNeeded * product.bulkTotalQuantity!;
                    product.currentUnitRemaining =
                        totalFromNewUnits - remaining;

                    movementNote =
                        'Vente ${cartItem.quantity}×${portion.name} ($unitsNeeded unité(s) entamée(s)) - Transaction #${createdTransaction.id}';
                  }
                } else {
                  // No opened unit, need to open new one(s)
                  int unitsNeeded =
                      (requiredQuantity / product.bulkTotalQuantity!).ceil();

                  if (product.stockQuantity < unitsNeeded) {
                    throw Exception('Stock insuffisant pour ${product.name}');
                  }

                  product.stockQuantity -= unitsNeeded;

                  double totalFromUnits =
                      unitsNeeded * product.bulkTotalQuantity!;
                  product.currentUnitRemaining =
                      totalFromUnits - requiredQuantity;

                  movementNote =
                      'Vente ${cartItem.quantity}×${portion.name} ($unitsNeeded unité(s) ouverte(s)) - Transaction #${createdTransaction.id}';
                }
              }
            } else {
              // Regular product (non-bulk) - deduct quantity directly from stock
              product.stockQuantity -= cartItem.quantity;
              stockDeduction = cartItem.quantity.toDouble();
              movementNote =
                  'Vente ${cartItem.quantity}×${product.name} - Transaction #${createdTransaction.id}';
            }

            product.updatedAt = DateTime.now();
            await protocol.Product.db.updateRow(session, product);

            // Log stock movement with actual deducted quantity
            final stockMovement = protocol.StockMovement(
              productId: product.id!,
              quantity: -stockDeduction,
              movementType: protocol.MovementType.sale,
              userId: userId,
              timestamp: DateTime.now(),
              notes: movementNote,
            );

            await protocol.StockMovement.db.insertRow(session, stockMovement);

            // Check if stock alert needed
            if (product.stockQuantity <= product.minStockAlert) {
              // TODO: Trigger email alert
              session.log(
                'ALERT: Product ${product.name} stock low: ${product.stockQuantity} unités',
                level: LogLevel.warning,
              );
            }
          }
        }

        // 8. Clear cart
        await protocol.CartItem.db.deleteWhere(
          session,
          where: (t) => t.userId.equals(userId),
        );

        return createdTransaction;
      });
    } catch (e) {
      session.log('Checkout error: $e', level: LogLevel.error);
      rethrow;
    }
  }

  /// Refund transaction (admin only)
  Future<protocol.Transaction> refundTransaction(
    Session session,
    int transactionId,
    String reason,
  ) async {
    try {
      return await session.db.transaction((transaction) async {
        // 1. Get original transaction
        final originalTrans = await protocol.Transaction.db.findById(
          session,
          transactionId,
        );

        if (originalTrans == null) {
          throw Exception('Transaction non trouvée');
        }

        if (originalTrans.type != protocol.TransactionType.purchase) {
          throw Exception('Seuls les achats peuvent être remboursés');
        }

        // Check if already refunded
        final existingRefunds = await protocol.Transaction.db.find(
          session,
          where: (t) => t.refundedTransactionId.equals(transactionId),
        );

        if (existingRefunds.isNotEmpty) {
          throw Exception('Cette transaction a déjà été remboursée');
        }

        // 2. Get user and credit account
        final user = await protocol.User.db.findById(
          session,
          originalTrans.userId,
        );

        if (user == null) {
          throw Exception('Utilisateur non trouvé');
        }

        user.balance += originalTrans.totalAmount;
        user.updatedAt = DateTime.now();
        await protocol.User.db.updateRow(session, user);

        // 3. Get transaction items to restore stock
        final items = await protocol.TransactionItem.db.find(
          session,
          where: (t) => t.transactionId.equals(transactionId),
        );

        // 4. Restore stock
        for (final item in items) {
          final product = await protocol.Product.db.findById(
            session,
            item.productId,
          );

          if (product != null) {
            // Restore stock based on product type
            if (product.isBulkProduct && item.stockDeduction != null) {
              // For bulk products, restore to current unit remaining
              product.currentUnitRemaining =
                  (product.currentUnitRemaining ?? 0.0) + item.stockDeduction!;

              // If current unit exceeds capacity, convert to complete units
              if (product.bulkTotalQuantity != null &&
                  product.currentUnitRemaining! >= product.bulkTotalQuantity!) {
                int completeUnits =
                    (product.currentUnitRemaining! / product.bulkTotalQuantity!)
                        .floor();
                product.stockQuantity += completeUnits;
                product.currentUnitRemaining =
                    product.currentUnitRemaining! -
                    (completeUnits * product.bulkTotalQuantity!);
              }

              product.updatedAt = DateTime.now();
              await protocol.Product.db.updateRow(session, product);

              // Log stock movement
              final stockMovement = protocol.StockMovement(
                productId: product.id!,
                quantity: item.stockDeduction!,
                movementType: protocol.MovementType.refund,
                userId: originalTrans.userId,
                timestamp: DateTime.now(),
                notes: 'Remboursement - Transaction #$transactionId',
              );

              await protocol.StockMovement.db.insertRow(session, stockMovement);
            } else {
              // For regular products, restore quantity directly
              product.stockQuantity += item.quantity;
              product.updatedAt = DateTime.now();
              await protocol.Product.db.updateRow(session, product);

              // Log stock movement
              final stockMovement = protocol.StockMovement(
                productId: product.id!,
                quantity: item.quantity.toDouble(),
                movementType: protocol.MovementType.refund,
                userId: originalTrans.userId,
                timestamp: DateTime.now(),
                notes: 'Remboursement - Transaction #$transactionId',
              );

              await protocol.StockMovement.db.insertRow(session, stockMovement);
            }
          }
        }

        // 5. Create refund transaction
        final refundTrans = protocol.Transaction(
          userId: originalTrans.userId,
          type: protocol.TransactionType.refund,
          totalAmount: originalTrans.totalAmount,
          timestamp: DateTime.now(),
          notes: reason,
          refundedTransactionId: transactionId,
        );

        return await protocol.Transaction.db.insertRow(session, refundTrans);
      });
    } catch (e) {
      session.log('Refund transaction error: $e', level: LogLevel.error);
      rethrow;
    }
  }

  /// Get user transactions with pagination
  Future<List<protocol.Transaction>> getUserTransactions(
    Session session,
    int userId, {
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      return await protocol.Transaction.db.find(
        session,
        where: (t) => t.userId.equals(userId),
        orderBy: (t) => t.timestamp,
        orderDescending: true,
        limit: limit,
        offset: offset,
      );
    } catch (e) {
      session.log('Get user transactions error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Get all transactions (admin only, with pagination)
  Future<List<protocol.Transaction>> getAllTransactions(
    Session session, {
    int limit = 20,
    int offset = 0,
    protocol.TransactionType? type,
  }) async {
    try {
      if (type != null) {
        return await protocol.Transaction.db.find(
          session,
          where: (t) => t.type.equals(type),
          orderBy: (t) => t.timestamp,
          orderDescending: true,
          limit: limit,
          offset: offset,
        );
      }

      return await protocol.Transaction.db.find(
        session,
        orderBy: (t) => t.timestamp,
        orderDescending: true,
        limit: limit,
        offset: offset,
      );
    } catch (e) {
      session.log('Get all transactions error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Get transaction items for a specific transaction
  Future<List<protocol.TransactionItem>> getTransactionItems(
    Session session,
    int transactionId,
  ) async {
    try {
      return await protocol.TransactionItem.db.find(
        session,
        where: (t) => t.transactionId.equals(transactionId),
      );
    } catch (e) {
      session.log('Get transaction items error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Hash password using SHA256 (same as auth endpoint)
  String _hashPassword(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
