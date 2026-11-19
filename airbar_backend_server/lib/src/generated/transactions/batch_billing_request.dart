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

abstract class BatchBillingRequest
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  BatchBillingRequest._({
    this.id,
    required this.requestKey,
    required this.adminId,
    required this.requestHash,
    required this.transactionIds,
    required this.createdAt,
  });

  factory BatchBillingRequest({
    int? id,
    required String requestKey,
    required int adminId,
    required String requestHash,
    required String transactionIds,
    required DateTime createdAt,
  }) = _BatchBillingRequestImpl;

  factory BatchBillingRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return BatchBillingRequest(
      id: jsonSerialization['id'] as int?,
      requestKey: jsonSerialization['requestKey'] as String,
      adminId: jsonSerialization['adminId'] as int,
      requestHash: jsonSerialization['requestHash'] as String,
      transactionIds: jsonSerialization['transactionIds'] as String,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = BatchBillingRequestTable();

  static const db = BatchBillingRequestRepository._();

  @override
  int? id;

  String requestKey;

  int adminId;

  String requestHash;

  String transactionIds;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [BatchBillingRequest]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  BatchBillingRequest copyWith({
    int? id,
    String? requestKey,
    int? adminId,
    String? requestHash,
    String? transactionIds,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BatchBillingRequest',
      if (id != null) 'id': id,
      'requestKey': requestKey,
      'adminId': adminId,
      'requestHash': requestHash,
      'transactionIds': transactionIds,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BatchBillingRequest',
      if (id != null) 'id': id,
      'requestKey': requestKey,
      'adminId': adminId,
      'requestHash': requestHash,
      'transactionIds': transactionIds,
      'createdAt': createdAt.toJson(),
    };
  }

  static BatchBillingRequestInclude include() {
    return BatchBillingRequestInclude._();
  }

  static BatchBillingRequestIncludeList includeList({
    _is.WhereExpressionBuilder<BatchBillingRequestTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BatchBillingRequestTable>? orderBy,
    _is.OrderByListBuilder<BatchBillingRequestTable>? orderByList,
    BatchBillingRequestInclude? include,
  }) {
    return BatchBillingRequestIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BatchBillingRequest.t),
      orderByList: orderByList?.call(BatchBillingRequest.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BatchBillingRequestImpl extends BatchBillingRequest {
  _BatchBillingRequestImpl({
    int? id,
    required String requestKey,
    required int adminId,
    required String requestHash,
    required String transactionIds,
    required DateTime createdAt,
  }) : super._(
         id: id,
         requestKey: requestKey,
         adminId: adminId,
         requestHash: requestHash,
         transactionIds: transactionIds,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [BatchBillingRequest]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  BatchBillingRequest copyWith({
    Object? id = _Undefined,
    String? requestKey,
    int? adminId,
    String? requestHash,
    String? transactionIds,
    DateTime? createdAt,
  }) {
    return BatchBillingRequest(
      id: id is int? ? id : this.id,
      requestKey: requestKey ?? this.requestKey,
      adminId: adminId ?? this.adminId,
      requestHash: requestHash ?? this.requestHash,
      transactionIds: transactionIds ?? this.transactionIds,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class BatchBillingRequestUpdateTable
    extends _is.UpdateTable<BatchBillingRequestTable> {
  BatchBillingRequestUpdateTable(super.table);

  _is.ColumnValue<String, String> requestKey(String value) => _is.ColumnValue(
    table.requestKey,
    value,
  );

  _is.ColumnValue<int, int> adminId(int value) => _is.ColumnValue(
    table.adminId,
    value,
  );

  _is.ColumnValue<String, String> requestHash(String value) => _is.ColumnValue(
    table.requestHash,
    value,
  );

  _is.ColumnValue<String, String> transactionIds(String value) =>
      _is.ColumnValue(
        table.transactionIds,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class BatchBillingRequestTable extends _is.Table<int?> {
  BatchBillingRequestTable({super.tableRelation})
    : super(tableName: 'batch_billing_requests') {
    updateTable = BatchBillingRequestUpdateTable(this);
    requestKey = _is.ColumnString(
      'requestKey',
      this,
    );
    adminId = _is.ColumnInt(
      'adminId',
      this,
    );
    requestHash = _is.ColumnString(
      'requestHash',
      this,
    );
    transactionIds = _is.ColumnString(
      'transactionIds',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final BatchBillingRequestUpdateTable updateTable;

  late final _is.ColumnString requestKey;

  late final _is.ColumnInt adminId;

  late final _is.ColumnString requestHash;

  late final _is.ColumnString transactionIds;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    requestKey,
    adminId,
    requestHash,
    transactionIds,
    createdAt,
  ];
}

class BatchBillingRequestInclude extends _is.IncludeObject {
  BatchBillingRequestInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => BatchBillingRequest.t;
}

class BatchBillingRequestIncludeList extends _is.IncludeList {
  BatchBillingRequestIncludeList._({
    _is.WhereExpressionBuilder<BatchBillingRequestTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BatchBillingRequest.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => BatchBillingRequest.t;
}

class BatchBillingRequestRepository {
  const BatchBillingRequestRepository._();

  /// Returns a list of [BatchBillingRequest]s matching the given query parameters.
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
  Future<List<BatchBillingRequest>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BatchBillingRequestTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BatchBillingRequestTable>? orderBy,
    _is.OrderByListBuilder<BatchBillingRequestTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<BatchBillingRequest>(
      where: where?.call(BatchBillingRequest.t),
      orderBy: orderBy?.call(BatchBillingRequest.t),
      orderByList: orderByList?.call(BatchBillingRequest.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [BatchBillingRequest] matching the given query parameters.
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
  Future<BatchBillingRequest?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BatchBillingRequestTable>? where,
    int? offset,
    _is.OrderByBuilder<BatchBillingRequestTable>? orderBy,
    _is.OrderByListBuilder<BatchBillingRequestTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<BatchBillingRequest>(
      where: where?.call(BatchBillingRequest.t),
      orderBy: orderBy?.call(BatchBillingRequest.t),
      orderByList: orderByList?.call(BatchBillingRequest.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [BatchBillingRequest] by its [id] or null if no such row exists.
  Future<BatchBillingRequest?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<BatchBillingRequest>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [BatchBillingRequest]s in the list and returns the inserted rows.
  ///
  /// The returned [BatchBillingRequest]s will have their `id` fields set.
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
  Future<List<BatchBillingRequest>> insert(
    _is.DatabaseSession session,
    List<BatchBillingRequest> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<BatchBillingRequest>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [BatchBillingRequest] and returns the inserted row.
  ///
  /// The returned [BatchBillingRequest] will have its `id` field set.
  Future<BatchBillingRequest> insertRow(
    _is.DatabaseSession session,
    BatchBillingRequest row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<BatchBillingRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [BatchBillingRequest]s in the list and returns the resulting rows.
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
  /// The returned [BatchBillingRequest]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BatchBillingRequest>> upsert(
    _is.DatabaseSession session,
    List<BatchBillingRequest> rows, {
    required _is.ColumnSelections<BatchBillingRequestTable> conflictColumns,
    _is.ColumnSelections<BatchBillingRequestTable>? updateColumns,
    _is.WhereExpressionBuilder<BatchBillingRequestTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<BatchBillingRequest>(
      rows,
      conflictColumns: conflictColumns(BatchBillingRequest.t),
      updateColumns: updateColumns?.call(BatchBillingRequest.t),
      updateWhere: updateWhere?.call(BatchBillingRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [BatchBillingRequest] and returns the resulting row.
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
  /// The returned [BatchBillingRequest] will have its `id` field set.
  Future<BatchBillingRequest?> upsertRow(
    _is.DatabaseSession session,
    BatchBillingRequest row, {
    required _is.ColumnSelections<BatchBillingRequestTable> conflictColumns,
    _is.ColumnSelections<BatchBillingRequestTable>? updateColumns,
    _is.WhereExpressionBuilder<BatchBillingRequestTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<BatchBillingRequest>(
      row,
      conflictColumns: conflictColumns(BatchBillingRequest.t),
      updateColumns: updateColumns?.call(BatchBillingRequest.t),
      updateWhere: updateWhere?.call(BatchBillingRequest.t),
      transaction: transaction,
    );
  }

  /// Updates all [BatchBillingRequest]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BatchBillingRequest>> update(
    _is.DatabaseSession session,
    List<BatchBillingRequest> rows, {
    _is.ColumnSelections<BatchBillingRequestTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<BatchBillingRequest>(
      rows,
      columns: columns?.call(BatchBillingRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [BatchBillingRequest]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BatchBillingRequest> updateRow(
    _is.DatabaseSession session,
    BatchBillingRequest row, {
    _is.ColumnSelections<BatchBillingRequestTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<BatchBillingRequest>(
      row,
      columns: columns?.call(BatchBillingRequest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BatchBillingRequest] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<BatchBillingRequest?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<BatchBillingRequestUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<BatchBillingRequest>(
      id,
      columnValues: columnValues(BatchBillingRequest.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [BatchBillingRequest]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BatchBillingRequest>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<BatchBillingRequestUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<BatchBillingRequestTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BatchBillingRequestTable>? orderBy,
    _is.OrderByListBuilder<BatchBillingRequestTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<BatchBillingRequest>(
      columnValues: columnValues(BatchBillingRequest.t.updateTable),
      where: where(BatchBillingRequest.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BatchBillingRequest.t),
      orderByList: orderByList?.call(BatchBillingRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [BatchBillingRequest]s in the list and returns the deleted rows.
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
  Future<List<BatchBillingRequest>> delete(
    _is.DatabaseSession session,
    List<BatchBillingRequest> rows, {
    _is.OrderByBuilder<BatchBillingRequestTable>? orderBy,
    _is.OrderByListBuilder<BatchBillingRequestTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<BatchBillingRequest>(
      rows,
      orderBy: orderBy?.call(BatchBillingRequest.t),
      orderByList: orderByList?.call(BatchBillingRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [BatchBillingRequest].
  Future<BatchBillingRequest> deleteRow(
    _is.DatabaseSession session,
    BatchBillingRequest row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BatchBillingRequest>(
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
  Future<List<BatchBillingRequest>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BatchBillingRequestTable> where,
    _is.OrderByBuilder<BatchBillingRequestTable>? orderBy,
    _is.OrderByListBuilder<BatchBillingRequestTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<BatchBillingRequest>(
      where: where(BatchBillingRequest.t),
      orderBy: orderBy?.call(BatchBillingRequest.t),
      orderByList: orderByList?.call(BatchBillingRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BatchBillingRequestTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<BatchBillingRequest>(
      where: where?.call(BatchBillingRequest.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [BatchBillingRequest] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BatchBillingRequestTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<BatchBillingRequest>(
      where: where(BatchBillingRequest.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
