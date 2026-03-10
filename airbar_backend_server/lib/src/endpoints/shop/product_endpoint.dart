import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart';

/// Endpoint for product management
class ProductEndpoint extends Endpoint {
  /// Get all products
  Future<List<Product>> getAllProducts(
    Session session, {
    bool? activeOnly,
    bool includeDeleted = false,
  }) async {
    try {
      if (activeOnly == true) {
        return await Product.db.find(
          session,
          where: (t) =>
              t.isActive.equals(true) &
              (includeDeleted ? t.id.notEquals(0) : t.isDeleted.equals(false)),
        );
      }
      return await Product.db.find(
        session,
        where: (t) =>
            includeDeleted ? t.id.notEquals(0) : t.isDeleted.equals(false),
      );
    } catch (e) {
      session.log('Get all products error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Get products by category
  Future<List<Product>> getProductsByCategory(
    Session session,
    int categoryId,
  ) async {
    try {
      return await Product.db.find(
        session,
        where: (t) =>
            t.categoryId.equals(categoryId) &
            t.isActive.equals(true) &
            t.isDeleted.equals(false),
      );
    } catch (e) {
      session.log(
        'Get products by category error: $e',
        level: LogLevel.warning,
      );
      rethrow;
    }
  }

  /// Get product by ID
  Future<Product?> getProductById(Session session, int productId) async {
    try {
      return await Product.db.findById(session, productId);
    } catch (e) {
      session.log('Get product by ID error: $e', level: LogLevel.warning);
      return null;
    }
  }

  /// Create product (admin only)
  Future<Product> createProduct(
    Session session,
    String name,
    String? description,
    double price,
    int categoryId,
    double stockQuantity,
    double minStockAlert,
    String? imageUrl, {
    bool isBulkProduct = false,
    String? bulkUnit,
    double? bulkTotalQuantity,
  }) async {
    try {
      if (price < 0) {
        throw Exception('Le prix ne peut pas être négatif');
      }

      // Validate bulk product fields
      if (isBulkProduct) {
        if (bulkUnit == null || bulkUnit.isEmpty) {
          throw Exception('L\'unité est requise pour un produit en vrac');
        }
        if (bulkTotalQuantity == null || bulkTotalQuantity <= 0) {
          throw Exception('La quantité totale doit être positive');
        }
      }

      final product = Product(
        name: name,
        description: description,
        price: price,
        categoryId: categoryId,
        stockQuantity: stockQuantity,
        minStockAlert: minStockAlert,
        imageUrl: imageUrl,
        isActive: true,
        isBulkProduct: isBulkProduct,
        bulkUnit: bulkUnit,
        bulkTotalQuantity: bulkTotalQuantity,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      return await Product.db.insertRow(session, product);
    } catch (e) {
      session.log('Create product error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Update product (admin only)
  Future<Product> updateProduct(
    Session session,
    int productId,
    String name,
    String? description,
    double price,
    int categoryId,
    double minStockAlert,
    String? imageUrl, {
    bool? isBulkProduct,
    String? bulkUnit,
    double? bulkTotalQuantity,
    double? stockQuantity,
  }) async {
    try {
      final product = await Product.db.findById(session, productId);

      if (product == null) {
        throw Exception('Produit non trouvé');
      }

      if (price < 0) {
        throw Exception('Le prix ne peut pas être négatif');
      }

      // Validate bulk product fields
      final isBulk = isBulkProduct ?? product.isBulkProduct;
      if (isBulk) {
        final unit = bulkUnit ?? product.bulkUnit;
        final quantity = bulkTotalQuantity ?? product.bulkTotalQuantity;

        if (unit == null || unit.isEmpty) {
          throw Exception('L\'unité est requise pour un produit en vrac');
        }
        if (quantity == null || quantity <= 0) {
          throw Exception('La quantité totale doit être positive');
        }
      }

      product.name = name;
      product.description = description;
      product.price = price;
      product.categoryId = categoryId;
      product.minStockAlert = minStockAlert;
      product.imageUrl = imageUrl;
      product.isBulkProduct = isBulkProduct ?? product.isBulkProduct;
      product.bulkUnit = bulkUnit;
      product.bulkTotalQuantity = bulkTotalQuantity;
      if (stockQuantity != null) {
        product.stockQuantity = stockQuantity;
      }
      product.updatedAt = DateTime.now();

      return await Product.db.updateRow(session, product);
    } catch (e) {
      session.log('Update product error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Delete/Remove product permanently from list (admin only)
  /// Sets isDeleted=true, product stays in DB for referential integrity
  Future<void> deleteProduct(Session session, int productId) async {
    try {
      final product = await Product.db.findById(session, productId);

      if (product == null) {
        throw Exception('Produit non trouvé');
      }

      product.isDeleted = true;
      product.isActive = false;
      product.updatedAt = DateTime.now();

      await Product.db.updateRow(session, product);
    } catch (e) {
      session.log('Delete product error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Toggle product active status (admin only)
  /// Activate or deactivate without deleting
  Future<Product> toggleActiveStatus(
    Session session,
    int productId,
    bool isActive,
  ) async {
    try {
      final product = await Product.db.findById(session, productId);

      if (product == null) {
        throw Exception('Produit non trouvé');
      }

      if (product.isDeleted) {
        throw Exception('Impossible de modifier un produit supprimé');
      }

      product.isActive = isActive;
      product.updatedAt = DateTime.now();

      return await Product.db.updateRow(session, product);
    } catch (e) {
      session.log('Toggle active status error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Update product stock quantity (admin only)
  /// Can be used to increase or decrease stock
  Future<Product> updateStock(
    Session session,
    int productId,
    double newStockQuantity,
  ) async {
    try {
      final product = await Product.db.findById(session, productId);

      if (product == null) {
        throw Exception('Produit non trouvé');
      }

      if (newStockQuantity < 0) {
        throw Exception('La quantité en stock ne peut pas être négative');
      }

      product.stockQuantity = newStockQuantity;
      product.updatedAt = DateTime.now();

      return await Product.db.updateRow(session, product);
    } catch (e) {
      session.log('Update stock error: $e', level: LogLevel.warning);
      rethrow;
    }
  }
}
