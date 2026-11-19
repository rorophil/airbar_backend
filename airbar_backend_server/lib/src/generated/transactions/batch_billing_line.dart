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
import 'package:serverpod/serverpod.dart' as _is;

abstract class BatchBillingLine
    implements _is.SerializableModel, _is.ProtocolSerialization {
  BatchBillingLine._({
    required this.userId,
    required this.productId,
    this.productPortionId,
    required this.quantity,
  });

  factory BatchBillingLine({
    required int userId,
    required int productId,
    int? productPortionId,
    required int quantity,
  }) = _BatchBillingLineImpl;

  factory BatchBillingLine.fromJson(Map<String, dynamic> jsonSerialization) {
    return BatchBillingLine(
      userId: jsonSerialization['userId'] as int,
      productId: jsonSerialization['productId'] as int,
      productPortionId: jsonSerialization['productPortionId'] as int?,
      quantity: jsonSerialization['quantity'] as int,
    );
  }

  int userId;

  int productId;

  int? productPortionId;

  int quantity;

  /// Returns a shallow copy of this [BatchBillingLine]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  BatchBillingLine copyWith({
    int? userId,
    int? productId,
    int? productPortionId,
    int? quantity,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BatchBillingLine',
      'userId': userId,
      'productId': productId,
      if (productPortionId != null) 'productPortionId': productPortionId,
      'quantity': quantity,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BatchBillingLine',
      'userId': userId,
      'productId': productId,
      if (productPortionId != null) 'productPortionId': productPortionId,
      'quantity': quantity,
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BatchBillingLineImpl extends BatchBillingLine {
  _BatchBillingLineImpl({
    required int userId,
    required int productId,
    int? productPortionId,
    required int quantity,
  }) : super._(
         userId: userId,
         productId: productId,
         productPortionId: productPortionId,
         quantity: quantity,
       );

  /// Returns a shallow copy of this [BatchBillingLine]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  BatchBillingLine copyWith({
    int? userId,
    int? productId,
    Object? productPortionId = _Undefined,
    int? quantity,
  }) {
    return BatchBillingLine(
      userId: userId ?? this.userId,
      productId: productId ?? this.productId,
      productPortionId: productPortionId is int?
          ? productPortionId
          : this.productPortionId,
      quantity: quantity ?? this.quantity,
    );
  }
}
