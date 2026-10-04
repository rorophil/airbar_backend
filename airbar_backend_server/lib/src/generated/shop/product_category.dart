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

abstract class ProductCategory
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ProductCategory._({
    this.id,
    required this.name,
    this.description,
    this.iconName,
    int? displayOrder,
    bool? isActive,
    required this.createdAt,
    required this.updatedAt,
  }) : displayOrder = displayOrder ?? 0,
       isActive = isActive ?? true;

  factory ProductCategory({
    int? id,
    required String name,
    String? description,
    String? iconName,
    int? displayOrder,
    bool? isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProductCategoryImpl;

  factory ProductCategory.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProductCategory(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      iconName: jsonSerialization['iconName'] as String?,
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

  static final t = ProductCategoryTable();

  static const db = ProductCategoryRepository._();

  @override
  int? id;

  String name;

  String? description;

  String? iconName;

  int displayOrder;

  bool isActive;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ProductCategory]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProductCategory copyWith({
    int? id,
    String? name,
    String? description,
    String? iconName,
    int? displayOrder,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProductCategory',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      if (iconName != null) 'iconName': iconName,
      'displayOrder': displayOrder,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ProductCategory',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      if (iconName != null) 'iconName': iconName,
      'displayOrder': displayOrder,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static ProductCategoryInclude include() {
    return ProductCategoryInclude._();
  }

  static ProductCategoryIncludeList includeList({
    _i1.WhereExpressionBuilder<ProductCategoryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductCategoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductCategoryTable>? orderByList,
    ProductCategoryInclude? include,
  }) {
    return ProductCategoryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductCategory.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProductCategory.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProductCategoryImpl extends ProductCategory {
  _ProductCategoryImpl({
    int? id,
    required String name,
    String? description,
    String? iconName,
    int? displayOrder,
    bool? isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         description: description,
         iconName: iconName,
         displayOrder: displayOrder,
         isActive: isActive,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [ProductCategory]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProductCategory copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    Object? iconName = _Undefined,
    int? displayOrder,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProductCategory(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      iconName: iconName is String? ? iconName : this.iconName,
      displayOrder: displayOrder ?? this.displayOrder,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class ProductCategoryUpdateTable extends _i1.UpdateTable<ProductCategoryTable> {
  ProductCategoryUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> iconName(String? value) => _i1.ColumnValue(
    table.iconName,
    value,
  );

  _i1.ColumnValue<int, int> displayOrder(int value) => _i1.ColumnValue(
    table.displayOrder,
    value,
  );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
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

class ProductCategoryTable extends _i1.Table<int?> {
  ProductCategoryTable({super.tableRelation})
    : super(tableName: 'product_categories') {
    updateTable = ProductCategoryUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    iconName = _i1.ColumnString(
      'iconName',
      this,
    );
    displayOrder = _i1.ColumnInt(
      'displayOrder',
      this,
      hasDefault: true,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
      hasDefault: true,
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

  late final ProductCategoryUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnString iconName;

  late final _i1.ColumnInt displayOrder;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    description,
    iconName,
    displayOrder,
    isActive,
    createdAt,
    updatedAt,
  ];
}

class ProductCategoryInclude extends _i1.IncludeObject {
  ProductCategoryInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ProductCategory.t;
}

class ProductCategoryIncludeList extends _i1.IncludeList {
  ProductCategoryIncludeList._({
    _i1.WhereExpressionBuilder<ProductCategoryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProductCategory.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ProductCategory.t;
}

class ProductCategoryRepository {
  const ProductCategoryRepository._();

  /// Returns a list of [ProductCategory]s matching the given query parameters.
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
  Future<List<ProductCategory>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductCategoryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductCategoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductCategoryTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ProductCategory>(
      where: where?.call(ProductCategory.t),
      orderBy: orderBy?.call(ProductCategory.t),
      orderByList: orderByList?.call(ProductCategory.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [ProductCategory] matching the given query parameters.
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
  Future<ProductCategory?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductCategoryTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProductCategoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductCategoryTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ProductCategory>(
      where: where?.call(ProductCategory.t),
      orderBy: orderBy?.call(ProductCategory.t),
      orderByList: orderByList?.call(ProductCategory.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [ProductCategory] by its [id] or null if no such row exists.
  Future<ProductCategory?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ProductCategory>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [ProductCategory]s in the list and returns the inserted rows.
  ///
  /// The returned [ProductCategory]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProductCategory>> insert(
    _i1.Session session,
    List<ProductCategory> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProductCategory>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProductCategory] and returns the inserted row.
  ///
  /// The returned [ProductCategory] will have its `id` field set.
  Future<ProductCategory> insertRow(
    _i1.Session session,
    ProductCategory row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProductCategory>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProductCategory]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProductCategory>> update(
    _i1.Session session,
    List<ProductCategory> rows, {
    _i1.ColumnSelections<ProductCategoryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProductCategory>(
      rows,
      columns: columns?.call(ProductCategory.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProductCategory]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProductCategory> updateRow(
    _i1.Session session,
    ProductCategory row, {
    _i1.ColumnSelections<ProductCategoryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProductCategory>(
      row,
      columns: columns?.call(ProductCategory.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProductCategory] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ProductCategory?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ProductCategoryUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ProductCategory>(
      id,
      columnValues: columnValues(ProductCategory.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ProductCategory]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ProductCategory>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ProductCategoryUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<ProductCategoryTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductCategoryTable>? orderBy,
    _i1.OrderByListBuilder<ProductCategoryTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ProductCategory>(
      columnValues: columnValues(ProductCategory.t.updateTable),
      where: where(ProductCategory.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductCategory.t),
      orderByList: orderByList?.call(ProductCategory.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ProductCategory]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProductCategory>> delete(
    _i1.Session session,
    List<ProductCategory> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProductCategory>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProductCategory].
  Future<ProductCategory> deleteRow(
    _i1.Session session,
    ProductCategory row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProductCategory>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProductCategory>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProductCategoryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProductCategory>(
      where: where(ProductCategory.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductCategoryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProductCategory>(
      where: where?.call(ProductCategory.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
