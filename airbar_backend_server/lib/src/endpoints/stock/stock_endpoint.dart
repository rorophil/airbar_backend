import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart';

/// Endpoint for stock management
class StockEndpoint extends Endpoint {
  /// Restock product (admin only)
  Future<void> restockProduct(
    Session session,
    int productId,
    int quantity,
    int adminUserId,
    String? notes,
  ) async {
    try {
      if (quantity <= 0) {
        throw Exception('La quantité doit être positive');
      }

      await session.db.transaction((transaction) async {
        // Get product
        final product = await Product.db.findById(session, productId);

        if (product == null) {
          throw Exception('Produit non trouvé');
        }

        // Update stock
        product.stockQuantity += quantity;
        product.updatedAt = DateTime.now();
        await Product.db.updateRow(session, product);

        // Log stock movement
        final stockMovement = StockMovement(
          productId: productId,
          quantity: quantity.toDouble(),
          movementType: MovementType.restock,
          userId: adminUserId,
          timestamp: DateTime.now(),
          notes: notes ?? 'Réapprovisionnement',
        );

        await StockMovement.db.insertRow(session, stockMovement);
      });
    } catch (e) {
      session.log('Restock product error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Adjust stock (inventory correction, admin only)
  Future<void> adjustStock(
    Session session,
    int productId,
    int newQuantity,
    int adminUserId,
    String reason,
  ) async {
    try {
      if (newQuantity < 0) {
        throw Exception('La quantité ne peut pas être négative');
      }

      await session.db.transaction((transaction) async {
        // Get product
        final product = await Product.db.findById(session, productId);

        if (product == null) {
          throw Exception('Produit non trouvé');
        }

        // Calculate difference
        final difference = newQuantity - product.stockQuantity;

        // Update stock
        product.stockQuantity = newQuantity;
        product.updatedAt = DateTime.now();
        await Product.db.updateRow(session, product);

        // Log stock movement
        final stockMovement = StockMovement(
          productId: productId,
          quantity: difference.toDouble(),
          movementType: MovementType.adjustment,
          userId: adminUserId,
          timestamp: DateTime.now(),
          notes: 'Ajustement inventaire: $reason',
        );

        await StockMovement.db.insertRow(session, stockMovement);
      });
    } catch (e) {
      session.log('Adjust stock error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Get stock history for a product
  Future<List<StockMovement>> getStockHistory(
    Session session,
    int productId, {
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      var movements = await StockMovement.db.find(
        session,
        where: (t) => t.productId.equals(productId),
        orderBy: (t) => t.timestamp,
        orderDescending: true,
      );

      // Filter by date range if provided
      if (startDate != null && endDate != null) {
        movements = movements.where((m) {
          return m.timestamp.isAfter(
                startDate.subtract(Duration(seconds: 1)),
              ) &&
              m.timestamp.isBefore(endDate.add(Duration(seconds: 1)));
        }).toList();
      }

      return movements;
    } catch (e) {
      session.log('Get stock history error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Get all stock movements (admin only)
  Future<List<StockMovement>> getAllStockMovements(
    Session session, {
    MovementType? type,
    DateTime? startDate,
    DateTime? endDate,
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      // Fetch movements with optional type filter
      var movements = await StockMovement.db.find(
        session,
        where: type != null ? (t) => t.movementType.equals(type) : null,
        orderBy: (t) => t.timestamp,
        orderDescending: true,
        limit: limit,
        offset: offset,
      );

      // Filter by date range if provided
      if (startDate != null && endDate != null) {
        movements = movements.where((m) {
          return m.timestamp.isAfter(
                startDate.subtract(Duration(seconds: 1)),
              ) &&
              m.timestamp.isBefore(endDate.add(Duration(seconds: 1)));
        }).toList();
      }

      return movements;
    } catch (e) {
      session.log('Get all stock movements error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Get products with low stock (below alert threshold)
  Future<List<Product>> getLowStockProducts(Session session) async {
    try {
      final allProducts = await Product.db.find(
        session,
        where: (t) => t.isActive.equals(true),
      );

      // Filter products with low stock
      return allProducts
          .where((p) => p.stockQuantity <= p.minStockAlert)
          .toList();
    } catch (e) {
      session.log('Get low stock products error: $e', level: LogLevel.warning);
      rethrow;
    }
  }
}
