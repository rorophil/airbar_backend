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
import 'package:airbar_backend_server/src/generated/auth/user_role.dart'
    as _im3ja6gv;
import 'package:airbar_backend_server/src/generated/cashier/cash_sale_item_data.dart'
    as _ixitvqwz;
import 'package:airbar_backend_server/src/generated/stock/movement_type.dart'
    as _i5adme9x;
import 'package:airbar_backend_server/src/generated/transactions/payment_method.dart'
    as _ih7ym03i;
import 'package:airbar_backend_server/src/generated/transactions/transaction_type.dart'
    as _icrwumb6;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import '../auth/email_idp_endpoint.dart' as _iuc1hd5t;
import '../auth/jwt_refresh_endpoint.dart' as _inwq3ztq;
import '../endpoints/auth/auth_endpoint.dart' as _i8qk95pw;
import '../endpoints/auth/user_endpoint.dart' as _i77y44ox;
import '../endpoints/cashier/cashier_endpoint.dart' as _i1zng6av;
import '../endpoints/shop/cart_endpoint.dart' as _ixqjr5sw;
import '../endpoints/shop/category_endpoint.dart' as _inzllmtt;
import '../endpoints/shop/product_endpoint.dart' as _ivjc3dqs;
import '../endpoints/shop/product_portion_endpoint.dart' as _iwkuoqdv;
import '../endpoints/stock/stock_endpoint.dart' as _ibmp800i;
import '../endpoints/transactions/transaction_endpoint.dart' as _iiprezx9;
import '../greetings/greeting_endpoint.dart' as _il624ik7;

class Endpoints extends _is.EndpointDispatch {
  @override
  void initializeEndpoints(_is.Server server) {
    var endpoints = <String, _is.Endpoint>{
      'emailIdp': _iuc1hd5t.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _inwq3ztq.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'auth': _i8qk95pw.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'user': _i77y44ox.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
      'cashier': _i1zng6av.CashierEndpoint()
        ..initialize(
          server,
          'cashier',
          null,
        ),
      'cart': _ixqjr5sw.CartEndpoint()
        ..initialize(
          server,
          'cart',
          null,
        ),
      'category': _inzllmtt.CategoryEndpoint()
        ..initialize(
          server,
          'category',
          null,
        ),
      'product': _ivjc3dqs.ProductEndpoint()
        ..initialize(
          server,
          'product',
          null,
        ),
      'productPortion': _iwkuoqdv.ProductPortionEndpoint()
        ..initialize(
          server,
          'productPortion',
          null,
        ),
      'stock': _ibmp800i.StockEndpoint()
        ..initialize(
          server,
          'stock',
          null,
        ),
      'transaction': _iiprezx9.TransactionEndpoint()
        ..initialize(
          server,
          'transaction',
          null,
        ),
      'greeting': _il624ik7.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['emailIdp'] = _is.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _is.MethodConnector(
          name: 'login',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint).login(
                    session,
                    email: params['email'],
                    password: params['password'],
                  ),
        ),
        'startRegistration': _is.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _is.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _is.ParameterDescription(
              name: 'accountRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _is.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _is.ParameterDescription(
              name: 'registrationToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _is.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _is.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _is.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _is.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _is.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'newPassword': _is.ParameterDescription(
              name: 'newPassword',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _is.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _is.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _is.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _is.ParameterDescription(
              name: 'refreshToken',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['jwtRefresh'] as _inwq3ztq.JwtRefreshEndpoint)
                      .refreshAccessToken(
                        session,
                        refreshToken: params['refreshToken'],
                      ),
        ),
      },
    );
    connectors['auth'] = _is.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'login': _is.MethodConnector(
          name: 'login',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i8qk95pw.AuthEndpoint).login(
                session,
                params['email'],
                params['password'],
              ),
        ),
        'validatePin': _is.MethodConnector(
          name: 'validatePin',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['auth'] as _i8qk95pw.AuthEndpoint).validatePin(
                    session,
                    params['userId'],
                    params['pin'],
                  ),
        ),
        'changePin': _is.MethodConnector(
          name: 'changePin',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'oldPin': _is.ParameterDescription(
              name: 'oldPin',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'newPin': _is.ParameterDescription(
              name: 'newPin',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['auth'] as _i8qk95pw.AuthEndpoint).changePin(
                    session,
                    params['userId'],
                    params['oldPin'],
                    params['newPin'],
                  ),
        ),
      },
    );
    connectors['user'] = _is.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'getAllUsers': _is.MethodConnector(
          name: 'getAllUsers',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i77y44ox.UserEndpoint)
                  .getAllUsers(session),
        ),
        'getUserById': _is.MethodConnector(
          name: 'getUserById',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['user'] as _i77y44ox.UserEndpoint).getUserById(
                    session,
                    params['userId'],
                  ),
        ),
        'createUser': _is.MethodConnector(
          name: 'createUser',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'firstName': _is.ParameterDescription(
              name: 'firstName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'lastName': _is.ParameterDescription(
              name: 'lastName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'role': _is.ParameterDescription(
              name: 'role',
              type: _is.getType<_im3ja6gv.UserRole>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['user'] as _i77y44ox.UserEndpoint).createUser(
                    session,
                    params['email'],
                    params['password'],
                    params['firstName'],
                    params['lastName'],
                    params['pin'],
                    params['role'],
                  ),
        ),
        'updateUser': _is.MethodConnector(
          name: 'updateUser',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'firstName': _is.ParameterDescription(
              name: 'firstName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'lastName': _is.ParameterDescription(
              name: 'lastName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'role': _is.ParameterDescription(
              name: 'role',
              type: _is.getType<_im3ja6gv.UserRole>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['user'] as _i77y44ox.UserEndpoint).updateUser(
                    session,
                    params['userId'],
                    params['email'],
                    params['firstName'],
                    params['lastName'],
                    params['role'],
                  ),
        ),
        'deactivateUser': _is.MethodConnector(
          name: 'deactivateUser',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['user'] as _i77y44ox.UserEndpoint).deactivateUser(
                    session,
                    params['userId'],
                  ),
        ),
        'reactivateUser': _is.MethodConnector(
          name: 'reactivateUser',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['user'] as _i77y44ox.UserEndpoint).reactivateUser(
                    session,
                    params['userId'],
                  ),
        ),
        'resetPassword': _is.MethodConnector(
          name: 'resetPassword',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'newPassword': _is.ParameterDescription(
              name: 'newPassword',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['user'] as _i77y44ox.UserEndpoint).resetPassword(
                    session,
                    params['userId'],
                    params['newPassword'],
                  ),
        ),
        'resetPin': _is.MethodConnector(
          name: 'resetPin',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'newPin': _is.ParameterDescription(
              name: 'newPin',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i77y44ox.UserEndpoint).resetPin(
                session,
                params['userId'],
                params['newPin'],
              ),
        ),
        'deleteUser': _is.MethodConnector(
          name: 'deleteUser',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['user'] as _i77y44ox.UserEndpoint).deleteUser(
                    session,
                    params['userId'],
                  ),
        ),
        'creditAccount': _is.MethodConnector(
          name: 'creditAccount',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'amount': _is.ParameterDescription(
              name: 'amount',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'notes': _is.ParameterDescription(
              name: 'notes',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['user'] as _i77y44ox.UserEndpoint).creditAccount(
                    session,
                    params['userId'],
                    params['amount'],
                    params['notes'],
                  ),
        ),
      },
    );
    connectors['cashier'] = _is.EndpointConnector(
      name: 'cashier',
      endpoint: endpoints['cashier']!,
      methodConnectors: {
        'processCashSale': _is.MethodConnector(
          name: 'processCashSale',
          params: {
            'sellerId': _is.ParameterDescription(
              name: 'sellerId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'items': _is.ParameterDescription(
              name: 'items',
              type: _is.getType<List<_ixitvqwz.CashSaleItemData>>(),
              nullable: false,
            ),
            'paymentMethod': _is.ParameterDescription(
              name: 'paymentMethod',
              type: _is.getType<_ih7ym03i.PaymentMethod>(),
              nullable: false,
            ),
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cashier'] as _i1zng6av.CashierEndpoint)
                  .processCashSale(
                    session,
                    params['sellerId'],
                    params['items'],
                    params['paymentMethod'],
                    params['pin'],
                  ),
        ),
        'getSellerTransactions': _is.MethodConnector(
          name: 'getSellerTransactions',
          params: {
            'sellerId': _is.ParameterDescription(
              name: 'sellerId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'limit': _is.ParameterDescription(
              name: 'limit',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'offset': _is.ParameterDescription(
              name: 'offset',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cashier'] as _i1zng6av.CashierEndpoint)
                  .getSellerTransactions(
                    session,
                    params['sellerId'],
                    limit: params['limit'],
                    offset: params['offset'],
                  ),
        ),
      },
    );
    connectors['cart'] = _is.EndpointConnector(
      name: 'cart',
      endpoint: endpoints['cart']!,
      methodConnectors: {
        'getCart': _is.MethodConnector(
          name: 'getCart',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cart'] as _ixqjr5sw.CartEndpoint).getCart(
                session,
                params['userId'],
              ),
        ),
        'addToCart': _is.MethodConnector(
          name: 'addToCart',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'productId': _is.ParameterDescription(
              name: 'productId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'quantity': _is.ParameterDescription(
              name: 'quantity',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'productPortionId': _is.ParameterDescription(
              name: 'productPortionId',
              type: _is.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['cart'] as _ixqjr5sw.CartEndpoint).addToCart(
                    session,
                    params['userId'],
                    params['productId'],
                    params['quantity'],
                    productPortionId: params['productPortionId'],
                  ),
        ),
        'updateCartItem': _is.MethodConnector(
          name: 'updateCartItem',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'productId': _is.ParameterDescription(
              name: 'productId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'quantity': _is.ParameterDescription(
              name: 'quantity',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'productPortionId': _is.ParameterDescription(
              name: 'productPortionId',
              type: _is.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['cart'] as _ixqjr5sw.CartEndpoint).updateCartItem(
                    session,
                    params['userId'],
                    params['productId'],
                    params['quantity'],
                    productPortionId: params['productPortionId'],
                  ),
        ),
        'removeFromCart': _is.MethodConnector(
          name: 'removeFromCart',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'productId': _is.ParameterDescription(
              name: 'productId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'productPortionId': _is.ParameterDescription(
              name: 'productPortionId',
              type: _is.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['cart'] as _ixqjr5sw.CartEndpoint).removeFromCart(
                    session,
                    params['userId'],
                    params['productId'],
                    productPortionId: params['productPortionId'],
                  ),
        ),
        'clearCart': _is.MethodConnector(
          name: 'clearCart',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['cart'] as _ixqjr5sw.CartEndpoint).clearCart(
                    session,
                    params['userId'],
                  ),
        ),
        'getAllCartItems': _is.MethodConnector(
          name: 'getAllCartItems',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cart'] as _ixqjr5sw.CartEndpoint)
                  .getAllCartItems(session),
        ),
      },
    );
    connectors['category'] = _is.EndpointConnector(
      name: 'category',
      endpoint: endpoints['category']!,
      methodConnectors: {
        'getCategories': _is.MethodConnector(
          name: 'getCategories',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['category'] as _inzllmtt.CategoryEndpoint)
                  .getCategories(session),
        ),
        'getActiveCategories': _is.MethodConnector(
          name: 'getActiveCategories',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['category'] as _inzllmtt.CategoryEndpoint)
                  .getActiveCategories(session),
        ),
        'createCategory': _is.MethodConnector(
          name: 'createCategory',
          params: {
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'description': _is.ParameterDescription(
              name: 'description',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'iconName': _is.ParameterDescription(
              name: 'iconName',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'displayOrder': _is.ParameterDescription(
              name: 'displayOrder',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['category'] as _inzllmtt.CategoryEndpoint)
                  .createCategory(
                    session,
                    params['name'],
                    params['description'],
                    params['iconName'],
                    params['displayOrder'],
                  ),
        ),
        'updateCategory': _is.MethodConnector(
          name: 'updateCategory',
          params: {
            'categoryId': _is.ParameterDescription(
              name: 'categoryId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'description': _is.ParameterDescription(
              name: 'description',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'iconName': _is.ParameterDescription(
              name: 'iconName',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'displayOrder': _is.ParameterDescription(
              name: 'displayOrder',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['category'] as _inzllmtt.CategoryEndpoint)
                  .updateCategory(
                    session,
                    params['categoryId'],
                    params['name'],
                    params['description'],
                    params['iconName'],
                    params['displayOrder'],
                  ),
        ),
        'deleteCategory': _is.MethodConnector(
          name: 'deleteCategory',
          params: {
            'categoryId': _is.ParameterDescription(
              name: 'categoryId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['category'] as _inzllmtt.CategoryEndpoint)
                  .deleteCategory(
                    session,
                    params['categoryId'],
                  ),
        ),
      },
    );
    connectors['product'] = _is.EndpointConnector(
      name: 'product',
      endpoint: endpoints['product']!,
      methodConnectors: {
        'getAllProducts': _is.MethodConnector(
          name: 'getAllProducts',
          params: {
            'activeOnly': _is.ParameterDescription(
              name: 'activeOnly',
              type: _is.getType<bool?>(),
              nullable: true,
            ),
            'includeDeleted': _is.ParameterDescription(
              name: 'includeDeleted',
              type: _is.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['product'] as _ivjc3dqs.ProductEndpoint)
                  .getAllProducts(
                    session,
                    activeOnly: params['activeOnly'],
                    includeDeleted: params['includeDeleted'],
                  ),
        ),
        'getProductsByCategory': _is.MethodConnector(
          name: 'getProductsByCategory',
          params: {
            'categoryId': _is.ParameterDescription(
              name: 'categoryId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['product'] as _ivjc3dqs.ProductEndpoint)
                  .getProductsByCategory(
                    session,
                    params['categoryId'],
                  ),
        ),
        'getProductById': _is.MethodConnector(
          name: 'getProductById',
          params: {
            'productId': _is.ParameterDescription(
              name: 'productId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['product'] as _ivjc3dqs.ProductEndpoint)
                  .getProductById(
                    session,
                    params['productId'],
                  ),
        ),
        'createProduct': _is.MethodConnector(
          name: 'createProduct',
          params: {
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'description': _is.ParameterDescription(
              name: 'description',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'price': _is.ParameterDescription(
              name: 'price',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'categoryId': _is.ParameterDescription(
              name: 'categoryId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'stockQuantity': _is.ParameterDescription(
              name: 'stockQuantity',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'minStockAlert': _is.ParameterDescription(
              name: 'minStockAlert',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'imageUrl': _is.ParameterDescription(
              name: 'imageUrl',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'isBulkProduct': _is.ParameterDescription(
              name: 'isBulkProduct',
              type: _is.getType<bool>(),
              nullable: false,
            ),
            'bulkUnit': _is.ParameterDescription(
              name: 'bulkUnit',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'bulkTotalQuantity': _is.ParameterDescription(
              name: 'bulkTotalQuantity',
              type: _is.getType<double?>(),
              nullable: true,
            ),
            'currentUnitRemaining': _is.ParameterDescription(
              name: 'currentUnitRemaining',
              type: _is.getType<double?>(),
              nullable: true,
            ),
            'trackStock': _is.ParameterDescription(
              name: 'trackStock',
              type: _is.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['product'] as _ivjc3dqs.ProductEndpoint)
                  .createProduct(
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
        'updateProduct': _is.MethodConnector(
          name: 'updateProduct',
          params: {
            'productId': _is.ParameterDescription(
              name: 'productId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'description': _is.ParameterDescription(
              name: 'description',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'price': _is.ParameterDescription(
              name: 'price',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'categoryId': _is.ParameterDescription(
              name: 'categoryId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'minStockAlert': _is.ParameterDescription(
              name: 'minStockAlert',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'imageUrl': _is.ParameterDescription(
              name: 'imageUrl',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'isBulkProduct': _is.ParameterDescription(
              name: 'isBulkProduct',
              type: _is.getType<bool?>(),
              nullable: true,
            ),
            'bulkUnit': _is.ParameterDescription(
              name: 'bulkUnit',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'bulkTotalQuantity': _is.ParameterDescription(
              name: 'bulkTotalQuantity',
              type: _is.getType<double?>(),
              nullable: true,
            ),
            'stockQuantity': _is.ParameterDescription(
              name: 'stockQuantity',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'currentUnitRemaining': _is.ParameterDescription(
              name: 'currentUnitRemaining',
              type: _is.getType<double?>(),
              nullable: true,
            ),
            'trackStock': _is.ParameterDescription(
              name: 'trackStock',
              type: _is.getType<bool?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['product'] as _ivjc3dqs.ProductEndpoint)
                  .updateProduct(
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
        'deleteProduct': _is.MethodConnector(
          name: 'deleteProduct',
          params: {
            'productId': _is.ParameterDescription(
              name: 'productId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['product'] as _ivjc3dqs.ProductEndpoint)
                  .deleteProduct(
                    session,
                    params['productId'],
                  ),
        ),
        'toggleActiveStatus': _is.MethodConnector(
          name: 'toggleActiveStatus',
          params: {
            'productId': _is.ParameterDescription(
              name: 'productId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'isActive': _is.ParameterDescription(
              name: 'isActive',
              type: _is.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['product'] as _ivjc3dqs.ProductEndpoint)
                  .toggleActiveStatus(
                    session,
                    params['productId'],
                    params['isActive'],
                  ),
        ),
        'updateStock': _is.MethodConnector(
          name: 'updateStock',
          params: {
            'productId': _is.ParameterDescription(
              name: 'productId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'newStockQuantity': _is.ParameterDescription(
              name: 'newStockQuantity',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['product'] as _ivjc3dqs.ProductEndpoint)
                  .updateStock(
                    session,
                    params['productId'],
                    params['newStockQuantity'],
                  ),
        ),
      },
    );
    connectors['productPortion'] = _is.EndpointConnector(
      name: 'productPortion',
      endpoint: endpoints['productPortion']!,
      methodConnectors: {
        'getProductPortions': _is.MethodConnector(
          name: 'getProductPortions',
          params: {
            'productId': _is.ParameterDescription(
              name: 'productId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'activeOnly': _is.ParameterDescription(
              name: 'activeOnly',
              type: _is.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['productPortion']
                          as _iwkuoqdv.ProductPortionEndpoint)
                      .getProductPortions(
                        session,
                        params['productId'],
                        activeOnly: params['activeOnly'],
                      ),
        ),
        'getPortionById': _is.MethodConnector(
          name: 'getPortionById',
          params: {
            'portionId': _is.ParameterDescription(
              name: 'portionId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['productPortion']
                          as _iwkuoqdv.ProductPortionEndpoint)
                      .getPortionById(
                        session,
                        params['portionId'],
                      ),
        ),
        'createPortion': _is.MethodConnector(
          name: 'createPortion',
          params: {
            'productId': _is.ParameterDescription(
              name: 'productId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'quantity': _is.ParameterDescription(
              name: 'quantity',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'price': _is.ParameterDescription(
              name: 'price',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'displayOrder': _is.ParameterDescription(
              name: 'displayOrder',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['productPortion']
                          as _iwkuoqdv.ProductPortionEndpoint)
                      .createPortion(
                        session,
                        params['productId'],
                        params['name'],
                        params['quantity'],
                        params['price'],
                        displayOrder: params['displayOrder'],
                      ),
        ),
        'updatePortion': _is.MethodConnector(
          name: 'updatePortion',
          params: {
            'portionId': _is.ParameterDescription(
              name: 'portionId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'quantity': _is.ParameterDescription(
              name: 'quantity',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'price': _is.ParameterDescription(
              name: 'price',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'displayOrder': _is.ParameterDescription(
              name: 'displayOrder',
              type: _is.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['productPortion']
                          as _iwkuoqdv.ProductPortionEndpoint)
                      .updatePortion(
                        session,
                        params['portionId'],
                        params['name'],
                        params['quantity'],
                        params['price'],
                        displayOrder: params['displayOrder'],
                      ),
        ),
        'deletePortion': _is.MethodConnector(
          name: 'deletePortion',
          params: {
            'portionId': _is.ParameterDescription(
              name: 'portionId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['productPortion']
                          as _iwkuoqdv.ProductPortionEndpoint)
                      .deletePortion(
                        session,
                        params['portionId'],
                      ),
        ),
      },
    );
    connectors['stock'] = _is.EndpointConnector(
      name: 'stock',
      endpoint: endpoints['stock']!,
      methodConnectors: {
        'restockProduct': _is.MethodConnector(
          name: 'restockProduct',
          params: {
            'productId': _is.ParameterDescription(
              name: 'productId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'quantity': _is.ParameterDescription(
              name: 'quantity',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'adminUserId': _is.ParameterDescription(
              name: 'adminUserId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'notes': _is.ParameterDescription(
              name: 'notes',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['stock'] as _ibmp800i.StockEndpoint)
                  .restockProduct(
                    session,
                    params['productId'],
                    params['quantity'],
                    params['adminUserId'],
                    params['notes'],
                  ),
        ),
        'adjustStock': _is.MethodConnector(
          name: 'adjustStock',
          params: {
            'productId': _is.ParameterDescription(
              name: 'productId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'newQuantity': _is.ParameterDescription(
              name: 'newQuantity',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'adminUserId': _is.ParameterDescription(
              name: 'adminUserId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'reason': _is.ParameterDescription(
              name: 'reason',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['stock'] as _ibmp800i.StockEndpoint).adjustStock(
                    session,
                    params['productId'],
                    params['newQuantity'],
                    params['adminUserId'],
                    params['reason'],
                  ),
        ),
        'getStockHistory': _is.MethodConnector(
          name: 'getStockHistory',
          params: {
            'productId': _is.ParameterDescription(
              name: 'productId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'startDate': _is.ParameterDescription(
              name: 'startDate',
              type: _is.getType<DateTime?>(),
              nullable: true,
            ),
            'endDate': _is.ParameterDescription(
              name: 'endDate',
              type: _is.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['stock'] as _ibmp800i.StockEndpoint)
                  .getStockHistory(
                    session,
                    params['productId'],
                    startDate: params['startDate'],
                    endDate: params['endDate'],
                  ),
        ),
        'getAllStockMovements': _is.MethodConnector(
          name: 'getAllStockMovements',
          params: {
            'type': _is.ParameterDescription(
              name: 'type',
              type: _is.getType<_i5adme9x.MovementType?>(),
              nullable: true,
            ),
            'startDate': _is.ParameterDescription(
              name: 'startDate',
              type: _is.getType<DateTime?>(),
              nullable: true,
            ),
            'endDate': _is.ParameterDescription(
              name: 'endDate',
              type: _is.getType<DateTime?>(),
              nullable: true,
            ),
            'limit': _is.ParameterDescription(
              name: 'limit',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'offset': _is.ParameterDescription(
              name: 'offset',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['stock'] as _ibmp800i.StockEndpoint)
                  .getAllStockMovements(
                    session,
                    type: params['type'],
                    startDate: params['startDate'],
                    endDate: params['endDate'],
                    limit: params['limit'],
                    offset: params['offset'],
                  ),
        ),
        'getLowStockProducts': _is.MethodConnector(
          name: 'getLowStockProducts',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['stock'] as _ibmp800i.StockEndpoint)
                  .getLowStockProducts(session),
        ),
      },
    );
    connectors['transaction'] = _is.EndpointConnector(
      name: 'transaction',
      endpoint: endpoints['transaction']!,
      methodConnectors: {
        'checkout': _is.MethodConnector(
          name: 'checkout',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['transaction'] as _iiprezx9.TransactionEndpoint)
                      .checkout(
                        session,
                        params['userId'],
                        params['pin'],
                      ),
        ),
        'adminForceCheckout': _is.MethodConnector(
          name: 'adminForceCheckout',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'adminId': _is.ParameterDescription(
              name: 'adminId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'adminPin': _is.ParameterDescription(
              name: 'adminPin',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['transaction'] as _iiprezx9.TransactionEndpoint)
                      .adminForceCheckout(
                        session,
                        params['userId'],
                        params['adminId'],
                        params['adminPin'],
                      ),
        ),
        'refundTransaction': _is.MethodConnector(
          name: 'refundTransaction',
          params: {
            'transactionId': _is.ParameterDescription(
              name: 'transactionId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'reason': _is.ParameterDescription(
              name: 'reason',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['transaction'] as _iiprezx9.TransactionEndpoint)
                      .refundTransaction(
                        session,
                        params['transactionId'],
                        params['reason'],
                      ),
        ),
        'getUserTransactions': _is.MethodConnector(
          name: 'getUserTransactions',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'limit': _is.ParameterDescription(
              name: 'limit',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'offset': _is.ParameterDescription(
              name: 'offset',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['transaction'] as _iiprezx9.TransactionEndpoint)
                      .getUserTransactions(
                        session,
                        params['userId'],
                        limit: params['limit'],
                        offset: params['offset'],
                      ),
        ),
        'getAllTransactions': _is.MethodConnector(
          name: 'getAllTransactions',
          params: {
            'limit': _is.ParameterDescription(
              name: 'limit',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'offset': _is.ParameterDescription(
              name: 'offset',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'type': _is.ParameterDescription(
              name: 'type',
              type: _is.getType<_icrwumb6.TransactionType?>(),
              nullable: true,
            ),
            'startDate': _is.ParameterDescription(
              name: 'startDate',
              type: _is.getType<DateTime?>(),
              nullable: true,
            ),
            'endDate': _is.ParameterDescription(
              name: 'endDate',
              type: _is.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['transaction'] as _iiprezx9.TransactionEndpoint)
                      .getAllTransactions(
                        session,
                        limit: params['limit'],
                        offset: params['offset'],
                        type: params['type'],
                        startDate: params['startDate'],
                        endDate: params['endDate'],
                      ),
        ),
        'getTransactionItems': _is.MethodConnector(
          name: 'getTransactionItems',
          params: {
            'transactionId': _is.ParameterDescription(
              name: 'transactionId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['transaction'] as _iiprezx9.TransactionEndpoint)
                      .getTransactionItems(
                        session,
                        params['transactionId'],
                      ),
        ),
      },
    );
    connectors['greeting'] = _is.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _is.MethodConnector(
          name: 'hello',
          params: {
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['greeting'] as _il624ik7.GreetingEndpoint).hello(
                    session,
                    params['name'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _iais.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _iacs.Endpoints()
      ..initializeEndpoints(server);
  }
}
