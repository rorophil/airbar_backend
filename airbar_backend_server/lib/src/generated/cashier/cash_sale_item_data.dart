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

abstract class CashSaleItemData
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CashSaleItemData._({
    required this.productId,
    required this.quantity,
    this.productPortionId,
  });

  factory CashSaleItemData({
    required int productId,
    required int quantity,
    int? productPortionId,
  }) = _CashSaleItemDataImpl;

  factory CashSaleItemData.fromJson(Map<String, dynamic> jsonSerialization) {
    return CashSaleItemData(
      productId: jsonSerialization['productId'] as int,
      quantity: jsonSerialization['quantity'] as int,
      productPortionId: jsonSerialization['productPortionId'] as int?,
    );
  }

  int productId;

  int quantity;

  int? productPortionId;

  /// Returns a shallow copy of this [CashSaleItemData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CashSaleItemData copyWith({
    int? productId,
    int? quantity,
    int? productPortionId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CashSaleItemData',
      'productId': productId,
      'quantity': quantity,
      if (productPortionId != null) 'productPortionId': productPortionId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CashSaleItemData',
      'productId': productId,
      'quantity': quantity,
      if (productPortionId != null) 'productPortionId': productPortionId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CashSaleItemDataImpl extends CashSaleItemData {
  _CashSaleItemDataImpl({
    required int productId,
    required int quantity,
    int? productPortionId,
  }) : super._(
         productId: productId,
         quantity: quantity,
         productPortionId: productPortionId,
       );

  /// Returns a shallow copy of this [CashSaleItemData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CashSaleItemData copyWith({
    int? productId,
    int? quantity,
    Object? productPortionId = _Undefined,
  }) {
    return CashSaleItemData(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      productPortionId: productPortionId is int?
          ? productPortionId
          : this.productPortionId,
    );
  }
}
