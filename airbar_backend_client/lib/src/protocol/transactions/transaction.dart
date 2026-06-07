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
import '../transactions/transaction_type.dart' as _i2;
import '../transactions/payment_method.dart' as _i3;

abstract class Transaction implements _i1.SerializableModel {
  Transaction._({
    this.id,
    this.userId,
    required this.type,
    required this.totalAmount,
    required this.timestamp,
    this.notes,
    this.refundedTransactionId,
    this.sellerId,
    this.paymentMethod,
    this.balanceAfter,
  });

  factory Transaction({
    int? id,
    int? userId,
    required _i2.TransactionType type,
    required double totalAmount,
    required DateTime timestamp,
    String? notes,
    int? refundedTransactionId,
    int? sellerId,
    _i3.PaymentMethod? paymentMethod,
    double? balanceAfter,
  }) = _TransactionImpl;

  factory Transaction.fromJson(Map<String, dynamic> jsonSerialization) {
    return Transaction(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int?,
      type: _i2.TransactionType.fromJson((jsonSerialization['type'] as String)),
      totalAmount: (jsonSerialization['totalAmount'] as num).toDouble(),
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      notes: jsonSerialization['notes'] as String?,
      refundedTransactionId: jsonSerialization['refundedTransactionId'] as int?,
      sellerId: jsonSerialization['sellerId'] as int?,
      paymentMethod: jsonSerialization['paymentMethod'] == null
          ? null
          : _i3.PaymentMethod.fromJson(
              (jsonSerialization['paymentMethod'] as String),
            ),
      balanceAfter: (jsonSerialization['balanceAfter'] as num?)?.toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? userId;

  _i2.TransactionType type;

  double totalAmount;

  DateTime timestamp;

  String? notes;

  int? refundedTransactionId;

  int? sellerId;

  _i3.PaymentMethod? paymentMethod;

  double? balanceAfter;

  /// Returns a shallow copy of this [Transaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Transaction copyWith({
    int? id,
    int? userId,
    _i2.TransactionType? type,
    double? totalAmount,
    DateTime? timestamp,
    String? notes,
    int? refundedTransactionId,
    int? sellerId,
    _i3.PaymentMethod? paymentMethod,
    double? balanceAfter,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Transaction',
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      'type': type.toJson(),
      'totalAmount': totalAmount,
      'timestamp': timestamp.toJson(),
      if (notes != null) 'notes': notes,
      if (refundedTransactionId != null)
        'refundedTransactionId': refundedTransactionId,
      if (sellerId != null) 'sellerId': sellerId,
      if (paymentMethod != null) 'paymentMethod': paymentMethod?.toJson(),
      if (balanceAfter != null) 'balanceAfter': balanceAfter,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TransactionImpl extends Transaction {
  _TransactionImpl({
    int? id,
    int? userId,
    required _i2.TransactionType type,
    required double totalAmount,
    required DateTime timestamp,
    String? notes,
    int? refundedTransactionId,
    int? sellerId,
    _i3.PaymentMethod? paymentMethod,
    double? balanceAfter,
  }) : super._(
         id: id,
         userId: userId,
         type: type,
         totalAmount: totalAmount,
         timestamp: timestamp,
         notes: notes,
         refundedTransactionId: refundedTransactionId,
         sellerId: sellerId,
         paymentMethod: paymentMethod,
         balanceAfter: balanceAfter,
       );

  /// Returns a shallow copy of this [Transaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Transaction copyWith({
    Object? id = _Undefined,
    Object? userId = _Undefined,
    _i2.TransactionType? type,
    double? totalAmount,
    DateTime? timestamp,
    Object? notes = _Undefined,
    Object? refundedTransactionId = _Undefined,
    Object? sellerId = _Undefined,
    Object? paymentMethod = _Undefined,
    Object? balanceAfter = _Undefined,
  }) {
    return Transaction(
      id: id is int? ? id : this.id,
      userId: userId is int? ? userId : this.userId,
      type: type ?? this.type,
      totalAmount: totalAmount ?? this.totalAmount,
      timestamp: timestamp ?? this.timestamp,
      notes: notes is String? ? notes : this.notes,
      refundedTransactionId: refundedTransactionId is int?
          ? refundedTransactionId
          : this.refundedTransactionId,
      sellerId: sellerId is int? ? sellerId : this.sellerId,
      paymentMethod: paymentMethod is _i3.PaymentMethod?
          ? paymentMethod
          : this.paymentMethod,
      balanceAfter: balanceAfter is double? ? balanceAfter : this.balanceAfter,
    );
  }
}
