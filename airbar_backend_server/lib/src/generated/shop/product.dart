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

abstract class Product
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      isActive: jsonSerialization['isActive'] == null
          ? null
          : _is.BoolJsonExtension.fromJson(jsonSerialization['isActive']),
      isDeleted: jsonSerialization['isDeleted'] == null
          ? null
          : _is.BoolJsonExtension.fromJson(jsonSerialization['isDeleted']),
      trackStock: jsonSerialization['trackStock'] == null
          ? null
          : _is.BoolJsonExtension.fromJson(jsonSerialization['trackStock']),
      isBulkProduct: jsonSerialization['isBulkProduct'] == null
          ? null
          : _is.BoolJsonExtension.fromJson(jsonSerialization['isBulkProduct']),
      bulkUnit: jsonSerialization['bulkUnit'] as String?,
      bulkTotalQuantity: (jsonSerialization['bulkTotalQuantity'] as num?)
          ?.toDouble(),
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _is.DateTimeJsonExtension.fromJson(
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
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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
    _is.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProductTable>? orderBy,
    _is.OrderByListBuilder<ProductTable>? orderByList,
    ProductInclude? include,
  }) {
    return ProductIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class ProductUpdateTable extends _is.UpdateTable<ProductTable> {
  ProductUpdateTable(super.table);

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
    table.name,
    value,
  );

  _is.ColumnValue<String, String> description(String? value) => _is.ColumnValue(
    table.description,
    value,
  );

  _is.ColumnValue<double, double> price(double value) => _is.ColumnValue(
    table.price,
    value,
  );

  _is.ColumnValue<int, int> categoryId(int value) => _is.ColumnValue(
    table.categoryId,
    value,
  );

  _is.ColumnValue<int, int> stockQuantity(int value) => _is.ColumnValue(
    table.stockQuantity,
    value,
  );

  _is.ColumnValue<int, int> minStockAlert(int value) => _is.ColumnValue(
    table.minStockAlert,
    value,
  );

  _is.ColumnValue<double, double> currentUnitRemaining(double? value) =>
      _is.ColumnValue(
        table.currentUnitRemaining,
        value,
      );

  _is.ColumnValue<String, String> imageUrl(String? value) => _is.ColumnValue(
    table.imageUrl,
    value,
  );

  _is.ColumnValue<bool, bool> isActive(bool value) => _is.ColumnValue(
    table.isActive,
    value,
  );

  _is.ColumnValue<bool, bool> isDeleted(bool value) => _is.ColumnValue(
    table.isDeleted,
    value,
  );

  _is.ColumnValue<bool, bool> trackStock(bool value) => _is.ColumnValue(
    table.trackStock,
    value,
  );

  _is.ColumnValue<bool, bool> isBulkProduct(bool value) => _is.ColumnValue(
    table.isBulkProduct,
    value,
  );

  _is.ColumnValue<String, String> bulkUnit(String? value) => _is.ColumnValue(
    table.bulkUnit,
    value,
  );

  _is.ColumnValue<double, double> bulkTotalQuantity(double? value) =>
      _is.ColumnValue(
        table.bulkTotalQuantity,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _is.ColumnValue(
        table.updatedAt,
        value,
      );
}

class ProductTable extends _is.Table<int?> {
  ProductTable({super.tableRelation}) : super(tableName: 'products') {
    updateTable = ProductUpdateTable(this);
    name = _is.ColumnString(
      'name',
      this,
    );
    description = _is.ColumnString(
      'description',
      this,
    );
    price = _is.ColumnDouble(
      'price',
      this,
    );
    categoryId = _is.ColumnInt(
      'categoryId',
      this,
    );
    stockQuantity = _is.ColumnInt(
      'stockQuantity',
      this,
      hasDefault: true,
    );
    minStockAlert = _is.ColumnInt(
      'minStockAlert',
      this,
      hasDefault: true,
    );
    currentUnitRemaining = _is.ColumnDouble(
      'currentUnitRemaining',
      this,
    );
    imageUrl = _is.ColumnString(
      'imageUrl',
      this,
    );
    isActive = _is.ColumnBool(
      'isActive',
      this,
      hasDefault: true,
    );
    isDeleted = _is.ColumnBool(
      'isDeleted',
      this,
      hasDefault: true,
    );
    trackStock = _is.ColumnBool(
      'trackStock',
      this,
      hasDefault: true,
    );
    isBulkProduct = _is.ColumnBool(
      'isBulkProduct',
      this,
      hasDefault: true,
    );
    bulkUnit = _is.ColumnString(
      'bulkUnit',
      this,
    );
    bulkTotalQuantity = _is.ColumnDouble(
      'bulkTotalQuantity',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _is.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final ProductUpdateTable updateTable;

  late final _is.ColumnString name;

  late final _is.ColumnString description;

  late final _is.ColumnDouble price;

  late final _is.ColumnInt categoryId;

  late final _is.ColumnInt stockQuantity;

  late final _is.ColumnInt minStockAlert;

  late final _is.ColumnDouble currentUnitRemaining;

  late final _is.ColumnString imageUrl;

  late final _is.ColumnBool isActive;

  late final _is.ColumnBool isDeleted;

  late final _is.ColumnBool trackStock;

  late final _is.ColumnBool isBulkProduct;

  late final _is.ColumnString bulkUnit;

  late final _is.ColumnDouble bulkTotalQuantity;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnDateTime updatedAt;

  @override
  List<_is.Column> get columns => [
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

class ProductInclude extends _is.IncludeObject {
  ProductInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Product.t;
}

class ProductIncludeList extends _is.IncludeList {
  ProductIncludeList._({
    _is.WhereExpressionBuilder<ProductTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Product.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Product.t;
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
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProductTable>? orderBy,
    _is.OrderByListBuilder<ProductTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Product>(
      where: where?.call(Product.t),
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
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
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProductTable>? where,
    int? offset,
    _is.OrderByBuilder<ProductTable>? orderBy,
    _is.OrderByListBuilder<ProductTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Product>(
      where: where?.call(Product.t),
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Product] by its [id] or null if no such row exists.
  Future<Product?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Product>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Product]s in the list and returns the inserted rows.
  ///
  /// The returned [Product]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Product>> insert(
    _is.DatabaseSession session,
    List<Product> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Product>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Product] and returns the inserted row.
  ///
  /// The returned [Product] will have its `id` field set.
  Future<Product> insertRow(
    _is.DatabaseSession session,
    Product row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Product>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Product]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [Product]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Product>> upsert(
    _is.DatabaseSession session,
    List<Product> rows, {
    required _is.ColumnSelections<ProductTable> conflictColumns,
    _is.ColumnSelections<ProductTable>? updateColumns,
    _is.WhereExpressionBuilder<ProductTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Product>(
      rows,
      conflictColumns: conflictColumns(Product.t),
      updateColumns: updateColumns?.call(Product.t),
      updateWhere: updateWhere?.call(Product.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Product] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [Product] will have its `id` field set.
  Future<Product?> upsertRow(
    _is.DatabaseSession session,
    Product row, {
    required _is.ColumnSelections<ProductTable> conflictColumns,
    _is.ColumnSelections<ProductTable>? updateColumns,
    _is.WhereExpressionBuilder<ProductTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Product>(
      row,
      conflictColumns: conflictColumns(Product.t),
      updateColumns: updateColumns?.call(Product.t),
      updateWhere: updateWhere?.call(Product.t),
      transaction: transaction,
    );
  }

  /// Updates all [Product]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Product>> update(
    _is.DatabaseSession session,
    List<Product> rows, {
    _is.ColumnSelections<ProductTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Product>(
      rows,
      columns: columns?.call(Product.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Product]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Product> updateRow(
    _is.DatabaseSession session,
    Product row, {
    _is.ColumnSelections<ProductTable>? columns,
    _is.Transaction? transaction,
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
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<ProductUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Product>(
      id,
      columnValues: columnValues(Product.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Product]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Product>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ProductUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<ProductTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProductTable>? orderBy,
    _is.OrderByListBuilder<ProductTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Product>(
      columnValues: columnValues(Product.t.updateTable),
      where: where(Product.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Product]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Product>> delete(
    _is.DatabaseSession session,
    List<Product> rows, {
    _is.OrderByBuilder<ProductTable>? orderBy,
    _is.OrderByListBuilder<ProductTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Product>(
      rows,
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Product].
  Future<Product> deleteRow(
    _is.DatabaseSession session,
    Product row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Product>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Product>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ProductTable> where,
    _is.OrderByBuilder<ProductTable>? orderBy,
    _is.OrderByListBuilder<ProductTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Product>(
      where: where(Product.t),
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Product>(
      where: where?.call(Product.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Product] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ProductTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Product>(
      where: where(Product.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
