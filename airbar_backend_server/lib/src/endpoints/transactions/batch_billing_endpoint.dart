import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart' as protocol;

class BatchBillingEndpoint extends Endpoint {
  String _requestHash(int adminId, List<protocol.BatchBillingLine> lines) {
    final canonicalLines = lines
        .map(
          (line) => [
            line.userId,
            line.productId,
            line.productPortionId,
            line.quantity,
          ],
        )
        .toList();
    canonicalLines.sort((a, b) => jsonEncode(a).compareTo(jsonEncode(b)));
    return sha256
        .convert(utf8.encode(jsonEncode([adminId, canonicalLines])))
        .toString();
  }

  Future<List<protocol.Transaction>> cancel(
    Session session,
    String requestKey,
    int adminId,
    String adminPin,
    List<protocol.BatchBillingLine> lines,
  ) async {
    if (requestKey.isEmpty || requestKey.length > 128 || lines.isEmpty) {
      throw protocol.BusinessException(message: 'Lot invalide ou vide');
    }
    final hash = _requestHash(adminId, lines);
    return session.db.transaction((tx) async {
      final admin = await protocol.User.db.findById(
        session,
        adminId,
        transaction: tx,
        lockMode: LockMode.forUpdate,
      );
      if (admin == null ||
          !admin.isActive ||
          admin.role != protocol.UserRole.admin ||
          admin.pin != sha256.convert(utf8.encode(adminPin)).toString()) {
        throw protocol.BusinessException(
          message: 'Administrateur ou code PIN incorrect',
        );
      }
      final existing = await protocol.BatchBillingRequest.db.findFirstRow(
        session,
        where: (t) => t.requestKey.equals(requestKey),
        transaction: tx,
      );
      if (existing == null) {
        await protocol.BatchBillingRequest.db.insertRow(
          session,
          protocol.BatchBillingRequest(
            requestKey: requestKey,
            adminId: adminId,
            requestHash: hash,
            transactionIds: '[]',
            createdAt: DateTime.now(),
          ),
          transaction: tx,
        );
        return [];
      }
      if (existing.adminId != adminId || existing.requestHash != hash) {
        throw protocol.BusinessException(
          message: 'Identifiant de lot déjà utilisé',
        );
      }
      return _readResults(session, existing.transactionIds, tx);
    });
  }

  Future<List<protocol.Transaction>> _readResults(
    Session session,
    String encodedIds,
    Transaction tx,
  ) async {
    final ids = (jsonDecode(encodedIds) as List).cast<int>();
    final result = <protocol.Transaction>[];
    for (final id in ids) {
      final item = await protocol.Transaction.db.findById(
        session,
        id,
        transaction: tx,
      );
      if (item == null) {
        throw protocol.BusinessException(
          message: 'Historique du lot incomplet',
        );
      }
      result.add(item);
    }
    return result;
  }

  Future<List<protocol.Transaction>> charge(
    Session session,
    String requestKey,
    int adminId,
    String adminPin,
    List<protocol.BatchBillingLine> lines,
  ) async {
    if (requestKey.isEmpty || requestKey.length > 128 || lines.isEmpty) {
      throw protocol.BusinessException(message: 'Lot invalide ou vide');
    }

    final hash = _requestHash(adminId, lines);

    return session.db.transaction((tx) async {
      final userIds = {adminId, ...lines.map((line) => line.userId)}.toList()
        ..sort();
      final users = <int, protocol.User>{};
      for (final id in userIds) {
        final user = await protocol.User.db.findById(
          session,
          id,
          transaction: tx,
          lockMode: LockMode.forUpdate,
        );
        if (user == null) {
          throw protocol.BusinessException(
            message: 'Utilisateur $id introuvable',
          );
        }
        users[id] = user;
      }
      final admin = users[adminId]!;
      if (!admin.isActive ||
          admin.role != protocol.UserRole.admin ||
          admin.pin != sha256.convert(utf8.encode(adminPin)).toString()) {
        throw protocol.BusinessException(
          message: 'Administrateur ou code PIN incorrect',
        );
      }

      final existing = await protocol.BatchBillingRequest.db.findFirstRow(
        session,
        where: (t) => t.requestKey.equals(requestKey),
        transaction: tx,
      );
      if (existing != null) {
        if (existing.adminId != adminId || existing.requestHash != hash) {
          throw protocol.BusinessException(
            message: 'Identifiant de lot déjà utilisé',
          );
        }
        final result = await _readResults(session, existing.transactionIds, tx);
        if (result.isEmpty) {
          throw protocol.BusinessException(message: 'Ce lot a été annulé');
        }
        return result;
      }

      for (final user in users.values) {
        if (!user.isActive || !user.balance.isFinite) {
          throw protocol.BusinessException(
            message: 'Compte ${user.id} inactif ou invalide',
          );
        }
      }
      final seen = <String>{};
      for (final line in lines) {
        if (line.quantity <= 0 ||
            !seen.add(
              '${line.userId}:${line.productId}:${line.productPortionId}',
            )) {
          throw protocol.BusinessException(
            message: 'Quantité ou article dupliqué invalide',
          );
        }
      }
      final products = <int, protocol.Product>{};
      final productIds = lines.map((line) => line.productId).toSet().toList()
        ..sort();
      for (final id in productIds) {
        final product = await protocol.Product.db.findById(
          session,
          id,
          transaction: tx,
          lockMode: LockMode.forUpdate,
        );
        if (product == null || !product.isActive || product.isDeleted) {
          throw protocol.BusinessException(message: 'Produit $id indisponible');
        }
        products[id] = product;
      }
      final portions = <int, protocol.ProductPortion>{};
      final portionIds =
          lines
              .map((line) => line.productPortionId)
              .whereType<int>()
              .toSet()
              .toList()
            ..sort();
      for (final id in portionIds) {
        final portion = await protocol.ProductPortion.db.findById(
          session,
          id,
          transaction: tx,
          lockMode: LockMode.forShare,
        );
        if (portion == null ||
            !portion.isActive ||
            !portion.quantity.isFinite ||
            portion.quantity <= 0 ||
            !portion.price.isFinite ||
            portion.price < 0) {
          throw protocol.BusinessException(message: 'Portion $id indisponible');
        }
        portions[id] = portion;
      }

      final required = <int, double>{};
      for (final line in lines) {
        final product = products[line.productId]!;
        final portion = line.productPortionId == null
            ? null
            : portions[line.productPortionId];
        if (!product.price.isFinite ||
            product.price < 0 ||
            (product.isBulkProduct &&
                (portion == null || portion.productId != product.id)) ||
            (!product.isBulkProduct && portion != null)) {
          throw protocol.BusinessException(
            message: 'Produit ou portion invalide : ${product.name}',
          );
        }
        if (product.isBulkProduct &&
            (product.bulkTotalQuantity == null ||
                !product.bulkTotalQuantity!.isFinite ||
                product.bulkTotalQuantity! <= 0)) {
          throw protocol.BusinessException(
            message: 'Contenance invalide : ${product.name}',
          );
        }
        required.update(
          line.productId,
          (value) => value + line.quantity * (portion?.quantity ?? 1.0),
          ifAbsent: () => line.quantity * (portion?.quantity ?? 1.0),
        );
      }
      for (final product in products.values.where((p) => p.trackStock)) {
        if (product.stockQuantity < 0 ||
            (product.currentUnitRemaining != null &&
                (!product.currentUnitRemaining!.isFinite ||
                    product.currentUnitRemaining! < 0 ||
                    (product.isBulkProduct &&
                        product.currentUnitRemaining! >
                            product.bulkTotalQuantity!)))) {
          throw protocol.BusinessException(
            message: 'État du stock invalide pour ${product.name}',
          );
        }
        final available = product.isBulkProduct
            ? product.stockQuantity * product.bulkTotalQuantity! +
                  (product.currentUnitRemaining ?? 0)
            : product.stockQuantity.toDouble();
        if (!available.isFinite ||
            !required[product.id!]!.isFinite ||
            available < required[product.id!]!) {
          throw protocol.BusinessException(
            message: 'Stock insuffisant pour ${product.name}',
          );
        }
      }

      final result = <protocol.Transaction>[];
      final buyerIds = lines.map((line) => line.userId).toSet().toList()
        ..sort();
      for (final userId in buyerIds) {
        final buyer = users[userId]!;
        final buyerLines = lines.where((line) => line.userId == userId);
        final total = buyerLines.fold<double>(0, (sum, line) {
          final portion = portions[line.productPortionId];
          return sum +
              line.quantity *
                  (portion?.price ?? products[line.productId]!.price);
        });
        if (!total.isFinite || !(buyer.balance - total).isFinite) {
          throw protocol.BusinessException(message: 'Montant du lot invalide');
        }
        buyer.balance -= total;
        buyer.updatedAt = DateTime.now();
        await protocol.User.db.updateRow(session, buyer, transaction: tx);
        final sale = await protocol.Transaction.db.insertRow(
          session,
          protocol.Transaction(
            userId: userId,
            type: protocol.TransactionType.purchase,
            totalAmount: total,
            timestamp: DateTime.now(),
            balanceAfter: buyer.balance,
            notes: 'Lot $requestKey - admin #$adminId',
          ),
          transaction: tx,
        );
        result.add(sale);
        for (final line in buyerLines) {
          final product = products[line.productId]!;
          final portion = portions[line.productPortionId];
          final unitPrice = portion?.price ?? product.price;
          final deduction = product.trackStock
              ? line.quantity * (portion?.quantity ?? 1.0)
              : 0.0;
          await protocol.TransactionItem.db.insertRow(
            session,
            protocol.TransactionItem(
              transactionId: sale.id!,
              productId: line.productId,
              productName: portion == null
                  ? product.name
                  : '${product.name} - ${portion.name}',
              quantity: line.quantity,
              unitPrice: unitPrice,
              subtotal: unitPrice * line.quantity,
              stockDeduction: deduction,
              stockWasTracked: product.trackStock,
              stockWasBulk: product.isBulkProduct,
              stockBulkCapacity: product.isBulkProduct
                  ? product.bulkTotalQuantity
                  : null,
            ),
            transaction: tx,
          );
          if (product.trackStock) {
            if (product.isBulkProduct) {
              final remaining = (product.currentUnitRemaining ?? 0) - deduction;
              if (remaining >= 0) {
                product.currentUnitRemaining = remaining;
              } else {
                final opened = (-remaining / product.bulkTotalQuantity!).ceil();
                product.stockQuantity -= opened;
                product.currentUnitRemaining =
                    remaining + opened * product.bulkTotalQuantity!;
              }
            } else {
              product.stockQuantity -= line.quantity;
            }
            await protocol.StockMovement.db.insertRow(
              session,
              protocol.StockMovement(
                productId: line.productId,
                quantity: -deduction,
                movementType: protocol.MovementType.sale,
                userId: userId,
                timestamp: DateTime.now(),
                notes: 'Lot $requestKey - Transaction #${sale.id}',
              ),
              transaction: tx,
            );
          }
        }
      }
      for (final product in products.values.where((p) => p.trackStock)) {
        product.updatedAt = DateTime.now();
        await protocol.Product.db.updateRow(session, product, transaction: tx);
      }
      await protocol.BatchBillingRequest.db.insertRow(
        session,
        protocol.BatchBillingRequest(
          requestKey: requestKey,
          adminId: adminId,
          requestHash: hash,
          transactionIds: jsonEncode(result.map((sale) => sale.id).toList()),
          createdAt: DateTime.now(),
        ),
        transaction: tx,
      );
      return result;
    });
  }
}
