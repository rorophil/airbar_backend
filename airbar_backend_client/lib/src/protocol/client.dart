/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i1;
import 'package:serverpod_client/serverpod_client.dart' as _i2;
import 'dart:async' as _i3;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i4;
import 'package:airbar_backend_client/src/protocol/auth/user.dart' as _i5;
import 'package:airbar_backend_client/src/protocol/auth/user_role.dart' as _i6;
import 'package:airbar_backend_client/src/protocol/transactions/transaction.dart'
    as _i7;
import 'package:airbar_backend_client/src/protocol/shop/cart_item.dart' as _i8;
import 'package:airbar_backend_client/src/protocol/shop/product_category.dart'
    as _i9;
import 'package:airbar_backend_client/src/protocol/shop/product.dart' as _i10;
import 'package:airbar_backend_client/src/protocol/shop/product_portion.dart'
    as _i11;
import 'package:airbar_backend_client/src/protocol/stock/stock_movement.dart'
    as _i12;
import 'package:airbar_backend_client/src/protocol/stock/movement_type.dart'
    as _i13;
import 'package:airbar_backend_client/src/protocol/transactions/transaction_type.dart'
    as _i14;
import 'package:airbar_backend_client/src/protocol/transactions/transaction_item.dart'
    as _i15;
import 'package:airbar_backend_client/src/protocol/greetings/greeting.dart'
    as _i16;
import 'protocol.dart' as _i17;

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _i1.EndpointEmailIdpBase {
  EndpointEmailIdp(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i3.Future<_i4.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _i3.Future<_i2.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_i2.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _i3.Future<String> verifyRegistrationCode({
    required _i2.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _i3.Future<_i4.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _i3.Future<_i2.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_i2.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _i3.Future<String> verifyPasswordResetCode({
    required _i2.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i3.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );

  @override
  _i3.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'emailIdp',
    'hasAccount',
    {},
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _i4.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _i3.Future<_i4.AuthSuccess> refreshAccessToken({
    required String refreshToken,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'jwtRefresh',
    'refreshAccessToken',
    {'refreshToken': refreshToken},
    authenticated: false,
  );
}

/// Endpoint for authentication operations
/// {@category Endpoint}
class EndpointAuth extends _i2.EndpointRef {
  EndpointAuth(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  /// Login with email and password
  _i3.Future<_i5.User?> login(
    String email,
    String password,
  ) => caller.callServerEndpoint<_i5.User?>(
    'auth',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Validate PIN code for checkout
  _i3.Future<bool> validatePin(
    int userId,
    String pin,
  ) => caller.callServerEndpoint<bool>(
    'auth',
    'validatePin',
    {
      'userId': userId,
      'pin': pin,
    },
  );

  /// Change PIN code
  _i3.Future<void> changePin(
    int userId,
    String oldPin,
    String newPin,
  ) => caller.callServerEndpoint<void>(
    'auth',
    'changePin',
    {
      'userId': userId,
      'oldPin': oldPin,
      'newPin': newPin,
    },
  );
}

/// Endpoint for user management (admin operations)
/// {@category Endpoint}
class EndpointUser extends _i2.EndpointRef {
  EndpointUser(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  /// Get all users (admin only)
  _i3.Future<List<_i5.User>> getAllUsers() =>
      caller.callServerEndpoint<List<_i5.User>>(
        'user',
        'getAllUsers',
        {},
      );

  /// Get user by ID
  _i3.Future<_i5.User?> getUserById(int userId) =>
      caller.callServerEndpoint<_i5.User?>(
        'user',
        'getUserById',
        {'userId': userId},
      );

  /// Create new user (admin only)
  _i3.Future<_i5.User> createUser(
    String email,
    String password,
    String firstName,
    String lastName,
    String pin,
    _i6.UserRole role,
  ) => caller.callServerEndpoint<_i5.User>(
    'user',
    'createUser',
    {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'pin': pin,
      'role': role,
    },
  );

  /// Update user (admin only)
  _i3.Future<_i5.User> updateUser(
    int userId,
    String email,
    String firstName,
    String lastName,
    _i6.UserRole role,
  ) => caller.callServerEndpoint<_i5.User>(
    'user',
    'updateUser',
    {
      'userId': userId,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
    },
  );

  /// Deactivate user (soft delete, admin only)
  _i3.Future<void> deactivateUser(int userId) =>
      caller.callServerEndpoint<void>(
        'user',
        'deactivateUser',
        {'userId': userId},
      );

  /// Reactivate user (admin only)
  _i3.Future<void> reactivateUser(int userId) =>
      caller.callServerEndpoint<void>(
        'user',
        'reactivateUser',
        {'userId': userId},
      );

  /// Reset user password (admin only)
  _i3.Future<void> resetPassword(
    int userId,
    String newPassword,
  ) => caller.callServerEndpoint<void>(
    'user',
    'resetPassword',
    {
      'userId': userId,
      'newPassword': newPassword,
    },
  );

  /// Reset user PIN code (admin only)
  _i3.Future<void> resetPin(
    int userId,
    String newPin,
  ) => caller.callServerEndpoint<void>(
    'user',
    'resetPin',
    {
      'userId': userId,
      'newPin': newPin,
    },
  );

  /// Delete user (hard delete, admin only)
  _i3.Future<void> deleteUser(int userId) => caller.callServerEndpoint<void>(
    'user',
    'deleteUser',
    {'userId': userId},
  );

  /// Credit or debit user account (admin only)
  _i3.Future<_i7.Transaction> creditAccount(
    int userId,
    double amount,
    String? notes,
  ) => caller.callServerEndpoint<_i7.Transaction>(
    'user',
    'creditAccount',
    {
      'userId': userId,
      'amount': amount,
      'notes': notes,
    },
  );
}

/// Endpoint for shopping cart management (real-time sync)
/// {@category Endpoint}
class EndpointCart extends _i2.EndpointRef {
  EndpointCart(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'cart';

  /// Get user's cart
  _i3.Future<List<_i8.CartItem>> getCart(int userId) =>
      caller.callServerEndpoint<List<_i8.CartItem>>(
        'cart',
        'getCart',
        {'userId': userId},
      );

  /// Add item to cart
  _i3.Future<_i8.CartItem> addToCart(
    int userId,
    int productId,
    int quantity, {
    int? productPortionId,
  }) => caller.callServerEndpoint<_i8.CartItem>(
    'cart',
    'addToCart',
    {
      'userId': userId,
      'productId': productId,
      'quantity': quantity,
      'productPortionId': productPortionId,
    },
  );

  /// Update cart item quantity
  _i3.Future<_i8.CartItem> updateCartItem(
    int userId,
    int productId,
    int quantity, {
    int? productPortionId,
  }) => caller.callServerEndpoint<_i8.CartItem>(
    'cart',
    'updateCartItem',
    {
      'userId': userId,
      'productId': productId,
      'quantity': quantity,
      'productPortionId': productPortionId,
    },
  );

  /// Remove item from cart
  _i3.Future<void> removeFromCart(
    int userId,
    int productId, {
    int? productPortionId,
  }) => caller.callServerEndpoint<void>(
    'cart',
    'removeFromCart',
    {
      'userId': userId,
      'productId': productId,
      'productPortionId': productPortionId,
    },
  );

  /// Clear entire cart for user
  _i3.Future<void> clearCart(int userId) => caller.callServerEndpoint<void>(
    'cart',
    'clearCart',
    {'userId': userId},
  );
}

/// Endpoint for product category management
/// {@category Endpoint}
class EndpointCategory extends _i2.EndpointRef {
  EndpointCategory(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'category';

  /// Get all categories and ensure "Sans catégorie" exists
  _i3.Future<List<_i9.ProductCategory>> getCategories() =>
      caller.callServerEndpoint<List<_i9.ProductCategory>>(
        'category',
        'getCategories',
        {},
      );

  /// Get active categories only
  _i3.Future<List<_i9.ProductCategory>> getActiveCategories() =>
      caller.callServerEndpoint<List<_i9.ProductCategory>>(
        'category',
        'getActiveCategories',
        {},
      );

  /// Create category (admin only)
  _i3.Future<_i9.ProductCategory> createCategory(
    String name,
    String? description,
    String? iconName,
    int displayOrder,
  ) => caller.callServerEndpoint<_i9.ProductCategory>(
    'category',
    'createCategory',
    {
      'name': name,
      'description': description,
      'iconName': iconName,
      'displayOrder': displayOrder,
    },
  );

  /// Update category (admin only)
  _i3.Future<_i9.ProductCategory> updateCategory(
    int categoryId,
    String name,
    String? description,
    String? iconName,
    int displayOrder,
  ) => caller.callServerEndpoint<_i9.ProductCategory>(
    'category',
    'updateCategory',
    {
      'categoryId': categoryId,
      'name': name,
      'description': description,
      'iconName': iconName,
      'displayOrder': displayOrder,
    },
  );

  /// Delete category (admin only)
  /// Products in this category will be moved to "Sans catégorie"
  _i3.Future<void> deleteCategory(int categoryId) =>
      caller.callServerEndpoint<void>(
        'category',
        'deleteCategory',
        {'categoryId': categoryId},
      );
}

/// Endpoint for product management
/// {@category Endpoint}
class EndpointProduct extends _i2.EndpointRef {
  EndpointProduct(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'product';

  /// Get all products
  _i3.Future<List<_i10.Product>> getAllProducts({
    bool? activeOnly,
    required bool includeDeleted,
  }) => caller.callServerEndpoint<List<_i10.Product>>(
    'product',
    'getAllProducts',
    {
      'activeOnly': activeOnly,
      'includeDeleted': includeDeleted,
    },
  );

  /// Get products by category
  _i3.Future<List<_i10.Product>> getProductsByCategory(int categoryId) =>
      caller.callServerEndpoint<List<_i10.Product>>(
        'product',
        'getProductsByCategory',
        {'categoryId': categoryId},
      );

  /// Get product by ID
  _i3.Future<_i10.Product?> getProductById(int productId) =>
      caller.callServerEndpoint<_i10.Product?>(
        'product',
        'getProductById',
        {'productId': productId},
      );

  /// Create product (admin only)
  _i3.Future<_i10.Product> createProduct(
    String name,
    String? description,
    double price,
    int categoryId,
    int stockQuantity,
    int minStockAlert,
    String? imageUrl, {
    required bool isBulkProduct,
    String? bulkUnit,
    double? bulkTotalQuantity,
    double? currentUnitRemaining,
    required bool trackStock,
  }) => caller.callServerEndpoint<_i10.Product>(
    'product',
    'createProduct',
    {
      'name': name,
      'description': description,
      'price': price,
      'categoryId': categoryId,
      'stockQuantity': stockQuantity,
      'minStockAlert': minStockAlert,
      'imageUrl': imageUrl,
      'isBulkProduct': isBulkProduct,
      'bulkUnit': bulkUnit,
      'bulkTotalQuantity': bulkTotalQuantity,
      'currentUnitRemaining': currentUnitRemaining,
      'trackStock': trackStock,
    },
  );

  /// Update product (admin only)
  _i3.Future<_i10.Product> updateProduct(
    int productId,
    String name,
    String? description,
    double price,
    int categoryId,
    int minStockAlert,
    String? imageUrl, {
    bool? isBulkProduct,
    String? bulkUnit,
    double? bulkTotalQuantity,
    int? stockQuantity,
    double? currentUnitRemaining,
    bool? trackStock,
  }) => caller.callServerEndpoint<_i10.Product>(
    'product',
    'updateProduct',
    {
      'productId': productId,
      'name': name,
      'description': description,
      'price': price,
      'categoryId': categoryId,
      'minStockAlert': minStockAlert,
      'imageUrl': imageUrl,
      'isBulkProduct': isBulkProduct,
      'bulkUnit': bulkUnit,
      'bulkTotalQuantity': bulkTotalQuantity,
      'stockQuantity': stockQuantity,
      'currentUnitRemaining': currentUnitRemaining,
      'trackStock': trackStock,
    },
  );

  /// Delete/Remove product permanently from list (admin only)
  /// Sets isDeleted=true, product stays in DB for referential integrity
  _i3.Future<void> deleteProduct(int productId) =>
      caller.callServerEndpoint<void>(
        'product',
        'deleteProduct',
        {'productId': productId},
      );

  /// Toggle product active status (admin only)
  /// Activate or deactivate without deleting
  _i3.Future<_i10.Product> toggleActiveStatus(
    int productId,
    bool isActive,
  ) => caller.callServerEndpoint<_i10.Product>(
    'product',
    'toggleActiveStatus',
    {
      'productId': productId,
      'isActive': isActive,
    },
  );

  /// Update product stock quantity (admin only)
  /// Can be used to increase or decrease stock
  _i3.Future<_i10.Product> updateStock(
    int productId,
    int newStockQuantity,
  ) => caller.callServerEndpoint<_i10.Product>(
    'product',
    'updateStock',
    {
      'productId': productId,
      'newStockQuantity': newStockQuantity,
    },
  );
}

/// Endpoint for product portion management
/// {@category Endpoint}
class EndpointProductPortion extends _i2.EndpointRef {
  EndpointProductPortion(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'productPortion';

  /// Get all portions for a product
  _i3.Future<List<_i11.ProductPortion>> getProductPortions(
    int productId, {
    required bool activeOnly,
  }) => caller.callServerEndpoint<List<_i11.ProductPortion>>(
    'productPortion',
    'getProductPortions',
    {
      'productId': productId,
      'activeOnly': activeOnly,
    },
  );

  /// Get portion by ID
  _i3.Future<_i11.ProductPortion?> getPortionById(int portionId) =>
      caller.callServerEndpoint<_i11.ProductPortion?>(
        'productPortion',
        'getPortionById',
        {'portionId': portionId},
      );

  /// Create product portion (admin only)
  _i3.Future<_i11.ProductPortion> createPortion(
    int productId,
    String name,
    double quantity,
    double price, {
    required int displayOrder,
  }) => caller.callServerEndpoint<_i11.ProductPortion>(
    'productPortion',
    'createPortion',
    {
      'productId': productId,
      'name': name,
      'quantity': quantity,
      'price': price,
      'displayOrder': displayOrder,
    },
  );

  /// Update product portion (admin only)
  _i3.Future<_i11.ProductPortion> updatePortion(
    int portionId,
    String name,
    double quantity,
    double price, {
    int? displayOrder,
  }) => caller.callServerEndpoint<_i11.ProductPortion>(
    'productPortion',
    'updatePortion',
    {
      'portionId': portionId,
      'name': name,
      'quantity': quantity,
      'price': price,
      'displayOrder': displayOrder,
    },
  );

  /// Delete/Deactivate portion (admin only)
  _i3.Future<void> deletePortion(int portionId) =>
      caller.callServerEndpoint<void>(
        'productPortion',
        'deletePortion',
        {'portionId': portionId},
      );
}

/// Endpoint for stock management
/// {@category Endpoint}
class EndpointStock extends _i2.EndpointRef {
  EndpointStock(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'stock';

  /// Restock product (admin only)
  _i3.Future<void> restockProduct(
    int productId,
    int quantity,
    int adminUserId,
    String? notes,
  ) => caller.callServerEndpoint<void>(
    'stock',
    'restockProduct',
    {
      'productId': productId,
      'quantity': quantity,
      'adminUserId': adminUserId,
      'notes': notes,
    },
  );

  /// Adjust stock (inventory correction, admin only)
  _i3.Future<void> adjustStock(
    int productId,
    int newQuantity,
    int adminUserId,
    String reason,
  ) => caller.callServerEndpoint<void>(
    'stock',
    'adjustStock',
    {
      'productId': productId,
      'newQuantity': newQuantity,
      'adminUserId': adminUserId,
      'reason': reason,
    },
  );

  /// Get stock history for a product
  _i3.Future<List<_i12.StockMovement>> getStockHistory(
    int productId, {
    DateTime? startDate,
    DateTime? endDate,
  }) => caller.callServerEndpoint<List<_i12.StockMovement>>(
    'stock',
    'getStockHistory',
    {
      'productId': productId,
      'startDate': startDate,
      'endDate': endDate,
    },
  );

  /// Get all stock movements (admin only)
  _i3.Future<List<_i12.StockMovement>> getAllStockMovements({
    _i13.MovementType? type,
    DateTime? startDate,
    DateTime? endDate,
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i12.StockMovement>>(
    'stock',
    'getAllStockMovements',
    {
      'type': type,
      'startDate': startDate,
      'endDate': endDate,
      'limit': limit,
      'offset': offset,
    },
  );

  /// Get products with low stock (below alert threshold)
  _i3.Future<List<_i10.Product>> getLowStockProducts() =>
      caller.callServerEndpoint<List<_i10.Product>>(
        'stock',
        'getLowStockProducts',
        {},
      );
}

/// Endpoint for transaction management and checkout
/// {@category Endpoint}
class EndpointTransaction extends _i2.EndpointRef {
  EndpointTransaction(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'transaction';

  /// Checkout - Create purchase transaction (atomic operation)
  _i3.Future<_i7.Transaction> checkout(
    int userId,
    String pin,
  ) => caller.callServerEndpoint<_i7.Transaction>(
    'transaction',
    'checkout',
    {
      'userId': userId,
      'pin': pin,
    },
  );

  /// Refund transaction (admin only)
  _i3.Future<_i7.Transaction> refundTransaction(
    int transactionId,
    String reason,
  ) => caller.callServerEndpoint<_i7.Transaction>(
    'transaction',
    'refundTransaction',
    {
      'transactionId': transactionId,
      'reason': reason,
    },
  );

  /// Get user transactions with pagination
  _i3.Future<List<_i7.Transaction>> getUserTransactions(
    int userId, {
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i7.Transaction>>(
    'transaction',
    'getUserTransactions',
    {
      'userId': userId,
      'limit': limit,
      'offset': offset,
    },
  );

  /// Get all transactions (admin only, with pagination)
  _i3.Future<List<_i7.Transaction>> getAllTransactions({
    required int limit,
    required int offset,
    _i14.TransactionType? type,
    DateTime? startDate,
    DateTime? endDate,
  }) => caller.callServerEndpoint<List<_i7.Transaction>>(
    'transaction',
    'getAllTransactions',
    {
      'limit': limit,
      'offset': offset,
      'type': type,
      'startDate': startDate,
      'endDate': endDate,
    },
  );

  /// Get transaction items for a specific transaction
  _i3.Future<List<_i15.TransactionItem>> getTransactionItems(
    int transactionId,
  ) => caller.callServerEndpoint<List<_i15.TransactionItem>>(
    'transaction',
    'getTransactionItems',
    {'transactionId': transactionId},
  );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i2.EndpointRef {
  EndpointGreeting(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i3.Future<_i16.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i16.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _i1.Caller(client);
    serverpod_auth_core = _i4.Caller(client);
  }

  late final _i1.Caller serverpod_auth_idp;

  late final _i4.Caller serverpod_auth_core;
}

class Client extends _i2.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i2.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i2.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i17.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    auth = EndpointAuth(this);
    user = EndpointUser(this);
    cart = EndpointCart(this);
    category = EndpointCategory(this);
    product = EndpointProduct(this);
    productPortion = EndpointProductPortion(this);
    stock = EndpointStock(this);
    transaction = EndpointTransaction(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointAuth auth;

  late final EndpointUser user;

  late final EndpointCart cart;

  late final EndpointCategory category;

  late final EndpointProduct product;

  late final EndpointProductPortion productPortion;

  late final EndpointStock stock;

  late final EndpointTransaction transaction;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _i2.EndpointRef> get endpointRefLookup => {
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'auth': auth,
    'user': user,
    'cart': cart,
    'category': category,
    'product': product,
    'productPortion': productPortion,
    'stock': stock,
    'transaction': transaction,
    'greeting': greeting,
  };

  @override
  Map<String, _i2.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
