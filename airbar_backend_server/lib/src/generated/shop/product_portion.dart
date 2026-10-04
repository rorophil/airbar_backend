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

abstract class ProductPortion
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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

  static final t = ProductPortionTable();

  static const db = ProductPortionRepository._();

  @override
  int? id;

  int productId;

  String name;

  double quantity;

  double price;

  int displayOrder;

  bool isActive;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [ProductPortion]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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
  Map<String, dynamic> toJsonForProtocol() {
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

  static ProductPortionInclude include() {
    return ProductPortionInclude._();
  }

  static ProductPortionIncludeList includeList({
    _is.WhereExpressionBuilder<ProductPortionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProductPortionTable>? orderBy,
    _is.OrderByListBuilder<ProductPortionTable>? orderByList,
    ProductPortionInclude? include,
  }) {
    return ProductPortionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductPortion.t),
      orderByList: orderByList?.call(ProductPortion.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class ProductPortionUpdateTable extends _is.UpdateTable<ProductPortionTable> {
  ProductPortionUpdateTable(super.table);

  _is.ColumnValue<int, int> productId(int value) => _is.ColumnValue(
    table.productId,
    value,
  );

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
    table.name,
    value,
  );

  _is.ColumnValue<double, double> quantity(double value) => _is.ColumnValue(
    table.quantity,
    value,
  );

  _is.ColumnValue<double, double> price(double value) => _is.ColumnValue(
    table.price,
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

class ProductPortionTable extends _is.Table<int?> {
  ProductPortionTable({super.tableRelation})
    : super(tableName: 'product_portions') {
    updateTable = ProductPortionUpdateTable(this);
    productId = _is.ColumnInt(
      'productId',
      this,
    );
    name = _is.ColumnString(
      'name',
      this,
    );
    quantity = _is.ColumnDouble(
      'quantity',
      this,
    );
    price = _is.ColumnDouble(
      'price',
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

  late final ProductPortionUpdateTable updateTable;

  late final _is.ColumnInt productId;

  late final _is.ColumnString name;

  late final _is.ColumnDouble quantity;

  late final _is.ColumnDouble price;

  late final _is.ColumnInt displayOrder;

  late final _is.ColumnBool isActive;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnDateTime updatedAt;

  @override
  List<_is.Column> get columns => [
    id,
    productId,
    name,
    quantity,
    price,
    displayOrder,
    isActive,
    createdAt,
    updatedAt,
  ];
}

class ProductPortionInclude extends _is.IncludeObject {
  ProductPortionInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => ProductPortion.t;
}

class ProductPortionIncludeList extends _is.IncludeList {
  ProductPortionIncludeList._({
    _is.WhereExpressionBuilder<ProductPortionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProductPortion.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => ProductPortion.t;
}

class ProductPortionRepository {
  const ProductPortionRepository._();

  /// Returns a list of [ProductPortion]s matching the given query parameters.
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
  Future<List<ProductPortion>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProductPortionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProductPortionTable>? orderBy,
    _is.OrderByListBuilder<ProductPortionTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ProductPortion>(
      where: where?.call(ProductPortion.t),
      orderBy: orderBy?.call(ProductPortion.t),
      orderByList: orderByList?.call(ProductPortion.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ProductPortion] matching the given query parameters.
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
  Future<ProductPortion?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProductPortionTable>? where,
    int? offset,
    _is.OrderByBuilder<ProductPortionTable>? orderBy,
    _is.OrderByListBuilder<ProductPortionTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ProductPortion>(
      where: where?.call(ProductPortion.t),
      orderBy: orderBy?.call(ProductPortion.t),
      orderByList: orderByList?.call(ProductPortion.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ProductPortion] by its [id] or null if no such row exists.
  Future<ProductPortion?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ProductPortion>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ProductPortion]s in the list and returns the inserted rows.
  ///
  /// The returned [ProductPortion]s will have their `id` fields set.
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
  Future<List<ProductPortion>> insert(
    _is.DatabaseSession session,
    List<ProductPortion> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<ProductPortion>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [ProductPortion] and returns the inserted row.
  ///
  /// The returned [ProductPortion] will have its `id` field set.
  Future<ProductPortion> insertRow(
    _is.DatabaseSession session,
    ProductPortion row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProductPortion>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [ProductPortion]s in the list and returns the resulting rows.
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
  /// The returned [ProductPortion]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ProductPortion>> upsert(
    _is.DatabaseSession session,
    List<ProductPortion> rows, {
    required _is.ColumnSelections<ProductPortionTable> conflictColumns,
    _is.ColumnSelections<ProductPortionTable>? updateColumns,
    _is.WhereExpressionBuilder<ProductPortionTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<ProductPortion>(
      rows,
      conflictColumns: conflictColumns(ProductPortion.t),
      updateColumns: updateColumns?.call(ProductPortion.t),
      updateWhere: updateWhere?.call(ProductPortion.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [ProductPortion] and returns the resulting row.
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
  /// The returned [ProductPortion] will have its `id` field set.
  Future<ProductPortion?> upsertRow(
    _is.DatabaseSession session,
    ProductPortion row, {
    required _is.ColumnSelections<ProductPortionTable> conflictColumns,
    _is.ColumnSelections<ProductPortionTable>? updateColumns,
    _is.WhereExpressionBuilder<ProductPortionTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<ProductPortion>(
      row,
      conflictColumns: conflictColumns(ProductPortion.t),
      updateColumns: updateColumns?.call(ProductPortion.t),
      updateWhere: updateWhere?.call(ProductPortion.t),
      transaction: transaction,
    );
  }

  /// Updates all [ProductPortion]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ProductPortion>> update(
    _is.DatabaseSession session,
    List<ProductPortion> rows, {
    _is.ColumnSelections<ProductPortionTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<ProductPortion>(
      rows,
      columns: columns?.call(ProductPortion.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [ProductPortion]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProductPortion> updateRow(
    _is.DatabaseSession session,
    ProductPortion row, {
    _is.ColumnSelections<ProductPortionTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProductPortion>(
      row,
      columns: columns?.call(ProductPortion.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProductPortion] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ProductPortion?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<ProductPortionUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<ProductPortion>(
      id,
      columnValues: columnValues(ProductPortion.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ProductPortion]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ProductPortion>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ProductPortionUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<ProductPortionTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProductPortionTable>? orderBy,
    _is.OrderByListBuilder<ProductPortionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<ProductPortion>(
      columnValues: columnValues(ProductPortion.t.updateTable),
      where: where(ProductPortion.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductPortion.t),
      orderByList: orderByList?.call(ProductPortion.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [ProductPortion]s in the list and returns the deleted rows.
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
  Future<List<ProductPortion>> delete(
    _is.DatabaseSession session,
    List<ProductPortion> rows, {
    _is.OrderByBuilder<ProductPortionTable>? orderBy,
    _is.OrderByListBuilder<ProductPortionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<ProductPortion>(
      rows,
      orderBy: orderBy?.call(ProductPortion.t),
      orderByList: orderByList?.call(ProductPortion.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [ProductPortion].
  Future<ProductPortion> deleteRow(
    _is.DatabaseSession session,
    ProductPortion row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProductPortion>(
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
  Future<List<ProductPortion>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ProductPortionTable> where,
    _is.OrderByBuilder<ProductPortionTable>? orderBy,
    _is.OrderByListBuilder<ProductPortionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<ProductPortion>(
      where: where(ProductPortion.t),
      orderBy: orderBy?.call(ProductPortion.t),
      orderByList: orderByList?.call(ProductPortion.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProductPortionTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<ProductPortion>(
      where: where?.call(ProductPortion.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ProductPortion] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ProductPortionTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ProductPortion>(
      where: where(ProductPortion.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
