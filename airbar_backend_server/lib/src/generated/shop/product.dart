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

abstract class Product
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Product._({
    this.id,
    required this.name,
    this.description,
    required this.price,
    required this.categoryId,
    int? stockQuantity,
    int? minStockAlert,
    this.currentUnitRemaining,
    this.imageUrl,
    bool? isActive,
    bool? isDeleted,
    bool? trackStock,
    bool? isBulkProduct,
    this.bulkUnit,
    this.bulkTotalQuantity,
    required this.createdAt,
    required this.updatedAt,
  }) : stockQuantity = stockQuantity ?? 0,
       minStockAlert = minStockAlert ?? 5,
       isActive = isActive ?? true,
       isDeleted = isDeleted ?? false,
       trackStock = trackStock ?? true,
       isBulkProduct = isBulkProduct ?? false;

  factory Product({
    int? id,
    required String name,
    String? description,
    required double price,
    required int categoryId,
    int? stockQuantity,
    int? minStockAlert,
    double? currentUnitRemaining,
    String? imageUrl,
    bool? isActive,
    bool? isDeleted,
    bool? trackStock,
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
      stockQuantity: jsonSerialization['stockQuantity'] as int?,
      minStockAlert: jsonSerialization['minStockAlert'] as int?,
      currentUnitRemaining: (jsonSerialization['currentUnitRemaining'] as num?)
          ?.toDouble(),
      imageUrl: jsonSerialization['imageUrl'] as String?,
      isActive: jsonSerialization['isActive'] as bool?,
      isDeleted: jsonSerialization['isDeleted'] as bool?,
      trackStock: jsonSerialization['trackStock'] as bool?,
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

  static final t = ProductTable();

  static const db = ProductRepository._();

  @override
  int? id;

  String name;

  String? description;

  double price;

  int categoryId;

  int stockQuantity;

  int minStockAlert;

  double? currentUnitRemaining;

  String? imageUrl;

  bool isActive;

  bool isDeleted;

  bool trackStock;

  bool isBulkProduct;

  String? bulkUnit;

  double? bulkTotalQuantity;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Product copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    int? categoryId,
    int? stockQuantity,
    int? minStockAlert,
    double? currentUnitRemaining,
    String? imageUrl,
    bool? isActive,
    bool? isDeleted,
    bool? trackStock,
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
      if (currentUnitRemaining != null)
        'currentUnitRemaining': currentUnitRemaining,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'isActive': isActive,
      'isDeleted': isDeleted,
      'trackStock': trackStock,
      'isBulkProduct': isBulkProduct,
      if (bulkUnit != null) 'bulkUnit': bulkUnit,
      if (bulkTotalQuantity != null) 'bulkTotalQuantity': bulkTotalQuantity,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Product',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'price': price,
      'categoryId': categoryId,
      'stockQuantity': stockQuantity,
      'minStockAlert': minStockAlert,
      if (currentUnitRemaining != null)
        'currentUnitRemaining': currentUnitRemaining,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'isActive': isActive,
      'isDeleted': isDeleted,
      'trackStock': trackStock,
      'isBulkProduct': isBulkProduct,
      if (bulkUnit != null) 'bulkUnit': bulkUnit,
      if (bulkTotalQuantity != null) 'bulkTotalQuantity': bulkTotalQuantity,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static ProductInclude include() {
    return ProductInclude._();
  }

  static ProductIncludeList includeList({
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductTable>? orderByList,
    ProductInclude? include,
  }) {
    return ProductIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Product.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Product.t),
      include: include,
    );
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
    int? stockQuantity,
    int? minStockAlert,
    double? currentUnitRemaining,
    String? imageUrl,
    bool? isActive,
    bool? isDeleted,
    bool? trackStock,
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
         currentUnitRemaining: currentUnitRemaining,
         imageUrl: imageUrl,
         isActive: isActive,
         isDeleted: isDeleted,
         trackStock: trackStock,
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
    int? stockQuantity,
    int? minStockAlert,
    Object? currentUnitRemaining = _Undefined,
    Object? imageUrl = _Undefined,
    bool? isActive,
    bool? isDeleted,
    bool? trackStock,
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
      currentUnitRemaining: currentUnitRemaining is double?
          ? currentUnitRemaining
          : this.currentUnitRemaining,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      isActive: isActive ?? this.isActive,
      isDeleted: isDeleted ?? this.isDeleted,
      trackStock: trackStock ?? this.trackStock,
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

class ProductUpdateTable extends _i1.UpdateTable<ProductTable> {
  ProductUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<double, double> price(double value) => _i1.ColumnValue(
    table.price,
    value,
  );

  _i1.ColumnValue<int, int> categoryId(int value) => _i1.ColumnValue(
    table.categoryId,
    value,
  );

  _i1.ColumnValue<int, int> stockQuantity(int value) => _i1.ColumnValue(
    table.stockQuantity,
    value,
  );

  _i1.ColumnValue<int, int> minStockAlert(int value) => _i1.ColumnValue(
    table.minStockAlert,
    value,
  );

  _i1.ColumnValue<double, double> currentUnitRemaining(double? value) =>
      _i1.ColumnValue(
        table.currentUnitRemaining,
        value,
      );

  _i1.ColumnValue<String, String> imageUrl(String? value) => _i1.ColumnValue(
    table.imageUrl,
    value,
  );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );

  _i1.ColumnValue<bool, bool> isDeleted(bool value) => _i1.ColumnValue(
    table.isDeleted,
    value,
  );

  _i1.ColumnValue<bool, bool> trackStock(bool value) => _i1.ColumnValue(
    table.trackStock,
    value,
  );

  _i1.ColumnValue<bool, bool> isBulkProduct(bool value) => _i1.ColumnValue(
    table.isBulkProduct,
    value,
  );

  _i1.ColumnValue<String, String> bulkUnit(String? value) => _i1.ColumnValue(
    table.bulkUnit,
    value,
  );

  _i1.ColumnValue<double, double> bulkTotalQuantity(double? value) =>
      _i1.ColumnValue(
        table.bulkTotalQuantity,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class ProductTable extends _i1.Table<int?> {
  ProductTable({super.tableRelation}) : super(tableName: 'products') {
    updateTable = ProductUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    price = _i1.ColumnDouble(
      'price',
      this,
    );
    categoryId = _i1.ColumnInt(
      'categoryId',
      this,
    );
    stockQuantity = _i1.ColumnInt(
      'stockQuantity',
      this,
      hasDefault: true,
    );
    minStockAlert = _i1.ColumnInt(
      'minStockAlert',
      this,
      hasDefault: true,
    );
    currentUnitRemaining = _i1.ColumnDouble(
      'currentUnitRemaining',
      this,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
      hasDefault: true,
    );
    isDeleted = _i1.ColumnBool(
      'isDeleted',
      this,
      hasDefault: true,
    );
    trackStock = _i1.ColumnBool(
      'trackStock',
      this,
      hasDefault: true,
    );
    isBulkProduct = _i1.ColumnBool(
      'isBulkProduct',
      this,
      hasDefault: true,
    );
    bulkUnit = _i1.ColumnString(
      'bulkUnit',
      this,
    );
    bulkTotalQuantity = _i1.ColumnDouble(
      'bulkTotalQuantity',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final ProductUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnDouble price;

  late final _i1.ColumnInt categoryId;

  late final _i1.ColumnInt stockQuantity;

  late final _i1.ColumnInt minStockAlert;

  late final _i1.ColumnDouble currentUnitRemaining;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnBool isDeleted;

  late final _i1.ColumnBool trackStock;

  late final _i1.ColumnBool isBulkProduct;

  late final _i1.ColumnString bulkUnit;

  late final _i1.ColumnDouble bulkTotalQuantity;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    description,
    price,
    categoryId,
    stockQuantity,
    minStockAlert,
    currentUnitRemaining,
    imageUrl,
    isActive,
    isDeleted,
    trackStock,
    isBulkProduct,
    bulkUnit,
    bulkTotalQuantity,
    createdAt,
    updatedAt,
  ];
}

class ProductInclude extends _i1.IncludeObject {
  ProductInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Product.t;
}

class ProductIncludeList extends _i1.IncludeList {
  ProductIncludeList._({
    _i1.WhereExpressionBuilder<ProductTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Product.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Product.t;
}

class ProductRepository {
  const ProductRepository._();

  /// Returns a list of [Product]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Product>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Product>(
      where: where?.call(Product.t),
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Product] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Product?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProductTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Product>(
      where: where?.call(Product.t),
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Product] by its [id] or null if no such row exists.
  Future<Product?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Product>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Product]s in the list and returns the inserted rows.
  ///
  /// The returned [Product]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Product>> insert(
    _i1.Session session,
    List<Product> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Product>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Product] and returns the inserted row.
  ///
  /// The returned [Product] will have its `id` field set.
  Future<Product> insertRow(
    _i1.Session session,
    Product row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Product>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Product]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Product>> update(
    _i1.Session session,
    List<Product> rows, {
    _i1.ColumnSelections<ProductTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Product>(
      rows,
      columns: columns?.call(Product.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Product]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Product> updateRow(
    _i1.Session session,
    Product row, {
    _i1.ColumnSelections<ProductTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Product>(
      row,
      columns: columns?.call(Product.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Product] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Product?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ProductUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Product>(
      id,
      columnValues: columnValues(Product.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Product]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Product>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ProductUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ProductTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductTable>? orderBy,
    _i1.OrderByListBuilder<ProductTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Product>(
      columnValues: columnValues(Product.t.updateTable),
      where: where(Product.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Product]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Product>> delete(
    _i1.Session session,
    List<Product> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Product>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Product].
  Future<Product> deleteRow(
    _i1.Session session,
    Product row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Product>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Product>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProductTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Product>(
      where: where(Product.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Product>(
      where: where?.call(Product.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
