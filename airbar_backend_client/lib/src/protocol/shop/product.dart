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

abstract class Product implements _i1.SerializableModel {
  Product._({
    this.id,
    required this.name,
    this.description,
    required this.price,
    required this.categoryId,
    double? stockQuantity,
    double? minStockAlert,
    this.imageUrl,
    bool? isActive,
    bool? isDeleted,
    bool? isBulkProduct,
    this.bulkUnit,
    this.bulkTotalQuantity,
    required this.createdAt,
    required this.updatedAt,
  }) : stockQuantity = stockQuantity ?? 0.0,
       minStockAlert = minStockAlert ?? 5.0,
       isActive = isActive ?? true,
       isDeleted = isDeleted ?? false,
       isBulkProduct = isBulkProduct ?? false;

  factory Product({
    int? id,
    required String name,
    String? description,
    required double price,
    required int categoryId,
    double? stockQuantity,
    double? minStockAlert,
    String? imageUrl,
    bool? isActive,
    bool? isDeleted,
    bool? isBulkProduct,
    String? bulkUnit,
    double? bulkTotalQuantity,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProductImpl;

  factory Product.fromJson(Map<String, dynamic> jsonSerialization) {
    return Product(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      price: (jsonSerialization['price'] as num).toDouble(),
      categoryId: jsonSerialization['categoryId'] as int,
      stockQuantity: (jsonSerialization['stockQuantity'] as num?)?.toDouble(),
      minStockAlert: (jsonSerialization['minStockAlert'] as num?)?.toDouble(),
      imageUrl: jsonSerialization['imageUrl'] as String?,
      isActive: jsonSerialization['isActive'] as bool?,
      isDeleted: jsonSerialization['isDeleted'] as bool?,
      isBulkProduct: jsonSerialization['isBulkProduct'] as bool?,
      bulkUnit: jsonSerialization['bulkUnit'] as String?,
      bulkTotalQuantity: (jsonSerialization['bulkTotalQuantity'] as num?)
          ?.toDouble(),
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

  String name;

  String? description;

  double price;

  int categoryId;

  double stockQuantity;

  double minStockAlert;

  String? imageUrl;

  bool isActive;

  bool isDeleted;

  bool isBulkProduct;

  String? bulkUnit;

  double? bulkTotalQuantity;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Product copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    int? categoryId,
    double? stockQuantity,
    double? minStockAlert,
    String? imageUrl,
    bool? isActive,
    bool? isDeleted,
    bool? isBulkProduct,
    String? bulkUnit,
    double? bulkTotalQuantity,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Product',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'price': price,
      'categoryId': categoryId,
      'stockQuantity': stockQuantity,
      'minStockAlert': minStockAlert,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'isActive': isActive,
      'isDeleted': isDeleted,
      'isBulkProduct': isBulkProduct,
      if (bulkUnit != null) 'bulkUnit': bulkUnit,
      if (bulkTotalQuantity != null) 'bulkTotalQuantity': bulkTotalQuantity,
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

class _ProductImpl extends Product {
  _ProductImpl({
    int? id,
    required String name,
    String? description,
    required double price,
    required int categoryId,
    double? stockQuantity,
    double? minStockAlert,
    String? imageUrl,
    bool? isActive,
    bool? isDeleted,
    bool? isBulkProduct,
    String? bulkUnit,
    double? bulkTotalQuantity,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         description: description,
         price: price,
         categoryId: categoryId,
         stockQuantity: stockQuantity,
         minStockAlert: minStockAlert,
         imageUrl: imageUrl,
         isActive: isActive,
         isDeleted: isDeleted,
         isBulkProduct: isBulkProduct,
         bulkUnit: bulkUnit,
         bulkTotalQuantity: bulkTotalQuantity,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Product copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    double? price,
    int? categoryId,
    double? stockQuantity,
    double? minStockAlert,
    Object? imageUrl = _Undefined,
    bool? isActive,
    bool? isDeleted,
    bool? isBulkProduct,
    Object? bulkUnit = _Undefined,
    Object? bulkTotalQuantity = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      price: price ?? this.price,
      categoryId: categoryId ?? this.categoryId,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      minStockAlert: minStockAlert ?? this.minStockAlert,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      isActive: isActive ?? this.isActive,
      isDeleted: isDeleted ?? this.isDeleted,
      isBulkProduct: isBulkProduct ?? this.isBulkProduct,
      bulkUnit: bulkUnit is String? ? bulkUnit : this.bulkUnit,
      bulkTotalQuantity: bulkTotalQuantity is double?
          ? bulkTotalQuantity
          : this.bulkTotalQuantity,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
