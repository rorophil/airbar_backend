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
import 'package:serverpod/serverpod.dart' as _i1;
import '../auth/email_idp_endpoint.dart' as _i2;
import '../auth/jwt_refresh_endpoint.dart' as _i3;
import '../endpoints/auth/auth_endpoint.dart' as _i4;
import '../endpoints/auth/user_endpoint.dart' as _i5;
import '../endpoints/cashier/cashier_endpoint.dart' as _i6;
import '../endpoints/shop/cart_endpoint.dart' as _i7;
import '../endpoints/shop/category_endpoint.dart' as _i8;
import '../endpoints/shop/product_endpoint.dart' as _i9;
import '../endpoints/shop/product_portion_endpoint.dart' as _i10;
import '../endpoints/stock/stock_endpoint.dart' as _i11;
import '../endpoints/transactions/transaction_endpoint.dart' as _i12;
import '../greetings/greeting_endpoint.dart' as _i13;
import 'package:airbar_backend_server/src/generated/auth/user_role.dart'
    as _i14;
import 'package:airbar_backend_server/src/generated/cashier/cash_sale_item_data.dart'
    as _i15;
import 'package:airbar_backend_server/src/generated/transactions/payment_method.dart'
    as _i16;
import 'package:airbar_backend_server/src/generated/stock/movement_type.dart'
    as _i17;
import 'package:airbar_backend_server/src/generated/transactions/transaction_type.dart'
    as _i18;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i19;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i20;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'emailIdp': _i2.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _i3.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'auth': _i4.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'user': _i5.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
      'cashier': _i6.CashierEndpoint()
        ..initialize(
          server,
          'cashier',
          null,
        ),
      'cart': _i7.CartEndpoint()
        ..initialize(
          server,
          'cart',
          null,
        ),
      'category': _i8.CategoryEndpoint()
        ..initialize(
          server,
          'category',
          null,
        ),
      'product': _i9.ProductEndpoint()
        ..initialize(
          server,
          'product',
          null,
        ),
      'productPortion': _i10.ProductPortionEndpoint()
        ..initialize(
          server,
          'productPortion',
          null,
        ),
      'stock': _i11.StockEndpoint()
        ..initialize(
          server,
          'stock',
          null,
        ),
      'transaction': _i12.TransactionEndpoint()
        ..initialize(
          server,
          'transaction',
          null,
        ),
      'greeting': _i13.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['emailIdp'] = _i1.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint).login(
                session,
                email: params['email'],
                password: params['password'],
              ),
        ),
        'startRegistration': _i1.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _i1.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _i1.ParameterDescription(
              name: 'accountRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _i1.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _i1.ParameterDescription(
              name: 'registrationToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _i1.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _i1.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _i1.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _i1.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _i1.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _i1.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _i1.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _i1.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _i1.ParameterDescription(
              name: 'refreshToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['jwtRefresh'] as _i3.JwtRefreshEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
                  ),
        ),
      },
    );
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i4.AuthEndpoint).login(
                session,
                params['email'],
                params['password'],
              ),
        ),
        'validatePin': _i1.MethodConnector(
          name: 'validatePin',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'pin': _i1.ParameterDescription(
              name: 'pin',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i4.AuthEndpoint).validatePin(
                session,
                params['userId'],
                params['pin'],
              ),
        ),
        'changePin': _i1.MethodConnector(
          name: 'changePin',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'oldPin': _i1.ParameterDescription(
              name: 'oldPin',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPin': _i1.ParameterDescription(
              name: 'newPin',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i4.AuthEndpoint).changePin(
                session,
                params['userId'],
                params['oldPin'],
                params['newPin'],
              ),
        ),
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'getAllUsers': _i1.MethodConnector(
          name: 'getAllUsers',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['user'] as _i5.UserEndpoint).getAllUsers(session),
        ),
        'getUserById': _i1.MethodConnector(
          name: 'getUserById',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i5.UserEndpoint).getUserById(
                session,
                params['userId'],
              ),
        ),
        'createUser': _i1.MethodConnector(
          name: 'createUser',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'firstName': _i1.ParameterDescription(
              name: 'firstName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'lastName': _i1.ParameterDescription(
              name: 'lastName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'pin': _i1.ParameterDescription(
              name: 'pin',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'role': _i1.ParameterDescription(
              name: 'role',
              type: _i1.getType<_i14.UserRole>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i5.UserEndpoint).createUser(
                session,
                params['email'],
                params['password'],
                params['firstName'],
                params['lastName'],
                params['pin'],
                params['role'],
              ),
        ),
        'updateUser': _i1.MethodConnector(
          name: 'updateUser',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'firstName': _i1.ParameterDescription(
              name: 'firstName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'lastName': _i1.ParameterDescription(
              name: 'lastName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'role': _i1.ParameterDescription(
              name: 'role',
              type: _i1.getType<_i14.UserRole>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i5.UserEndpoint).updateUser(
                session,
                params['userId'],
                params['email'],
                params['firstName'],
                params['lastName'],
                params['role'],
              ),
        ),
        'deactivateUser': _i1.MethodConnector(
          name: 'deactivateUser',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i5.UserEndpoint).deactivateUser(
                session,
                params['userId'],
              ),
        ),
        'reactivateUser': _i1.MethodConnector(
          name: 'reactivateUser',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i5.UserEndpoint).reactivateUser(
                session,
                params['userId'],
              ),
        ),
        'resetPassword': _i1.MethodConnector(
          name: 'resetPassword',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i5.UserEndpoint).resetPassword(
                session,
                params['userId'],
                params['newPassword'],
              ),
        ),
        'resetPin': _i1.MethodConnector(
          name: 'resetPin',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'newPin': _i1.ParameterDescription(
              name: 'newPin',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i5.UserEndpoint).resetPin(
                session,
                params['userId'],
                params['newPin'],
              ),
        ),
        'deleteUser': _i1.MethodConnector(
          name: 'deleteUser',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i5.UserEndpoint).deleteUser(
                session,
                params['userId'],
              ),
        ),
        'creditAccount': _i1.MethodConnector(
          name: 'creditAccount',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'amount': _i1.ParameterDescription(
              name: 'amount',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'notes': _i1.ParameterDescription(
              name: 'notes',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i5.UserEndpoint).creditAccount(
                session,
                params['userId'],
                params['amount'],
                params['notes'],
              ),
        ),
      },
    );
    connectors['cashier'] = _i1.EndpointConnector(
      name: 'cashier',
      endpoint: endpoints['cashier']!,
      methodConnectors: {
        'processCashSale': _i1.MethodConnector(
          name: 'processCashSale',
          params: {
            'sellerId': _i1.ParameterDescription(
              name: 'sellerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'items': _i1.ParameterDescription(
              name: 'items',
              type: _i1.getType<List<_i15.CashSaleItemData>>(),
              nullable: false,
            ),
            'paymentMethod': _i1.ParameterDescription(
              name: 'paymentMethod',
              type: _i1.getType<_i16.PaymentMethod>(),
              nullable: false,
            ),
            'pin': _i1.ParameterDescription(
              name: 'pin',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['cashier'] as _i6.CashierEndpoint).processCashSale(
                    session,
                    params['sellerId'],
                    params['items'],
                    params['paymentMethod'],
                    params['pin'],
                  ),
        ),
        'getSellerTransactions': _i1.MethodConnector(
          name: 'getSellerTransactions',
          params: {
            'sellerId': _i1.ParameterDescription(
              name: 'sellerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cashier'] as _i6.CashierEndpoint)
                  .getSellerTransactions(
                    session,
                    params['sellerId'],
                    limit: params['limit'],
                    offset: params['offset'],
                  ),
        ),
      },
    );
    connectors['cart'] = _i1.EndpointConnector(
      name: 'cart',
      endpoint: endpoints['cart']!,
      methodConnectors: {
        'getCart': _i1.MethodConnector(
          name: 'getCart',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cart'] as _i7.CartEndpoint).getCart(
                session,
                params['userId'],
              ),
        ),
        'addToCart': _i1.MethodConnector(
          name: 'addToCart',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'productPortionId': _i1.ParameterDescription(
              name: 'productPortionId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cart'] as _i7.CartEndpoint).addToCart(
                session,
                params['userId'],
                params['productId'],
                params['quantity'],
                productPortionId: params['productPortionId'],
              ),
        ),
        'updateCartItem': _i1.MethodConnector(
          name: 'updateCartItem',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'productPortionId': _i1.ParameterDescription(
              name: 'productPortionId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cart'] as _i7.CartEndpoint).updateCartItem(
                session,
                params['userId'],
                params['productId'],
                params['quantity'],
                productPortionId: params['productPortionId'],
              ),
        ),
        'removeFromCart': _i1.MethodConnector(
          name: 'removeFromCart',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'productPortionId': _i1.ParameterDescription(
              name: 'productPortionId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cart'] as _i7.CartEndpoint).removeFromCart(
                session,
                params['userId'],
                params['productId'],
                productPortionId: params['productPortionId'],
              ),
        ),
        'clearCart': _i1.MethodConnector(
          name: 'clearCart',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cart'] as _i7.CartEndpoint).clearCart(
                session,
                params['userId'],
              ),
        ),
      },
    );
    connectors['category'] = _i1.EndpointConnector(
      name: 'category',
      endpoint: endpoints['category']!,
      methodConnectors: {
        'getCategories': _i1.MethodConnector(
          name: 'getCategories',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['category'] as _i8.CategoryEndpoint)
                  .getCategories(session),
        ),
        'getActiveCategories': _i1.MethodConnector(
          name: 'getActiveCategories',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['category'] as _i8.CategoryEndpoint)
                  .getActiveCategories(session),
        ),
        'createCategory': _i1.MethodConnector(
          name: 'createCategory',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'iconName': _i1.ParameterDescription(
              name: 'iconName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'displayOrder': _i1.ParameterDescription(
              name: 'displayOrder',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['category'] as _i8.CategoryEndpoint)
                  .createCategory(
                    session,
                    params['name'],
                    params['description'],
                    params['iconName'],
                    params['displayOrder'],
                  ),
        ),
        'updateCategory': _i1.MethodConnector(
          name: 'updateCategory',
          params: {
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'iconName': _i1.ParameterDescription(
              name: 'iconName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'displayOrder': _i1.ParameterDescription(
              name: 'displayOrder',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['category'] as _i8.CategoryEndpoint)
                  .updateCategory(
                    session,
                    params['categoryId'],
                    params['name'],
                    params['description'],
                    params['iconName'],
                    params['displayOrder'],
                  ),
        ),
        'deleteCategory': _i1.MethodConnector(
          name: 'deleteCategory',
          params: {
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['category'] as _i8.CategoryEndpoint)
                  .deleteCategory(
                    session,
                    params['categoryId'],
                  ),
        ),
      },
    );
    connectors['product'] = _i1.EndpointConnector(
      name: 'product',
      endpoint: endpoints['product']!,
      methodConnectors: {
        'getAllProducts': _i1.MethodConnector(
          name: 'getAllProducts',
          params: {
            'activeOnly': _i1.ParameterDescription(
              name: 'activeOnly',
              type: _i1.getType<bool?>(),
              nullable: true,
            ),
            'includeDeleted': _i1.ParameterDescription(
              name: 'includeDeleted',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i9.ProductEndpoint).getAllProducts(
                    session,
                    activeOnly: params['activeOnly'],
                    includeDeleted: params['includeDeleted'],
                  ),
        ),
        'getProductsByCategory': _i1.MethodConnector(
          name: 'getProductsByCategory',
          params: {
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['product'] as _i9.ProductEndpoint)
                  .getProductsByCategory(
                    session,
                    params['categoryId'],
                  ),
        ),
        'getProductById': _i1.MethodConnector(
          name: 'getProductById',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i9.ProductEndpoint).getProductById(
                    session,
                    params['productId'],
                  ),
        ),
        'createProduct': _i1.MethodConnector(
          name: 'createProduct',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'price': _i1.ParameterDescription(
              name: 'price',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'stockQuantity': _i1.ParameterDescription(
              name: 'stockQuantity',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'minStockAlert': _i1.ParameterDescription(
              name: 'minStockAlert',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'imageUrl': _i1.ParameterDescription(
              name: 'imageUrl',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'isBulkProduct': _i1.ParameterDescription(
              name: 'isBulkProduct',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'bulkUnit': _i1.ParameterDescription(
              name: 'bulkUnit',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'bulkTotalQuantity': _i1.ParameterDescription(
              name: 'bulkTotalQuantity',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
            'currentUnitRemaining': _i1.ParameterDescription(
              name: 'currentUnitRemaining',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
            'trackStock': _i1.ParameterDescription(
              name: 'trackStock',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i9.ProductEndpoint).createProduct(
                    session,
                    params['name'],
                    params['description'],
                    params['price'],
                    params['categoryId'],
                    params['stockQuantity'],
                    params['minStockAlert'],
                    params['imageUrl'],
                    isBulkProduct: params['isBulkProduct'],
                    bulkUnit: params['bulkUnit'],
                    bulkTotalQuantity: params['bulkTotalQuantity'],
                    currentUnitRemaining: params['currentUnitRemaining'],
                    trackStock: params['trackStock'],
                  ),
        ),
        'updateProduct': _i1.MethodConnector(
          name: 'updateProduct',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'price': _i1.ParameterDescription(
              name: 'price',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'minStockAlert': _i1.ParameterDescription(
              name: 'minStockAlert',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'imageUrl': _i1.ParameterDescription(
              name: 'imageUrl',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'isBulkProduct': _i1.ParameterDescription(
              name: 'isBulkProduct',
              type: _i1.getType<bool?>(),
              nullable: true,
            ),
            'bulkUnit': _i1.ParameterDescription(
              name: 'bulkUnit',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'bulkTotalQuantity': _i1.ParameterDescription(
              name: 'bulkTotalQuantity',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
            'stockQuantity': _i1.ParameterDescription(
              name: 'stockQuantity',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'currentUnitRemaining': _i1.ParameterDescription(
              name: 'currentUnitRemaining',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
            'trackStock': _i1.ParameterDescription(
              name: 'trackStock',
              type: _i1.getType<bool?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i9.ProductEndpoint).updateProduct(
                    session,
                    params['productId'],
                    params['name'],
                    params['description'],
                    params['price'],
                    params['categoryId'],
                    params['minStockAlert'],
                    params['imageUrl'],
                    isBulkProduct: params['isBulkProduct'],
                    bulkUnit: params['bulkUnit'],
                    bulkTotalQuantity: params['bulkTotalQuantity'],
                    stockQuantity: params['stockQuantity'],
                    currentUnitRemaining: params['currentUnitRemaining'],
                    trackStock: params['trackStock'],
                  ),
        ),
        'deleteProduct': _i1.MethodConnector(
          name: 'deleteProduct',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i9.ProductEndpoint).deleteProduct(
                    session,
                    params['productId'],
                  ),
        ),
        'toggleActiveStatus': _i1.MethodConnector(
          name: 'toggleActiveStatus',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'isActive': _i1.ParameterDescription(
              name: 'isActive',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['product'] as _i9.ProductEndpoint)
                  .toggleActiveStatus(
                    session,
                    params['productId'],
                    params['isActive'],
                  ),
        ),
        'updateStock': _i1.MethodConnector(
          name: 'updateStock',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'newStockQuantity': _i1.ParameterDescription(
              name: 'newStockQuantity',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i9.ProductEndpoint).updateStock(
                    session,
                    params['productId'],
                    params['newStockQuantity'],
                  ),
        ),
      },
    );
    connectors['productPortion'] = _i1.EndpointConnector(
      name: 'productPortion',
      endpoint: endpoints['productPortion']!,
      methodConnectors: {
        'getProductPortions': _i1.MethodConnector(
          name: 'getProductPortions',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'activeOnly': _i1.ParameterDescription(
              name: 'activeOnly',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['productPortion'] as _i10.ProductPortionEndpoint)
                      .getProductPortions(
                        session,
                        params['productId'],
                        activeOnly: params['activeOnly'],
                      ),
        ),
        'getPortionById': _i1.MethodConnector(
          name: 'getPortionById',
          params: {
            'portionId': _i1.ParameterDescription(
              name: 'portionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['productPortion'] as _i10.ProductPortionEndpoint)
                      .getPortionById(
                        session,
                        params['portionId'],
                      ),
        ),
        'createPortion': _i1.MethodConnector(
          name: 'createPortion',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'price': _i1.ParameterDescription(
              name: 'price',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'displayOrder': _i1.ParameterDescription(
              name: 'displayOrder',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['productPortion'] as _i10.ProductPortionEndpoint)
                      .createPortion(
                        session,
                        params['productId'],
                        params['name'],
                        params['quantity'],
                        params['price'],
                        displayOrder: params['displayOrder'],
                      ),
        ),
        'updatePortion': _i1.MethodConnector(
          name: 'updatePortion',
          params: {
            'portionId': _i1.ParameterDescription(
              name: 'portionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'price': _i1.ParameterDescription(
              name: 'price',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'displayOrder': _i1.ParameterDescription(
              name: 'displayOrder',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['productPortion'] as _i10.ProductPortionEndpoint)
                      .updatePortion(
                        session,
                        params['portionId'],
                        params['name'],
                        params['quantity'],
                        params['price'],
                        displayOrder: params['displayOrder'],
                      ),
        ),
        'deletePortion': _i1.MethodConnector(
          name: 'deletePortion',
          params: {
            'portionId': _i1.ParameterDescription(
              name: 'portionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['productPortion'] as _i10.ProductPortionEndpoint)
                      .deletePortion(
                        session,
                        params['portionId'],
                      ),
        ),
      },
    );
    connectors['stock'] = _i1.EndpointConnector(
      name: 'stock',
      endpoint: endpoints['stock']!,
      methodConnectors: {
        'restockProduct': _i1.MethodConnector(
          name: 'restockProduct',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'adminUserId': _i1.ParameterDescription(
              name: 'adminUserId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'notes': _i1.ParameterDescription(
              name: 'notes',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['stock'] as _i11.StockEndpoint).restockProduct(
                    session,
                    params['productId'],
                    params['quantity'],
                    params['adminUserId'],
                    params['notes'],
                  ),
        ),
        'adjustStock': _i1.MethodConnector(
          name: 'adjustStock',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'newQuantity': _i1.ParameterDescription(
              name: 'newQuantity',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'adminUserId': _i1.ParameterDescription(
              name: 'adminUserId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'reason': _i1.ParameterDescription(
              name: 'reason',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['stock'] as _i11.StockEndpoint).adjustStock(
                session,
                params['productId'],
                params['newQuantity'],
                params['adminUserId'],
                params['reason'],
              ),
        ),
        'getStockHistory': _i1.MethodConnector(
          name: 'getStockHistory',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'startDate': _i1.ParameterDescription(
              name: 'startDate',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'endDate': _i1.ParameterDescription(
              name: 'endDate',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['stock'] as _i11.StockEndpoint).getStockHistory(
                    session,
                    params['productId'],
                    startDate: params['startDate'],
                    endDate: params['endDate'],
                  ),
        ),
        'getAllStockMovements': _i1.MethodConnector(
          name: 'getAllStockMovements',
          params: {
            'type': _i1.ParameterDescription(
              name: 'type',
              type: _i1.getType<_i17.MovementType?>(),
              nullable: true,
            ),
            'startDate': _i1.ParameterDescription(
              name: 'startDate',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'endDate': _i1.ParameterDescription(
              name: 'endDate',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['stock'] as _i11.StockEndpoint)
                  .getAllStockMovements(
                    session,
                    type: params['type'],
                    startDate: params['startDate'],
                    endDate: params['endDate'],
                    limit: params['limit'],
                    offset: params['offset'],
                  ),
        ),
        'getLowStockProducts': _i1.MethodConnector(
          name: 'getLowStockProducts',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['stock'] as _i11.StockEndpoint)
                  .getLowStockProducts(session),
        ),
      },
    );
    connectors['transaction'] = _i1.EndpointConnector(
      name: 'transaction',
      endpoint: endpoints['transaction']!,
      methodConnectors: {
        'checkout': _i1.MethodConnector(
          name: 'checkout',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'pin': _i1.ParameterDescription(
              name: 'pin',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['transaction'] as _i12.TransactionEndpoint)
                  .checkout(
                    session,
                    params['userId'],
                    params['pin'],
                  ),
        ),
        'refundTransaction': _i1.MethodConnector(
          name: 'refundTransaction',
          params: {
            'transactionId': _i1.ParameterDescription(
              name: 'transactionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'reason': _i1.ParameterDescription(
              name: 'reason',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['transaction'] as _i12.TransactionEndpoint)
                  .refundTransaction(
                    session,
                    params['transactionId'],
                    params['reason'],
                  ),
        ),
        'getUserTransactions': _i1.MethodConnector(
          name: 'getUserTransactions',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['transaction'] as _i12.TransactionEndpoint)
                  .getUserTransactions(
                    session,
                    params['userId'],
                    limit: params['limit'],
                    offset: params['offset'],
                  ),
        ),
        'getAllTransactions': _i1.MethodConnector(
          name: 'getAllTransactions',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'type': _i1.ParameterDescription(
              name: 'type',
              type: _i1.getType<_i18.TransactionType?>(),
              nullable: true,
            ),
            'startDate': _i1.ParameterDescription(
              name: 'startDate',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'endDate': _i1.ParameterDescription(
              name: 'endDate',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['transaction'] as _i12.TransactionEndpoint)
                  .getAllTransactions(
                    session,
                    limit: params['limit'],
                    offset: params['offset'],
                    type: params['type'],
                    startDate: params['startDate'],
                    endDate: params['endDate'],
                  ),
        ),
        'getTransactionItems': _i1.MethodConnector(
          name: 'getTransactionItems',
          params: {
            'transactionId': _i1.ParameterDescription(
              name: 'transactionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['transaction'] as _i12.TransactionEndpoint)
                  .getTransactionItems(
                    session,
                    params['transactionId'],
                  ),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['greeting'] as _i13.GreetingEndpoint).hello(
                session,
                params['name'],
              ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i19.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i20.Endpoints()
      ..initializeEndpoints(server);
  }
}
