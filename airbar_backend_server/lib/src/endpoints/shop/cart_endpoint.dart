import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart';

/// Endpoint for shopping cart management (real-time sync)
class CartEndpoint extends Endpoint {
  /// Get user's cart
  Future<List<CartItem>> getCart(Session session, int userId) async {
    try {
      return await CartItem.db.find(
        session,
        where: (t) => t.userId.equals(userId),
      );
    } catch (e) {
      session.log('Get cart error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Add item to cart
  Future<CartItem> addToCart(
    Session session,
    int userId,
    int productId,
    int quantity, {
    int? productPortionId,
  }) async {
    try {
      if (quantity <= 0) {
        throw Exception('La quantité doit être positive');
      }

      // Check if item already exists in cart (including portion)
      final existingItems = await CartItem.db.find(
        session,
        where: (t) {
          var condition =
              t.userId.equals(userId) & t.productId.equals(productId);
          if (productPortionId != null) {
            condition = condition & t.productPortionId.equals(productPortionId);
          } else {
            condition = condition & t.productPortionId.equals(null);
          }
          return condition;
        },
      );

      if (existingItems.isNotEmpty) {
        // Update quantity
        final item = existingItems.first;
        item.quantity += quantity;
        return await CartItem.db.updateRow(session, item);
      } else {
        // Create new cart item
        final cartItem = CartItem(
          userId: userId,
          productId: productId,
          productPortionId: productPortionId,
          quantity: quantity,
          addedAt: DateTime.now(),
        );

        return await CartItem.db.insertRow(session, cartItem);
      }
    } catch (e) {
      session.log('Add to cart error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Update cart item quantity
  Future<CartItem> updateCartItem(
    Session session,
    int userId,
    int productId,
    int quantity, {
    int? productPortionId,
  }) async {
    try {
      if (quantity <= 0) {
        throw Exception('La quantité doit être positive');
      }

      final items = await CartItem.db.find(
        session,
        where: (t) {
          var condition =
              t.userId.equals(userId) & t.productId.equals(productId);
          if (productPortionId != null) {
            condition = condition & t.productPortionId.equals(productPortionId);
          } else {
            condition = condition & t.productPortionId.equals(null);
          }
          return condition;
        },
      );

      if (items.isEmpty) {
        throw Exception('Article non trouvé dans le panier');
      }

      final item = items.first;
      item.quantity = quantity;

      return await CartItem.db.updateRow(session, item);
    } catch (e) {
      session.log('Update cart item error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Remove item from cart
  Future<void> removeFromCart(
    Session session,
    int userId,
    int productId, {
    int? productPortionId,
  }) async {
    try {
      final items = await CartItem.db.find(
        session,
        where: (t) {
          var condition =
              t.userId.equals(userId) & t.productId.equals(productId);
          if (productPortionId != null) {
            condition = condition & t.productPortionId.equals(productPortionId);
          } else {
            condition = condition & t.productPortionId.equals(null);
          }
          return condition;
        },
      );

      if (items.isNotEmpty) {
        await CartItem.db.deleteWhere(
          session,
          where: (t) => t.id.equals(items.first.id!),
        );
      }
    } catch (e) {
      session.log('Remove from cart error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Clear entire cart for user
  Future<void> clearCart(Session session, int userId) async {
    try {
      await CartItem.db.deleteWhere(
        session,
        where: (t) => t.userId.equals(userId),
      );
    } catch (e) {
      session.log('Clear cart error: $e', level: LogLevel.warning);
      rethrow;
    }
  }
}
