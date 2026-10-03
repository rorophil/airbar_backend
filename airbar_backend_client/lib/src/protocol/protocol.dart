/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:airbar_backend_client/src/protocol/auth/user.dart' as _i8y9on69;
import 'package:airbar_backend_client/src/protocol/cashier/cash_sale_item_data.dart'
    as _ijgzfxdb;
import 'package:airbar_backend_client/src/protocol/shop/cart_item.dart'
    as _irrzm7ok;
import 'package:airbar_backend_client/src/protocol/shop/product.dart'
    as _i0zhxdfi;
import 'package:airbar_backend_client/src/protocol/shop/product_category.dart'
    as _iie42pd2;
import 'package:airbar_backend_client/src/protocol/shop/product_portion.dart'
    as _ikci3ida;
import 'package:airbar_backend_client/src/protocol/stock/stock_movement.dart'
    as _idkbt7jq;
import 'package:airbar_backend_client/src/protocol/transactions/transaction.dart'
    as _igfbiu5t;
import 'package:airbar_backend_client/src/protocol/transactions/transaction_item.dart'
    as _i596jxbt;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'auth/user.dart' as _ihzw26wp;
import 'auth/user_role.dart' as _imfzqkbp;
import 'cashier/cash_sale_item_data.dart' as _i8q255bz;
import 'exceptions/business_exception.dart' as _inujlvgf;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'shop/cart_item.dart' as _i4ros8ig;
import 'shop/product.dart' as _ictnbmx0;
import 'shop/product_category.dart' as _ioy1aw0v;
import 'shop/product_portion.dart' as _ip205i9w;
import 'stock/movement_type.dart' as _iu46gsdm;
import 'stock/stock_movement.dart' as _iq6rmlux;
import 'transactions/payment_method.dart' as _iaa3e0kl;
import 'transactions/transaction.dart' as _iqhl4hru;
import 'transactions/transaction_item.dart' as _i37amypa;
import 'transactions/transaction_type.dart' as _ijg0uxum;
export 'auth/user.dart';
export 'auth/user_role.dart';
export 'cashier/cash_sale_item_data.dart';
export 'exceptions/business_exception.dart';
export 'greetings/greeting.dart';
export 'shop/cart_item.dart';
export 'shop/product.dart';
export 'shop/product_category.dart';
export 'shop/product_portion.dart';
export 'stock/movement_type.dart';
export 'stock/stock_movement.dart';
export 'transactions/payment_method.dart';
export 'transactions/transaction.dart';
export 'transactions/transaction_item.dart';
export 'transactions/transaction_type.dart';
export 'client.dart';

class Protocol extends _isc.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

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
      } on _isc.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _ihzw26wp.User) {
      return _ihzw26wp.User.fromJson(data) as T;
    }
    if (t == _imfzqkbp.UserRole) {
      return _imfzqkbp.UserRole.fromJson(data) as T;
    }
    if (t == _i8q255bz.CashSaleItemData) {
      return _i8q255bz.CashSaleItemData.fromJson(data) as T;
    }
    if (t == _inujlvgf.BusinessException) {
      return _inujlvgf.BusinessException.fromJson(data) as T;
    }
    if (t == _izw8z7ou.Greeting) {
      return _izw8z7ou.Greeting.fromJson(data) as T;
    }
    if (t == _i4ros8ig.CartItem) {
      return _i4ros8ig.CartItem.fromJson(data) as T;
    }
    if (t == _ictnbmx0.Product) {
      return _ictnbmx0.Product.fromJson(data) as T;
    }
    if (t == _ioy1aw0v.ProductCategory) {
      return _ioy1aw0v.ProductCategory.fromJson(data) as T;
    }
    if (t == _ip205i9w.ProductPortion) {
      return _ip205i9w.ProductPortion.fromJson(data) as T;
    }
    if (t == _iu46gsdm.MovementType) {
      return _iu46gsdm.MovementType.fromJson(data) as T;
    }
    if (t == _iq6rmlux.StockMovement) {
      return _iq6rmlux.StockMovement.fromJson(data) as T;
    }
    if (t == _iaa3e0kl.PaymentMethod) {
      return _iaa3e0kl.PaymentMethod.fromJson(data) as T;
    }
    if (t == _iqhl4hru.Transaction) {
      return _iqhl4hru.Transaction.fromJson(data) as T;
    }
    if (t == _i37amypa.TransactionItem) {
      return _i37amypa.TransactionItem.fromJson(data) as T;
    }
    if (t == _ijg0uxum.TransactionType) {
      return _ijg0uxum.TransactionType.fromJson(data) as T;
    }
    if (t == _isc.getType<_ihzw26wp.User?>()) {
      return (data != null ? _ihzw26wp.User.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_imfzqkbp.UserRole?>()) {
      return (data != null ? _imfzqkbp.UserRole.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i8q255bz.CashSaleItemData?>()) {
      return (data != null ? _i8q255bz.CashSaleItemData.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_inujlvgf.BusinessException?>()) {
      return (data != null ? _inujlvgf.BusinessException.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i4ros8ig.CartItem?>()) {
      return (data != null ? _i4ros8ig.CartItem.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ictnbmx0.Product?>()) {
      return (data != null ? _ictnbmx0.Product.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ioy1aw0v.ProductCategory?>()) {
      return (data != null ? _ioy1aw0v.ProductCategory.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ip205i9w.ProductPortion?>()) {
      return (data != null ? _ip205i9w.ProductPortion.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iu46gsdm.MovementType?>()) {
      return (data != null ? _iu46gsdm.MovementType.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iq6rmlux.StockMovement?>()) {
      return (data != null ? _iq6rmlux.StockMovement.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iaa3e0kl.PaymentMethod?>()) {
      return (data != null ? _iaa3e0kl.PaymentMethod.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iqhl4hru.Transaction?>()) {
      return (data != null ? _iqhl4hru.Transaction.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i37amypa.TransactionItem?>()) {
      return (data != null ? _i37amypa.TransactionItem.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ijg0uxum.TransactionType?>()) {
      return (data != null ? _ijg0uxum.TransactionType.fromJson(data) : null)
          as T;
    }
    if (t == List<_i8y9on69.User>) {
      return (data as List).map((e) => deserialize<_i8y9on69.User>(e)).toList()
          as T;
    }
    if (t == List<_ijgzfxdb.CashSaleItemData>) {
      return (data as List)
              .map((e) => deserialize<_ijgzfxdb.CashSaleItemData>(e))
              .toList()
          as T;
    }
    if (t == List<_igfbiu5t.Transaction>) {
      return (data as List)
              .map((e) => deserialize<_igfbiu5t.Transaction>(e))
              .toList()
          as T;
    }
    if (t == List<_irrzm7ok.CartItem>) {
      return (data as List)
              .map((e) => deserialize<_irrzm7ok.CartItem>(e))
              .toList()
          as T;
    }
    if (t == List<_iie42pd2.ProductCategory>) {
      return (data as List)
              .map((e) => deserialize<_iie42pd2.ProductCategory>(e))
              .toList()
          as T;
    }
    if (t == List<_i0zhxdfi.Product>) {
      return (data as List)
              .map((e) => deserialize<_i0zhxdfi.Product>(e))
              .toList()
          as T;
    }
    if (t == List<_ikci3ida.ProductPortion>) {
      return (data as List)
              .map((e) => deserialize<_ikci3ida.ProductPortion>(e))
              .toList()
          as T;
    }
    if (t == List<_idkbt7jq.StockMovement>) {
      return (data as List)
              .map((e) => deserialize<_idkbt7jq.StockMovement>(e))
              .toList()
          as T;
    }
    if (t == List<_i596jxbt.TransactionItem>) {
      return (data as List)
              .map((e) => deserialize<_i596jxbt.TransactionItem>(e))
              .toList()
          as T;
    }
    try {
      return _iaic.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacc.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _ihzw26wp.User => 'User',
      _imfzqkbp.UserRole => 'UserRole',
      _i8q255bz.CashSaleItemData => 'CashSaleItemData',
      _inujlvgf.BusinessException => 'BusinessException',
      _izw8z7ou.Greeting => 'Greeting',
      _i4ros8ig.CartItem => 'CartItem',
      _ictnbmx0.Product => 'Product',
      _ioy1aw0v.ProductCategory => 'ProductCategory',
      _ip205i9w.ProductPortion => 'ProductPortion',
      _iu46gsdm.MovementType => 'MovementType',
      _iq6rmlux.StockMovement => 'StockMovement',
      _iaa3e0kl.PaymentMethod => 'PaymentMethod',
      _iqhl4hru.Transaction => 'Transaction',
      _i37amypa.TransactionItem => 'TransactionItem',
      _ijg0uxum.TransactionType => 'TransactionType',
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
      case _ihzw26wp.User():
        return 'User';
      case _imfzqkbp.UserRole():
        return 'UserRole';
      case _i8q255bz.CashSaleItemData():
        return 'CashSaleItemData';
      case _inujlvgf.BusinessException():
        return 'BusinessException';
      case _izw8z7ou.Greeting():
        return 'Greeting';
      case _i4ros8ig.CartItem():
        return 'CartItem';
      case _ictnbmx0.Product():
        return 'Product';
      case _ioy1aw0v.ProductCategory():
        return 'ProductCategory';
      case _ip205i9w.ProductPortion():
        return 'ProductPortion';
      case _iu46gsdm.MovementType():
        return 'MovementType';
      case _iq6rmlux.StockMovement():
        return 'StockMovement';
      case _iaa3e0kl.PaymentMethod():
        return 'PaymentMethod';
      case _iqhl4hru.Transaction():
        return 'Transaction';
      case _i37amypa.TransactionItem():
        return 'TransactionItem';
      case _ijg0uxum.TransactionType():
        return 'TransactionType';
    }
    className = _iaic.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacc.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
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
      return deserialize<_ihzw26wp.User>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_imfzqkbp.UserRole>(data['data']);
    }
    if (dataClassName == 'CashSaleItemData') {
      return deserialize<_i8q255bz.CashSaleItemData>(data['data']);
    }
    if (dataClassName == 'BusinessException') {
      return deserialize<_inujlvgf.BusinessException>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_izw8z7ou.Greeting>(data['data']);
    }
    if (dataClassName == 'CartItem') {
      return deserialize<_i4ros8ig.CartItem>(data['data']);
    }
    if (dataClassName == 'Product') {
      return deserialize<_ictnbmx0.Product>(data['data']);
    }
    if (dataClassName == 'ProductCategory') {
      return deserialize<_ioy1aw0v.ProductCategory>(data['data']);
    }
    if (dataClassName == 'ProductPortion') {
      return deserialize<_ip205i9w.ProductPortion>(data['data']);
    }
    if (dataClassName == 'MovementType') {
      return deserialize<_iu46gsdm.MovementType>(data['data']);
    }
    if (dataClassName == 'StockMovement') {
      return deserialize<_iq6rmlux.StockMovement>(data['data']);
    }
    if (dataClassName == 'PaymentMethod') {
      return deserialize<_iaa3e0kl.PaymentMethod>(data['data']);
    }
    if (dataClassName == 'Transaction') {
      return deserialize<_iqhl4hru.Transaction>(data['data']);
    }
    if (dataClassName == 'TransactionItem') {
      return deserialize<_i37amypa.TransactionItem>(data['data']);
    }
    if (dataClassName == 'TransactionType') {
      return deserialize<_ijg0uxum.TransactionType>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _iaic.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacc.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iaic.Protocol().registerHostProtocol('airbar_backend', this);
    _iacc.Protocol().registerHostProtocol('airbar_backend', this);
  }

  @override
  String getModuleName() => 'airbar_backend';

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
      return _iaic.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacc.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
