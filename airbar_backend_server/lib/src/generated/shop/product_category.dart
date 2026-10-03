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

abstract class ProductCategory
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      isActive: jsonSerialization['isActive'] == null
          ? null
          : _is.BoolJsonExtension.fromJson(jsonSerialization['isActive']),
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _is.DateTimeJsonExtension.fromJson(
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
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [ProductCategory]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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
    _is.WhereExpressionBuilder<ProductCategoryTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProductCategoryTable>? orderBy,
    _is.OrderByListBuilder<ProductCategoryTable>? orderByList,
    ProductCategoryInclude? include,
  }) {
    return ProductCategoryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductCategory.t),
      orderByList: orderByList?.call(ProductCategory.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class ProductCategoryUpdateTable extends _is.UpdateTable<ProductCategoryTable> {
  ProductCategoryUpdateTable(super.table);

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
    table.name,
    value,
  );

  _is.ColumnValue<String, String> description(String? value) => _is.ColumnValue(
    table.description,
    value,
  );

  _is.ColumnValue<String, String> iconName(String? value) => _is.ColumnValue(
    table.iconName,
    value,
  );

  _is.ColumnValue<int, int> displayOrder(int value) => _is.ColumnValue(
    table.displayOrder,
    value,
  );

  _is.ColumnValue<bool, bool> isActive(bool value) => _is.ColumnValue(
    table.isActive,
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

class ProductCategoryTable extends _is.Table<int?> {
  ProductCategoryTable({super.tableRelation})
    : super(tableName: 'product_categories') {
    updateTable = ProductCategoryUpdateTable(this);
    name = _is.ColumnString(
      'name',
      this,
    );
    description = _is.ColumnString(
      'description',
      this,
    );
    iconName = _is.ColumnString(
      'iconName',
      this,
    );
    displayOrder = _is.ColumnInt(
      'displayOrder',
      this,
      hasDefault: true,
    );
    isActive = _is.ColumnBool(
      'isActive',
      this,
      hasDefault: true,
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

  late final ProductCategoryUpdateTable updateTable;

  late final _is.ColumnString name;

  late final _is.ColumnString description;

  late final _is.ColumnString iconName;

  late final _is.ColumnInt displayOrder;

  late final _is.ColumnBool isActive;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnDateTime updatedAt;

  @override
  List<_is.Column> get columns => [
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

class ProductCategoryInclude extends _is.IncludeObject {
  ProductCategoryInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => ProductCategory.t;
}

class ProductCategoryIncludeList extends _is.IncludeList {
  ProductCategoryIncludeList._({
    _is.WhereExpressionBuilder<ProductCategoryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProductCategory.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => ProductCategory.t;
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
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProductCategoryTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProductCategoryTable>? orderBy,
    _is.OrderByListBuilder<ProductCategoryTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ProductCategory>(
      where: where?.call(ProductCategory.t),
      orderBy: orderBy?.call(ProductCategory.t),
      orderByList: orderByList?.call(ProductCategory.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
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
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProductCategoryTable>? where,
    int? offset,
    _is.OrderByBuilder<ProductCategoryTable>? orderBy,
    _is.OrderByListBuilder<ProductCategoryTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ProductCategory>(
      where: where?.call(ProductCategory.t),
      orderBy: orderBy?.call(ProductCategory.t),
      orderByList: orderByList?.call(ProductCategory.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ProductCategory] by its [id] or null if no such row exists.
  Future<ProductCategory?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ProductCategory>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ProductCategory]s in the list and returns the inserted rows.
  ///
  /// The returned [ProductCategory]s will have their `id` fields set.
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
  Future<List<ProductCategory>> insert(
    _is.DatabaseSession session,
    List<ProductCategory> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<ProductCategory>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [ProductCategory] and returns the inserted row.
  ///
  /// The returned [ProductCategory] will have its `id` field set.
  Future<ProductCategory> insertRow(
    _is.DatabaseSession session,
    ProductCategory row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProductCategory>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [ProductCategory]s in the list and returns the resulting rows.
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
  /// The returned [ProductCategory]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ProductCategory>> upsert(
    _is.DatabaseSession session,
    List<ProductCategory> rows, {
    required _is.ColumnSelections<ProductCategoryTable> conflictColumns,
    _is.ColumnSelections<ProductCategoryTable>? updateColumns,
    _is.WhereExpressionBuilder<ProductCategoryTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<ProductCategory>(
      rows,
      conflictColumns: conflictColumns(ProductCategory.t),
      updateColumns: updateColumns?.call(ProductCategory.t),
      updateWhere: updateWhere?.call(ProductCategory.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [ProductCategory] and returns the resulting row.
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
  /// The returned [ProductCategory] will have its `id` field set.
  Future<ProductCategory?> upsertRow(
    _is.DatabaseSession session,
    ProductCategory row, {
    required _is.ColumnSelections<ProductCategoryTable> conflictColumns,
    _is.ColumnSelections<ProductCategoryTable>? updateColumns,
    _is.WhereExpressionBuilder<ProductCategoryTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<ProductCategory>(
      row,
      conflictColumns: conflictColumns(ProductCategory.t),
      updateColumns: updateColumns?.call(ProductCategory.t),
      updateWhere: updateWhere?.call(ProductCategory.t),
      transaction: transaction,
    );
  }

  /// Updates all [ProductCategory]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ProductCategory>> update(
    _is.DatabaseSession session,
    List<ProductCategory> rows, {
    _is.ColumnSelections<ProductCategoryTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<ProductCategory>(
      rows,
      columns: columns?.call(ProductCategory.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [ProductCategory]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProductCategory> updateRow(
    _is.DatabaseSession session,
    ProductCategory row, {
    _is.ColumnSelections<ProductCategoryTable>? columns,
    _is.Transaction? transaction,
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
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<ProductCategoryUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<ProductCategory>(
      id,
      columnValues: columnValues(ProductCategory.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ProductCategory]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ProductCategory>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ProductCategoryUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<ProductCategoryTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProductCategoryTable>? orderBy,
    _is.OrderByListBuilder<ProductCategoryTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<ProductCategory>(
      columnValues: columnValues(ProductCategory.t.updateTable),
      where: where(ProductCategory.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductCategory.t),
      orderByList: orderByList?.call(ProductCategory.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [ProductCategory]s in the list and returns the deleted rows.
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
  Future<List<ProductCategory>> delete(
    _is.DatabaseSession session,
    List<ProductCategory> rows, {
    _is.OrderByBuilder<ProductCategoryTable>? orderBy,
    _is.OrderByListBuilder<ProductCategoryTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<ProductCategory>(
      rows,
      orderBy: orderBy?.call(ProductCategory.t),
      orderByList: orderByList?.call(ProductCategory.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [ProductCategory].
  Future<ProductCategory> deleteRow(
    _is.DatabaseSession session,
    ProductCategory row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProductCategory>(
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
  Future<List<ProductCategory>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ProductCategoryTable> where,
    _is.OrderByBuilder<ProductCategoryTable>? orderBy,
    _is.OrderByListBuilder<ProductCategoryTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<ProductCategory>(
      where: where(ProductCategory.t),
      orderBy: orderBy?.call(ProductCategory.t),
      orderByList: orderByList?.call(ProductCategory.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProductCategoryTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<ProductCategory>(
      where: where?.call(ProductCategory.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ProductCategory] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ProductCategoryTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ProductCategory>(
      where: where(ProductCategory.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
