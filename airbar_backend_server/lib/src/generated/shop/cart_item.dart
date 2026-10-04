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

abstract class CartItem
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      addedAt: _is.DateTimeJsonExtension.fromJson(jsonSerialization['addedAt']),
    );
  }

  static final t = CartItemTable();

  static const db = CartItemRepository._();

  @override
  int? id;

  int userId;

  int productId;

  int? productPortionId;

  int quantity;

  DateTime addedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [CartItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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
  Map<String, dynamic> toJsonForProtocol() {
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

  static CartItemInclude include() {
    return CartItemInclude._();
  }

  static CartItemIncludeList includeList({
    _is.WhereExpressionBuilder<CartItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CartItemTable>? orderBy,
    _is.OrderByListBuilder<CartItemTable>? orderByList,
    CartItemInclude? include,
  }) {
    return CartItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CartItem.t),
      orderByList: orderByList?.call(CartItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class CartItemUpdateTable extends _is.UpdateTable<CartItemTable> {
  CartItemUpdateTable(super.table);

  _is.ColumnValue<int, int> userId(int value) => _is.ColumnValue(
    table.userId,
    value,
  );

  _is.ColumnValue<int, int> productId(int value) => _is.ColumnValue(
    table.productId,
    value,
  );

  _is.ColumnValue<int, int> productPortionId(int? value) => _is.ColumnValue(
    table.productPortionId,
    value,
  );

  _is.ColumnValue<int, int> quantity(int value) => _is.ColumnValue(
    table.quantity,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> addedAt(DateTime value) =>
      _is.ColumnValue(
        table.addedAt,
        value,
      );
}

class CartItemTable extends _is.Table<int?> {
  CartItemTable({super.tableRelation}) : super(tableName: 'cart_items') {
    updateTable = CartItemUpdateTable(this);
    userId = _is.ColumnInt(
      'userId',
      this,
    );
    productId = _is.ColumnInt(
      'productId',
      this,
    );
    productPortionId = _is.ColumnInt(
      'productPortionId',
      this,
    );
    quantity = _is.ColumnInt(
      'quantity',
      this,
      hasDefault: true,
    );
    addedAt = _is.ColumnDateTime(
      'addedAt',
      this,
    );
  }

  late final CartItemUpdateTable updateTable;

  late final _is.ColumnInt userId;

  late final _is.ColumnInt productId;

  late final _is.ColumnInt productPortionId;

  late final _is.ColumnInt quantity;

  late final _is.ColumnDateTime addedAt;

  @override
  List<_is.Column> get columns => [
    id,
    userId,
    productId,
    productPortionId,
    quantity,
    addedAt,
  ];
}

class CartItemInclude extends _is.IncludeObject {
  CartItemInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => CartItem.t;
}

class CartItemIncludeList extends _is.IncludeList {
  CartItemIncludeList._({
    _is.WhereExpressionBuilder<CartItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CartItem.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => CartItem.t;
}

class CartItemRepository {
  const CartItemRepository._();

  /// Returns a list of [CartItem]s matching the given query parameters.
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
  Future<List<CartItem>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CartItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CartItemTable>? orderBy,
    _is.OrderByListBuilder<CartItemTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<CartItem>(
      where: where?.call(CartItem.t),
      orderBy: orderBy?.call(CartItem.t),
      orderByList: orderByList?.call(CartItem.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [CartItem] matching the given query parameters.
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
  Future<CartItem?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CartItemTable>? where,
    int? offset,
    _is.OrderByBuilder<CartItemTable>? orderBy,
    _is.OrderByListBuilder<CartItemTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<CartItem>(
      where: where?.call(CartItem.t),
      orderBy: orderBy?.call(CartItem.t),
      orderByList: orderByList?.call(CartItem.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [CartItem] by its [id] or null if no such row exists.
  Future<CartItem?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<CartItem>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [CartItem]s in the list and returns the inserted rows.
  ///
  /// The returned [CartItem]s will have their `id` fields set.
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
  Future<List<CartItem>> insert(
    _is.DatabaseSession session,
    List<CartItem> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<CartItem>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [CartItem] and returns the inserted row.
  ///
  /// The returned [CartItem] will have its `id` field set.
  Future<CartItem> insertRow(
    _is.DatabaseSession session,
    CartItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<CartItem>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [CartItem]s in the list and returns the resulting rows.
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
  /// The returned [CartItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CartItem>> upsert(
    _is.DatabaseSession session,
    List<CartItem> rows, {
    required _is.ColumnSelections<CartItemTable> conflictColumns,
    _is.ColumnSelections<CartItemTable>? updateColumns,
    _is.WhereExpressionBuilder<CartItemTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<CartItem>(
      rows,
      conflictColumns: conflictColumns(CartItem.t),
      updateColumns: updateColumns?.call(CartItem.t),
      updateWhere: updateWhere?.call(CartItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [CartItem] and returns the resulting row.
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
  /// The returned [CartItem] will have its `id` field set.
  Future<CartItem?> upsertRow(
    _is.DatabaseSession session,
    CartItem row, {
    required _is.ColumnSelections<CartItemTable> conflictColumns,
    _is.ColumnSelections<CartItemTable>? updateColumns,
    _is.WhereExpressionBuilder<CartItemTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<CartItem>(
      row,
      conflictColumns: conflictColumns(CartItem.t),
      updateColumns: updateColumns?.call(CartItem.t),
      updateWhere: updateWhere?.call(CartItem.t),
      transaction: transaction,
    );
  }

  /// Updates all [CartItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CartItem>> update(
    _is.DatabaseSession session,
    List<CartItem> rows, {
    _is.ColumnSelections<CartItemTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<CartItem>(
      rows,
      columns: columns?.call(CartItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [CartItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CartItem> updateRow(
    _is.DatabaseSession session,
    CartItem row, {
    _is.ColumnSelections<CartItemTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<CartItem>(
      row,
      columns: columns?.call(CartItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CartItem] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CartItem?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<CartItemUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<CartItem>(
      id,
      columnValues: columnValues(CartItem.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CartItem]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CartItem>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<CartItemUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<CartItemTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CartItemTable>? orderBy,
    _is.OrderByListBuilder<CartItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<CartItem>(
      columnValues: columnValues(CartItem.t.updateTable),
      where: where(CartItem.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CartItem.t),
      orderByList: orderByList?.call(CartItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [CartItem]s in the list and returns the deleted rows.
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
  Future<List<CartItem>> delete(
    _is.DatabaseSession session,
    List<CartItem> rows, {
    _is.OrderByBuilder<CartItemTable>? orderBy,
    _is.OrderByListBuilder<CartItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<CartItem>(
      rows,
      orderBy: orderBy?.call(CartItem.t),
      orderByList: orderByList?.call(CartItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [CartItem].
  Future<CartItem> deleteRow(
    _is.DatabaseSession session,
    CartItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CartItem>(
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
  Future<List<CartItem>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CartItemTable> where,
    _is.OrderByBuilder<CartItemTable>? orderBy,
    _is.OrderByListBuilder<CartItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<CartItem>(
      where: where(CartItem.t),
      orderBy: orderBy?.call(CartItem.t),
      orderByList: orderByList?.call(CartItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CartItemTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<CartItem>(
      where: where?.call(CartItem.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [CartItem] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CartItemTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<CartItem>(
      where: where(CartItem.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
