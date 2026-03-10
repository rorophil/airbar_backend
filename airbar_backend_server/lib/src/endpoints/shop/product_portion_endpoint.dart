import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart';

/// Endpoint for product portion management
class ProductPortionEndpoint extends Endpoint {
  /// Get all portions for a product
  Future<List<ProductPortion>> getProductPortions(
    Session session,
    int productId, {
    bool activeOnly = true,
  }) async {
    try {
      if (activeOnly) {
        return await ProductPortion.db.find(
          session,
          where: (t) => t.productId.equals(productId) & t.isActive.equals(true),
          orderBy: (t) => t.displayOrder,
        );
      }
      return await ProductPortion.db.find(
        session,
        where: (t) => t.productId.equals(productId),
        orderBy: (t) => t.displayOrder,
      );
    } catch (e) {
      session.log('Get product portions error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Get portion by ID
  Future<ProductPortion?> getPortionById(
    Session session,
    int portionId,
  ) async {
    try {
      return await ProductPortion.db.findById(session, portionId);
    } catch (e) {
      session.log('Get portion by ID error: $e', level: LogLevel.warning);
      return null;
    }
  }

  /// Create product portion (admin only)
  Future<ProductPortion> createPortion(
    Session session,
    int productId,
    String name,
    double quantity,
    double price, {
    int displayOrder = 0,
  }) async {
    try {
      // Validate product exists and is bulk
      final product = await Product.db.findById(session, productId);
      if (product == null) {
        throw Exception('Produit non trouvé');
      }

      if (!product.isBulkProduct) {
        throw Exception('Ce produit n\'est pas un produit en vrac');
      }

      if (price < 0) {
        throw Exception('Le prix ne peut pas être négatif');
      }

      if (quantity <= 0) {
        throw Exception('La quantité doit être positive');
      }

      final portion = ProductPortion(
        productId: productId,
        name: name,
        quantity: quantity,
        price: price,
        displayOrder: displayOrder,
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      return await ProductPortion.db.insertRow(session, portion);
    } catch (e) {
      session.log('Create portion error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Update product portion (admin only)
  Future<ProductPortion> updatePortion(
    Session session,
    int portionId,
    String name,
    double quantity,
    double price, {
    int? displayOrder,
  }) async {
    try {
      final portion = await ProductPortion.db.findById(session, portionId);

      if (portion == null) {
        throw Exception('Portion non trouvée');
      }

      if (price < 0) {
        throw Exception('Le prix ne peut pas être négatif');
      }

      if (quantity <= 0) {
        throw Exception('La quantité doit être positive');
      }

      portion.name = name;
      portion.quantity = quantity;
      portion.price = price;
      if (displayOrder != null) {
        portion.displayOrder = displayOrder;
      }
      portion.updatedAt = DateTime.now();

      return await ProductPortion.db.updateRow(session, portion);
    } catch (e) {
      session.log('Update portion error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Delete/Deactivate portion (admin only)
  Future<void> deletePortion(Session session, int portionId) async {
    try {
      final portion = await ProductPortion.db.findById(session, portionId);

      if (portion == null) {
        throw Exception('Portion non trouvée');
      }

      portion.isActive = false;
      portion.updatedAt = DateTime.now();

      await ProductPortion.db.updateRow(session, portion);
    } catch (e) {
      session.log('Delete portion error: $e', level: LogLevel.warning);
      rethrow;
    }
  }
}
