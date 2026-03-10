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
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'auth/user.dart' as _i2;
import 'auth/user_role.dart' as _i3;
import 'greetings/greeting.dart' as _i4;
import 'shop/cart_item.dart' as _i5;
import 'shop/product.dart' as _i6;
import 'shop/product_category.dart' as _i7;
import 'shop/product_portion.dart' as _i8;
import 'stock/movement_type.dart' as _i9;
import 'stock/stock_movement.dart' as _i10;
import 'transactions/transaction.dart' as _i11;
import 'transactions/transaction_item.dart' as _i12;
import 'transactions/transaction_type.dart' as _i13;
import 'package:airbar_backend_client/src/protocol/auth/user.dart' as _i14;
import 'package:airbar_backend_client/src/protocol/shop/cart_item.dart' as _i15;
import 'package:airbar_backend_client/src/protocol/shop/product_category.dart'
    as _i16;
import 'package:airbar_backend_client/src/protocol/shop/product.dart' as _i17;
import 'package:airbar_backend_client/src/protocol/shop/product_portion.dart'
    as _i18;
import 'package:airbar_backend_client/src/protocol/stock/stock_movement.dart'
    as _i19;
import 'package:airbar_backend_client/src/protocol/transactions/transaction.dart'
    as _i20;
import 'package:airbar_backend_client/src/protocol/transactions/transaction_item.dart'
    as _i21;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i22;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i23;
export 'auth/user.dart';
export 'auth/user_role.dart';
export 'greetings/greeting.dart';
export 'shop/cart_item.dart';
export 'shop/product.dart';
export 'shop/product_category.dart';
export 'shop/product_portion.dart';
export 'stock/movement_type.dart';
export 'stock/stock_movement.dart';
export 'transactions/transaction.dart';
export 'transactions/transaction_item.dart';
export 'transactions/transaction_type.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.User) {
      return _i2.User.fromJson(data) as T;
    }
    if (t == _i3.UserRole) {
      return _i3.UserRole.fromJson(data) as T;
    }
    if (t == _i4.Greeting) {
      return _i4.Greeting.fromJson(data) as T;
    }
    if (t == _i5.CartItem) {
      return _i5.CartItem.fromJson(data) as T;
    }
    if (t == _i6.Product) {
      return _i6.Product.fromJson(data) as T;
    }
    if (t == _i7.ProductCategory) {
      return _i7.ProductCategory.fromJson(data) as T;
    }
    if (t == _i8.ProductPortion) {
      return _i8.ProductPortion.fromJson(data) as T;
    }
    if (t == _i9.MovementType) {
      return _i9.MovementType.fromJson(data) as T;
    }
    if (t == _i10.StockMovement) {
      return _i10.StockMovement.fromJson(data) as T;
    }
    if (t == _i11.Transaction) {
      return _i11.Transaction.fromJson(data) as T;
    }
    if (t == _i12.TransactionItem) {
      return _i12.TransactionItem.fromJson(data) as T;
    }
    if (t == _i13.TransactionType) {
      return _i13.TransactionType.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.User?>()) {
      return (data != null ? _i2.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.UserRole?>()) {
      return (data != null ? _i3.UserRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Greeting?>()) {
      return (data != null ? _i4.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.CartItem?>()) {
      return (data != null ? _i5.CartItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Product?>()) {
      return (data != null ? _i6.Product.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.ProductCategory?>()) {
      return (data != null ? _i7.ProductCategory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.ProductPortion?>()) {
      return (data != null ? _i8.ProductPortion.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.MovementType?>()) {
      return (data != null ? _i9.MovementType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.StockMovement?>()) {
      return (data != null ? _i10.StockMovement.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Transaction?>()) {
      return (data != null ? _i11.Transaction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.TransactionItem?>()) {
      return (data != null ? _i12.TransactionItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.TransactionType?>()) {
      return (data != null ? _i13.TransactionType.fromJson(data) : null) as T;
    }
    if (t == List<_i14.User>) {
      return (data as List).map((e) => deserialize<_i14.User>(e)).toList() as T;
    }
    if (t == List<_i15.CartItem>) {
      return (data as List).map((e) => deserialize<_i15.CartItem>(e)).toList()
          as T;
    }
    if (t == List<_i16.ProductCategory>) {
      return (data as List)
              .map((e) => deserialize<_i16.ProductCategory>(e))
              .toList()
          as T;
    }
    if (t == List<_i17.Product>) {
      return (data as List).map((e) => deserialize<_i17.Product>(e)).toList()
          as T;
    }
    if (t == List<_i18.ProductPortion>) {
      return (data as List)
              .map((e) => deserialize<_i18.ProductPortion>(e))
              .toList()
          as T;
    }
    if (t == List<_i19.StockMovement>) {
      return (data as List)
              .map((e) => deserialize<_i19.StockMovement>(e))
              .toList()
          as T;
    }
    if (t == List<_i20.Transaction>) {
      return (data as List)
              .map((e) => deserialize<_i20.Transaction>(e))
              .toList()
          as T;
    }
    if (t == List<_i21.TransactionItem>) {
      return (data as List)
              .map((e) => deserialize<_i21.TransactionItem>(e))
              .toList()
          as T;
    }
    try {
      return _i22.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i23.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.User => 'User',
      _i3.UserRole => 'UserRole',
      _i4.Greeting => 'Greeting',
      _i5.CartItem => 'CartItem',
      _i6.Product => 'Product',
      _i7.ProductCategory => 'ProductCategory',
      _i8.ProductPortion => 'ProductPortion',
      _i9.MovementType => 'MovementType',
      _i10.StockMovement => 'StockMovement',
      _i11.Transaction => 'Transaction',
      _i12.TransactionItem => 'TransactionItem',
      _i13.TransactionType => 'TransactionType',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'airbar_backend.',
        '',
      );
    }

    switch (data) {
      case _i2.User():
        return 'User';
      case _i3.UserRole():
        return 'UserRole';
      case _i4.Greeting():
        return 'Greeting';
      case _i5.CartItem():
        return 'CartItem';
      case _i6.Product():
        return 'Product';
      case _i7.ProductCategory():
        return 'ProductCategory';
      case _i8.ProductPortion():
        return 'ProductPortion';
      case _i9.MovementType():
        return 'MovementType';
      case _i10.StockMovement():
        return 'StockMovement';
      case _i11.Transaction():
        return 'Transaction';
      case _i12.TransactionItem():
        return 'TransactionItem';
      case _i13.TransactionType():
        return 'TransactionType';
    }
    className = _i22.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i23.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'User') {
      return deserialize<_i2.User>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i3.UserRole>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i4.Greeting>(data['data']);
    }
    if (dataClassName == 'CartItem') {
      return deserialize<_i5.CartItem>(data['data']);
    }
    if (dataClassName == 'Product') {
      return deserialize<_i6.Product>(data['data']);
    }
    if (dataClassName == 'ProductCategory') {
      return deserialize<_i7.ProductCategory>(data['data']);
    }
    if (dataClassName == 'ProductPortion') {
      return deserialize<_i8.ProductPortion>(data['data']);
    }
    if (dataClassName == 'MovementType') {
      return deserialize<_i9.MovementType>(data['data']);
    }
    if (dataClassName == 'StockMovement') {
      return deserialize<_i10.StockMovement>(data['data']);
    }
    if (dataClassName == 'Transaction') {
      return deserialize<_i11.Transaction>(data['data']);
    }
    if (dataClassName == 'TransactionItem') {
      return deserialize<_i12.TransactionItem>(data['data']);
    }
    if (dataClassName == 'TransactionType') {
      return deserialize<_i13.TransactionType>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i22.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i23.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i22.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i23.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
