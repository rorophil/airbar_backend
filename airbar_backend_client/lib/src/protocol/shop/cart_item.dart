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

abstract class CartItem implements _i1.SerializableModel {
  CartItem._({
    this.id,
    required this.userId,
    required this.productId,
    this.productPortionId,
    int? quantity,
    required this.addedAt,
  }) : quantity = quantity ?? 1;

  factory CartItem({
    int? id,
    required int userId,
    required int productId,
    int? productPortionId,
    int? quantity,
    required DateTime addedAt,
  }) = _CartItemImpl;

  factory CartItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return CartItem(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      productId: jsonSerialization['productId'] as int,
      productPortionId: jsonSerialization['productPortionId'] as int?,
      quantity: jsonSerialization['quantity'] as int?,
      addedAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['addedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  int productId;

  int? productPortionId;

  int quantity;

  DateTime addedAt;

  /// Returns a shallow copy of this [CartItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CartItem copyWith({
    int? id,
    int? userId,
    int? productId,
    int? productPortionId,
    int? quantity,
    DateTime? addedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CartItem',
      if (id != null) 'id': id,
      'userId': userId,
      'productId': productId,
      if (productPortionId != null) 'productPortionId': productPortionId,
      'quantity': quantity,
      'addedAt': addedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CartItemImpl extends CartItem {
  _CartItemImpl({
    int? id,
    required int userId,
    required int productId,
    int? productPortionId,
    int? quantity,
    required DateTime addedAt,
  }) : super._(
         id: id,
         userId: userId,
         productId: productId,
         productPortionId: productPortionId,
         quantity: quantity,
         addedAt: addedAt,
       );

  /// Returns a shallow copy of this [CartItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CartItem copyWith({
    Object? id = _Undefined,
    int? userId,
    int? productId,
    Object? productPortionId = _Undefined,
    int? quantity,
    DateTime? addedAt,
  }) {
    return CartItem(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      productId: productId ?? this.productId,
      productPortionId: productPortionId is int?
          ? productPortionId
          : this.productPortionId,
      quantity: quantity ?? this.quantity,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}
