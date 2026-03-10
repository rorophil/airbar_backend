import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart';

/// Endpoint for product category management
class CategoryEndpoint extends Endpoint {
  /// Get all categories and ensure "Sans catégorie" exists
  Future<List<ProductCategory>> getCategories(Session session) async {
    try {
      // Ensure "Sans catégorie" exists
      await _ensureUncategorizedExists(session);

      // Assign orphan products to "Sans catégorie"
      await _assignOrphanProducts(session);

      return await ProductCategory.db.find(
        session,
        orderBy: (t) => t.displayOrder,
      );
    } catch (e) {
      session.log('Get categories error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Ensure "Sans catégorie" exists
  Future<ProductCategory> _ensureUncategorizedExists(Session session) async {
    var uncategorized = await ProductCategory.db.findFirstRow(
      session,
      where: (t) => t.name.equals('Sans catégorie'),
    );

    if (uncategorized == null) {
      uncategorized = ProductCategory(
        name: 'Sans catégorie',
        description: 'Produits sans catégorie assignée',
        displayOrder: 999,
        iconName: 'category',
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      uncategorized = await ProductCategory.db.insertRow(
        session,
        uncategorized,
      );
      session.log('Created "Sans catégorie" category');
    }

    return uncategorized;
  }

  /// Assign orphan products (without valid category) to "Sans catégorie"
  Future<void> _assignOrphanProducts(Session session) async {
    try {
      // Get "Sans catégorie" category
      final uncategorized = await ProductCategory.db.findFirstRow(
        session,
        where: (t) => t.name.equals('Sans catégorie'),
      );

      if (uncategorized == null) return;

      // Get all valid category IDs
      final categories = await ProductCategory.db.find(session);
      final validCategoryIds = categories.map((c) => c.id!).toSet();

      // Find products with invalid category IDs
      final allProducts = await Product.db.find(session);

      for (var product in allProducts) {
        if (!validCategoryIds.contains(product.categoryId)) {
          product.categoryId = uncategorized.id!;
          product.updatedAt = DateTime.now();
          await Product.db.updateRow(session, product);
          session.log(
            'Assigned orphan product ${product.name} to "Sans catégorie"',
          );
        }
      }
    } catch (e) {
      session.log('Assign orphan products error: $e', level: LogLevel.warning);
      // Don't rethrow, this is not critical
    }
  }

  /// Get active categories only
  Future<List<ProductCategory>> getActiveCategories(Session session) async {
    try {
      return await ProductCategory.db.find(
        session,
        where: (t) => t.isActive.equals(true),
        orderBy: (t) => t.displayOrder,
      );
    } catch (e) {
      session.log('Get active categories error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Create category (admin only)
  Future<ProductCategory> createCategory(
    Session session,
    String name,
    String? description,
    String? iconName,
    int displayOrder,
  ) async {
    try {
      final category = ProductCategory(
        name: name,
        description: description,
        iconName: iconName,
        displayOrder: displayOrder,
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      return await ProductCategory.db.insertRow(session, category);
    } catch (e) {
      session.log('Create category error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Update category (admin only)
  Future<ProductCategory> updateCategory(
    Session session,
    int categoryId,
    String name,
    String? description,
    String? iconName,
    int displayOrder,
  ) async {
    try {
      final category = await ProductCategory.db.findById(session, categoryId);

      if (category == null) {
        throw Exception('Catégorie non trouvée');
      }

      category.name = name;
      category.description = description;
      category.iconName = iconName;
      category.displayOrder = displayOrder;
      category.updatedAt = DateTime.now();

      return await ProductCategory.db.updateRow(session, category);
    } catch (e) {
      session.log('Update category error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Delete category (admin only)
  /// Products in this category will be moved to "Sans catégorie"
  Future<void> deleteCategory(Session session, int categoryId) async {
    try {
      // Don't allow deletion of "Sans catégorie"
      final category = await ProductCategory.db.findById(session, categoryId);
      if (category?.name == 'Sans catégorie') {
        throw Exception(
          'La catégorie "Sans catégorie" ne peut pas être supprimée',
        );
      }

      // Find or create "Sans catégorie" category
      final uncategorized = await _ensureUncategorizedExists(session);

      // Move all products from this category to "Sans catégorie"
      final products = await Product.db.find(
        session,
        where: (t) => t.categoryId.equals(categoryId),
      );

      for (var product in products) {
        product.categoryId = uncategorized.id!;
        product.updatedAt = DateTime.now();
        await Product.db.updateRow(session, product);
      }

      // Delete the category
      await ProductCategory.db.deleteWhere(
        session,
        where: (t) => t.id.equals(categoryId),
      );

      session.log(
        'Category deleted, ${products.length} products moved to uncategorized',
      );
    } catch (e) {
      session.log('Delete category error: $e', level: LogLevel.warning);
      rethrow;
    }
  }
}
