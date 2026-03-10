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

abstract class ProductPortion implements _i1.SerializableModel {
  ProductPortion._({
    this.id,
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
    int? displayOrder,
    bool? isActive,
    required this.createdAt,
    required this.updatedAt,
  }) : displayOrder = displayOrder ?? 0,
       isActive = isActive ?? true;

  factory ProductPortion({
    int? id,
    required int productId,
    required String name,
    required double quantity,
    required double price,
    int? displayOrder,
    bool? isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProductPortionImpl;

  factory ProductPortion.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProductPortion(
      id: jsonSerialization['id'] as int?,
      productId: jsonSerialization['productId'] as int,
      name: jsonSerialization['name'] as String,
      quantity: (jsonSerialization['quantity'] as num).toDouble(),
      price: (jsonSerialization['price'] as num).toDouble(),
      displayOrder: jsonSerialization['displayOrder'] as int?,
      isActive: jsonSerialization['isActive'] as bool?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int productId;

  String name;

  double quantity;

  double price;

  int displayOrder;

  bool isActive;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [ProductPortion]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProductPortion copyWith({
    int? id,
    int? productId,
    String? name,
    double? quantity,
    double? price,
    int? displayOrder,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProductPortion',
      if (id != null) 'id': id,
      'productId': productId,
      'name': name,
      'quantity': quantity,
      'price': price,
      'displayOrder': displayOrder,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProductPortionImpl extends ProductPortion {
  _ProductPortionImpl({
    int? id,
    required int productId,
    required String name,
    required double quantity,
    required double price,
    int? displayOrder,
    bool? isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         productId: productId,
         name: name,
         quantity: quantity,
         price: price,
         displayOrder: displayOrder,
         isActive: isActive,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [ProductPortion]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProductPortion copyWith({
    Object? id = _Undefined,
    int? productId,
    String? name,
    double? quantity,
    double? price,
    int? displayOrder,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProductPortion(
      id: id is int? ? id : this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      displayOrder: displayOrder ?? this.displayOrder,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
