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

abstract class TransactionItem
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  TransactionItem._({
    this.id,
    required this.transactionId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.subtotal,
    double? stockDeduction,
  }) : stockDeduction = stockDeduction ?? 0.0;

  factory TransactionItem({
    int? id,
    required int transactionId,
    required int productId,
    required String productName,
    required int quantity,
    required double unitPrice,
    required double subtotal,
    double? stockDeduction,
  }) = _TransactionItemImpl;

  factory TransactionItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return TransactionItem(
      id: jsonSerialization['id'] as int?,
      transactionId: jsonSerialization['transactionId'] as int,
      productId: jsonSerialization['productId'] as int,
      productName: jsonSerialization['productName'] as String,
      quantity: jsonSerialization['quantity'] as int,
      unitPrice: (jsonSerialization['unitPrice'] as num).toDouble(),
      subtotal: (jsonSerialization['subtotal'] as num).toDouble(),
      stockDeduction: (jsonSerialization['stockDeduction'] as num?)?.toDouble(),
    );
  }

  static final t = TransactionItemTable();

  static const db = TransactionItemRepository._();

  @override
  int? id;

  int transactionId;

  int productId;

  String productName;

  int quantity;

  double unitPrice;

  double subtotal;

  double? stockDeduction;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [TransactionItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  TransactionItem copyWith({
    int? id,
    int? transactionId,
    int? productId,
    String? productName,
    int? quantity,
    double? unitPrice,
    double? subtotal,
    double? stockDeduction,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TransactionItem',
      if (id != null) 'id': id,
      'transactionId': transactionId,
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'subtotal': subtotal,
      if (stockDeduction != null) 'stockDeduction': stockDeduction,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TransactionItem',
      if (id != null) 'id': id,
      'transactionId': transactionId,
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'subtotal': subtotal,
      if (stockDeduction != null) 'stockDeduction': stockDeduction,
    };
  }

  static TransactionItemInclude include() {
    return TransactionItemInclude._();
  }

  static TransactionItemIncludeList includeList({
    _is.WhereExpressionBuilder<TransactionItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TransactionItemTable>? orderBy,
    _is.OrderByListBuilder<TransactionItemTable>? orderByList,
    TransactionItemInclude? include,
  }) {
    return TransactionItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TransactionItem.t),
      orderByList: orderByList?.call(TransactionItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TransactionItemImpl extends TransactionItem {
  _TransactionItemImpl({
    int? id,
    required int transactionId,
    required int productId,
    required String productName,
    required int quantity,
    required double unitPrice,
    required double subtotal,
    double? stockDeduction,
  }) : super._(
         id: id,
         transactionId: transactionId,
         productId: productId,
         productName: productName,
         quantity: quantity,
         unitPrice: unitPrice,
         subtotal: subtotal,
         stockDeduction: stockDeduction,
       );

  /// Returns a shallow copy of this [TransactionItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  TransactionItem copyWith({
    Object? id = _Undefined,
    int? transactionId,
    int? productId,
    String? productName,
    int? quantity,
    double? unitPrice,
    double? subtotal,
    Object? stockDeduction = _Undefined,
  }) {
    return TransactionItem(
      id: id is int? ? id : this.id,
      transactionId: transactionId ?? this.transactionId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      subtotal: subtotal ?? this.subtotal,
      stockDeduction: stockDeduction is double?
          ? stockDeduction
          : this.stockDeduction,
    );
  }
}

class TransactionItemUpdateTable extends _is.UpdateTable<TransactionItemTable> {
  TransactionItemUpdateTable(super.table);

  _is.ColumnValue<int, int> transactionId(int value) => _is.ColumnValue(
    table.transactionId,
    value,
  );

  _is.ColumnValue<int, int> productId(int value) => _is.ColumnValue(
    table.productId,
    value,
  );

  _is.ColumnValue<String, String> productName(String value) => _is.ColumnValue(
    table.productName,
    value,
  );

  _is.ColumnValue<int, int> quantity(int value) => _is.ColumnValue(
    table.quantity,
    value,
  );

  _is.ColumnValue<double, double> unitPrice(double value) => _is.ColumnValue(
    table.unitPrice,
    value,
  );

  _is.ColumnValue<double, double> subtotal(double value) => _is.ColumnValue(
    table.subtotal,
    value,
  );

  _is.ColumnValue<double, double> stockDeduction(double? value) =>
      _is.ColumnValue(
        table.stockDeduction,
        value,
      );
}

class TransactionItemTable extends _is.Table<int?> {
  TransactionItemTable({super.tableRelation})
    : super(tableName: 'transaction_items') {
    updateTable = TransactionItemUpdateTable(this);
    transactionId = _is.ColumnInt(
      'transactionId',
      this,
    );
    productId = _is.ColumnInt(
      'productId',
      this,
    );
    productName = _is.ColumnString(
      'productName',
      this,
    );
    quantity = _is.ColumnInt(
      'quantity',
      this,
    );
    unitPrice = _is.ColumnDouble(
      'unitPrice',
      this,
    );
    subtotal = _is.ColumnDouble(
      'subtotal',
      this,
    );
    stockDeduction = _is.ColumnDouble(
      'stockDeduction',
      this,
      hasDefault: true,
    );
  }

  late final TransactionItemUpdateTable updateTable;

  late final _is.ColumnInt transactionId;

  late final _is.ColumnInt productId;

  late final _is.ColumnString productName;

  late final _is.ColumnInt quantity;

  late final _is.ColumnDouble unitPrice;

  late final _is.ColumnDouble subtotal;

  late final _is.ColumnDouble stockDeduction;

  @override
  List<_is.Column> get columns => [
    id,
    transactionId,
    productId,
    productName,
    quantity,
    unitPrice,
    subtotal,
    stockDeduction,
  ];
}

class TransactionItemInclude extends _is.IncludeObject {
  TransactionItemInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => TransactionItem.t;
}

class TransactionItemIncludeList extends _is.IncludeList {
  TransactionItemIncludeList._({
    _is.WhereExpressionBuilder<TransactionItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TransactionItem.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => TransactionItem.t;
}

class TransactionItemRepository {
  const TransactionItemRepository._();

  /// Returns a list of [TransactionItem]s matching the given query parameters.
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
  Future<List<TransactionItem>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TransactionItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TransactionItemTable>? orderBy,
    _is.OrderByListBuilder<TransactionItemTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<TransactionItem>(
      where: where?.call(TransactionItem.t),
      orderBy: orderBy?.call(TransactionItem.t),
      orderByList: orderByList?.call(TransactionItem.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [TransactionItem] matching the given query parameters.
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
  Future<TransactionItem?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TransactionItemTable>? where,
    int? offset,
    _is.OrderByBuilder<TransactionItemTable>? orderBy,
    _is.OrderByListBuilder<TransactionItemTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<TransactionItem>(
      where: where?.call(TransactionItem.t),
      orderBy: orderBy?.call(TransactionItem.t),
      orderByList: orderByList?.call(TransactionItem.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [TransactionItem] by its [id] or null if no such row exists.
  Future<TransactionItem?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<TransactionItem>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [TransactionItem]s in the list and returns the inserted rows.
  ///
  /// The returned [TransactionItem]s will have their `id` fields set.
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
  Future<List<TransactionItem>> insert(
    _is.DatabaseSession session,
    List<TransactionItem> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<TransactionItem>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [TransactionItem] and returns the inserted row.
  ///
  /// The returned [TransactionItem] will have its `id` field set.
  Future<TransactionItem> insertRow(
    _is.DatabaseSession session,
    TransactionItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<TransactionItem>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [TransactionItem]s in the list and returns the resulting rows.
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
  /// The returned [TransactionItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<TransactionItem>> upsert(
    _is.DatabaseSession session,
    List<TransactionItem> rows, {
    required _is.ColumnSelections<TransactionItemTable> conflictColumns,
    _is.ColumnSelections<TransactionItemTable>? updateColumns,
    _is.WhereExpressionBuilder<TransactionItemTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<TransactionItem>(
      rows,
      conflictColumns: conflictColumns(TransactionItem.t),
      updateColumns: updateColumns?.call(TransactionItem.t),
      updateWhere: updateWhere?.call(TransactionItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [TransactionItem] and returns the resulting row.
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
  /// The returned [TransactionItem] will have its `id` field set.
  Future<TransactionItem?> upsertRow(
    _is.DatabaseSession session,
    TransactionItem row, {
    required _is.ColumnSelections<TransactionItemTable> conflictColumns,
    _is.ColumnSelections<TransactionItemTable>? updateColumns,
    _is.WhereExpressionBuilder<TransactionItemTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<TransactionItem>(
      row,
      conflictColumns: conflictColumns(TransactionItem.t),
      updateColumns: updateColumns?.call(TransactionItem.t),
      updateWhere: updateWhere?.call(TransactionItem.t),
      transaction: transaction,
    );
  }

  /// Updates all [TransactionItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<TransactionItem>> update(
    _is.DatabaseSession session,
    List<TransactionItem> rows, {
    _is.ColumnSelections<TransactionItemTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<TransactionItem>(
      rows,
      columns: columns?.call(TransactionItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [TransactionItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TransactionItem> updateRow(
    _is.DatabaseSession session,
    TransactionItem row, {
    _is.ColumnSelections<TransactionItemTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<TransactionItem>(
      row,
      columns: columns?.call(TransactionItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TransactionItem] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TransactionItem?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<TransactionItemUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<TransactionItem>(
      id,
      columnValues: columnValues(TransactionItem.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TransactionItem]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<TransactionItem>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<TransactionItemUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<TransactionItemTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TransactionItemTable>? orderBy,
    _is.OrderByListBuilder<TransactionItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<TransactionItem>(
      columnValues: columnValues(TransactionItem.t.updateTable),
      where: where(TransactionItem.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TransactionItem.t),
      orderByList: orderByList?.call(TransactionItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [TransactionItem]s in the list and returns the deleted rows.
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
  Future<List<TransactionItem>> delete(
    _is.DatabaseSession session,
    List<TransactionItem> rows, {
    _is.OrderByBuilder<TransactionItemTable>? orderBy,
    _is.OrderByListBuilder<TransactionItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<TransactionItem>(
      rows,
      orderBy: orderBy?.call(TransactionItem.t),
      orderByList: orderByList?.call(TransactionItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [TransactionItem].
  Future<TransactionItem> deleteRow(
    _is.DatabaseSession session,
    TransactionItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TransactionItem>(
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
  Future<List<TransactionItem>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<TransactionItemTable> where,
    _is.OrderByBuilder<TransactionItemTable>? orderBy,
    _is.OrderByListBuilder<TransactionItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<TransactionItem>(
      where: where(TransactionItem.t),
      orderBy: orderBy?.call(TransactionItem.t),
      orderByList: orderByList?.call(TransactionItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TransactionItemTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<TransactionItem>(
      where: where?.call(TransactionItem.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [TransactionItem] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<TransactionItemTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<TransactionItem>(
      where: where(TransactionItem.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
