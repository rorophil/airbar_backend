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

abstract class TransactionItem implements _i1.SerializableModel {
  TransactionItem._({
    this.id,
    required this.transactionId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.subtotal,
    double? stockDeduction,
  }) : stockDeduction = stockDeduction ?? 0.0;

  factory TransactionItem({
    int? id,
    required int transactionId,
    required int productId,
    required String productName,
    required int quantity,
    required double unitPrice,
    required double subtotal,
    double? stockDeduction,
  }) = _TransactionItemImpl;

  factory TransactionItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return TransactionItem(
      id: jsonSerialization['id'] as int?,
      transactionId: jsonSerialization['transactionId'] as int,
      productId: jsonSerialization['productId'] as int,
      productName: jsonSerialization['productName'] as String,
      quantity: jsonSerialization['quantity'] as int,
      unitPrice: (jsonSerialization['unitPrice'] as num).toDouble(),
      subtotal: (jsonSerialization['subtotal'] as num).toDouble(),
      stockDeduction: (jsonSerialization['stockDeduction'] as num?)?.toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int transactionId;

  int productId;

  String productName;

  int quantity;

  double unitPrice;

  double subtotal;

  double? stockDeduction;

  /// Returns a shallow copy of this [TransactionItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TransactionItem copyWith({
    int? id,
    int? transactionId,
    int? productId,
    String? productName,
    int? quantity,
    double? unitPrice,
    double? subtotal,
    double? stockDeduction,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TransactionItem',
      if (id != null) 'id': id,
      'transactionId': transactionId,
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'subtotal': subtotal,
      if (stockDeduction != null) 'stockDeduction': stockDeduction,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TransactionItemImpl extends TransactionItem {
  _TransactionItemImpl({
    int? id,
    required int transactionId,
    required int productId,
    required String productName,
    required int quantity,
    required double unitPrice,
    required double subtotal,
    double? stockDeduction,
  }) : super._(
         id: id,
         transactionId: transactionId,
         productId: productId,
         productName: productName,
         quantity: quantity,
         unitPrice: unitPrice,
         subtotal: subtotal,
         stockDeduction: stockDeduction,
       );

  /// Returns a shallow copy of this [TransactionItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TransactionItem copyWith({
    Object? id = _Undefined,
    int? transactionId,
    int? productId,
    String? productName,
    int? quantity,
    double? unitPrice,
    double? subtotal,
    Object? stockDeduction = _Undefined,
  }) {
    return TransactionItem(
      id: id is int? ? id : this.id,
      transactionId: transactionId ?? this.transactionId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      subtotal: subtotal ?? this.subtotal,
      stockDeduction: stockDeduction is double?
          ? stockDeduction
          : this.stockDeduction,
    );
  }
}
