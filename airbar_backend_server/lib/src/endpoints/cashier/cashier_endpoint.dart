import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart' as protocol;
import 'package:crypto/crypto.dart';
import 'dart:convert';

/// Endpoint for cashier operations (cash sales to non-members)
class CashierEndpoint extends Endpoint {
  /// Process cash sale - Create cashSale transaction for non-member customer
  /// [sellerId] - ID of the member processing the sale
  /// [items] - List of items being sold
  /// [paymentMethod] - How the customer is paying (cash or card)
  /// [pin] - Seller's PIN for verification
  Future<protocol.Transaction> processCashSale(
    Session session,
    int sellerId,
    List<protocol.CashSaleItemData> items,
    protocol.PaymentMethod paymentMethod,
    String pin,
  ) async {
    try {
      // 1. Validate seller and PIN
      final seller = await protocol.User.db.findById(session, sellerId);

      if (seller == null) {
        throw Exception('Vendeur non trouvé');
      }

      // Verify PIN
      final pinHash = _hashPassword(pin);
      if (seller.pin != pinHash) {
        throw Exception('Code PIN incorrect');
      }

      if (items.isEmpty) {
        throw Exception('Aucun article dans la vente');
      }

      // 2. Execute atomic transaction
      return await session.db.transaction((transaction) async {
        // 3. Calculate total and verify stock
        double totalAmount = 0;
        final transactionItems = <protocol.TransactionItem>[];

        for (final item in items) {
          final product = await protocol.Product.db.findById(
            session,
            item.productId,
          );

          if (product == null) {
            throw Exception('Produit ${item.productId} non trouvé');
          }

          if (!product.isActive) {
            throw Exception(
              'Le produit ${product.name} n\'est plus disponible',
            );
          }

          // Get effective price and calculate required stock quantity
          double unitPrice = product.price;
          String productName = product.name;
          double requiredStockQuantity = item.quantity.toDouble();
          double? stockDeduction;

          if (item.productPortionId != null) {
            final portion = await protocol.ProductPortion.db.findById(
              session,
              item.productPortionId!,
            );

            if (portion != null) {
              unitPrice = portion.price;
              productName = '${product.name} - ${portion.name}';
              // Calculate actual stock needed (e.g., 2 portions × 0.25L = 0.5L)
              requiredStockQuantity = item.quantity * portion.quantity;
            } else {
              session.log(
                'Warning: Portion ${item.productPortionId} not found for item',
                level: LogLevel.warning,
              );
            }
          }

          // Verify stock with actual required quantity (only if stock tracking is enabled)
          if (product.trackStock) {
            double availableStock;
            if (product.isBulkProduct &&
                item.productPortionId != null &&
                product.bulkTotalQuantity != null) {
              // For bulk products: calculate total available in units (e.g., liters)
              availableStock =
                  (product.stockQuantity * product.bulkTotalQuantity!) +
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
          }

          final subtotal = unitPrice * item.quantity;
          totalAmount += subtotal;

          // Create transaction item (snapshot)
          transactionItems.add(
            protocol.TransactionItem(
              transactionId: 0, // Will be set after transaction creation
              productId: product.id!,
              productName: productName,
              quantity: item.quantity,
              unitPrice: unitPrice,
              subtotal: subtotal,
              stockDeduction: stockDeduction,
            ),
          );
        }

        // 4. Create transaction (no user account involved - cash sale to non-member)
        final paymentMethodStr = paymentMethod == protocol.PaymentMethod.cash
            ? 'espèces'
            : 'carte bancaire';

        final trans = protocol.Transaction(
          userId: null, // Non-member customer (anonymous)
          type: protocol.TransactionType.cashSale,
          totalAmount: totalAmount,
          timestamp: DateTime.now(),
          notes: 'Vente caisse - Paiement: $paymentMethodStr',
          refundedTransactionId: null,
          sellerId: sellerId,
          paymentMethod: paymentMethod,
          balanceAfter: null, // Not applicable for cash sales
        );

        final createdTransaction = await protocol.Transaction.db.insertRow(
          session,
          trans,
        );

        // 5. Create transaction items and update stock
        int itemIndex = 0;
        for (final item in items) {
          final product = await protocol.Product.db.findById(
            session,
            item.productId,
          );

          if (product != null && product.trackStock) {
            double stockDeduction = 0.0;
            String movementNote =
                'Vente caisse - Transaction #${createdTransaction.id} - Paiement: $paymentMethodStr';

            // Handle bulk products with portions (unit-based management)
            if (product.isBulkProduct && item.productPortionId != null) {
              final portion = await protocol.ProductPortion.db.findById(
                session,
                item.productPortionId!,
              );

              if (portion != null && product.bulkTotalQuantity != null) {
                // Calculate total quantity needed (e.g., 2 portions × 0.25L = 0.5L)
                double requiredQuantity = item.quantity * portion.quantity;
                stockDeduction = requiredQuantity;

                // Check if there's an opened unit
                if (product.currentUnitRemaining != null &&
                    product.currentUnitRemaining! > 0) {
                  if (product.currentUnitRemaining! >= requiredQuantity) {
                    // Current unit is sufficient
                    product.currentUnitRemaining =
                        product.currentUnitRemaining! - requiredQuantity;
                    movementNote =
                        'Vente caisse ${item.quantity}×${portion.name} (unité entamée) - Transaction #${createdTransaction.id} - Paiement: $paymentMethodStr';
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
                        'Vente caisse ${item.quantity}×${portion.name} ($unitsNeeded unité(s) entamée(s)) - Transaction #${createdTransaction.id} - Paiement: $paymentMethodStr';
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
                      'Vente caisse ${item.quantity}×${portion.name} ($unitsNeeded unité(s) ouverte(s)) - Transaction #${createdTransaction.id} - Paiement: $paymentMethodStr';
                }

                // Update transaction item with actual stock deduction
                transactionItems[itemIndex].stockDeduction = stockDeduction;
              }
            } else {
              // Regular product (non-bulk) - deduct quantity directly from stock
              product.stockQuantity -= item.quantity;
              stockDeduction = item.quantity.toDouble();
              movementNote =
                  'Vente caisse ${item.quantity}×${product.name} - Transaction #${createdTransaction.id} - Paiement: $paymentMethodStr';

              // Update transaction item with stock deduction
              transactionItems[itemIndex].stockDeduction = stockDeduction;
            }

            product.updatedAt = DateTime.now();
            await protocol.Product.db.updateRow(session, product);

            // Log stock movement with seller as userId
            final stockMovement = protocol.StockMovement(
              productId: product.id!,
              quantity: -stockDeduction,
              movementType: protocol.MovementType.sale,
              userId:
                  sellerId, // Seller is tracked as the one who made the sale
              timestamp: DateTime.now(),
              notes: movementNote,
            );

            await protocol.StockMovement.db.insertRow(session, stockMovement);

            // Check if stock alert needed
            if (product.stockQuantity <= product.minStockAlert) {
              session.log(
                'ALERT: Product ${product.name} stock low: ${product.stockQuantity} unités',
                level: LogLevel.warning,
              );
            }
          }

          // Set transaction ID for item
          transactionItems[itemIndex].transactionId = createdTransaction.id!;
          await protocol.TransactionItem.db.insertRow(
            session,
            transactionItems[itemIndex],
          );

          itemIndex++;
        }

        return createdTransaction;
      });
    } catch (e) {
      session.log(
        'Error processing cash sale: $e',
        level: LogLevel.error,
      );
      rethrow;
    }
  }

  /// Get transactions for a specific seller (to track sales made by a member)
  Future<List<protocol.Transaction>> getSellerTransactions(
    Session session,
    int sellerId, {
    int limit = 50,
    int offset = 0,
  }) async {
    return await protocol.Transaction.db.find(
      session,
      where: (t) => t.sellerId.equals(sellerId),
      orderBy: (t) => t.timestamp,
      orderDescending: true,
      limit: limit,
      offset: offset,
    );
  }

  /// Hash password/PIN using SHA256
  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
