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
import '../transactions/payment_method.dart' as _i4oqxmai;
import '../transactions/transaction_type.dart' as _igem0ql0;

abstract class Transaction
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  Transaction._({
    this.id,
    this.userId,
    required this.type,
    required this.totalAmount,
    required this.timestamp,
    this.notes,
    this.refundedTransactionId,
    this.sellerId,
    this.paymentMethod,
    this.balanceAfter,
  });

  factory Transaction({
    int? id,
    int? userId,
    required _igem0ql0.TransactionType type,
    required double totalAmount,
    required DateTime timestamp,
    String? notes,
    int? refundedTransactionId,
    int? sellerId,
    _i4oqxmai.PaymentMethod? paymentMethod,
    double? balanceAfter,
  }) = _TransactionImpl;

  factory Transaction.fromJson(Map<String, dynamic> jsonSerialization) {
    return Transaction(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int?,
      type: _igem0ql0.TransactionType.fromJson(
        (jsonSerialization['type'] as String),
      ),
      totalAmount: (jsonSerialization['totalAmount'] as num).toDouble(),
      timestamp: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      notes: jsonSerialization['notes'] as String?,
      refundedTransactionId: jsonSerialization['refundedTransactionId'] as int?,
      sellerId: jsonSerialization['sellerId'] as int?,
      paymentMethod: jsonSerialization['paymentMethod'] == null
          ? null
          : _i4oqxmai.PaymentMethod.fromJson(
              (jsonSerialization['paymentMethod'] as String),
            ),
      balanceAfter: (jsonSerialization['balanceAfter'] as num?)?.toDouble(),
    );
  }

  static final t = TransactionTable();

  static const db = TransactionRepository._();

  @override
  int? id;

  int? userId;

  _igem0ql0.TransactionType type;

  double totalAmount;

  DateTime timestamp;

  String? notes;

  int? refundedTransactionId;

  int? sellerId;

  _i4oqxmai.PaymentMethod? paymentMethod;

  double? balanceAfter;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Transaction]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Transaction copyWith({
    int? id,
    int? userId,
    _igem0ql0.TransactionType? type,
    double? totalAmount,
    DateTime? timestamp,
    String? notes,
    int? refundedTransactionId,
    int? sellerId,
    _i4oqxmai.PaymentMethod? paymentMethod,
    double? balanceAfter,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Transaction',
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      'type': type.toJson(),
      'totalAmount': totalAmount,
      'timestamp': timestamp.toJson(),
      if (notes != null) 'notes': notes,
      if (refundedTransactionId != null)
        'refundedTransactionId': refundedTransactionId,
      if (sellerId != null) 'sellerId': sellerId,
      if (paymentMethod != null) 'paymentMethod': paymentMethod?.toJson(),
      if (balanceAfter != null) 'balanceAfter': balanceAfter,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Transaction',
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      'type': type.toJson(),
      'totalAmount': totalAmount,
      'timestamp': timestamp.toJson(),
      if (notes != null) 'notes': notes,
      if (refundedTransactionId != null)
        'refundedTransactionId': refundedTransactionId,
      if (sellerId != null) 'sellerId': sellerId,
      if (paymentMethod != null) 'paymentMethod': paymentMethod?.toJson(),
      if (balanceAfter != null) 'balanceAfter': balanceAfter,
    };
  }

  static TransactionInclude include() {
    return TransactionInclude._();
  }

  static TransactionIncludeList includeList({
    _is.WhereExpressionBuilder<TransactionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TransactionTable>? orderBy,
    _is.OrderByListBuilder<TransactionTable>? orderByList,
    TransactionInclude? include,
  }) {
    return TransactionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Transaction.t),
      orderByList: orderByList?.call(Transaction.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TransactionImpl extends Transaction {
  _TransactionImpl({
    int? id,
    int? userId,
    required _igem0ql0.TransactionType type,
    required double totalAmount,
    required DateTime timestamp,
    String? notes,
    int? refundedTransactionId,
    int? sellerId,
    _i4oqxmai.PaymentMethod? paymentMethod,
    double? balanceAfter,
  }) : super._(
         id: id,
         userId: userId,
         type: type,
         totalAmount: totalAmount,
         timestamp: timestamp,
         notes: notes,
         refundedTransactionId: refundedTransactionId,
         sellerId: sellerId,
         paymentMethod: paymentMethod,
         balanceAfter: balanceAfter,
       );

  /// Returns a shallow copy of this [Transaction]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Transaction copyWith({
    Object? id = _Undefined,
    Object? userId = _Undefined,
    _igem0ql0.TransactionType? type,
    double? totalAmount,
    DateTime? timestamp,
    Object? notes = _Undefined,
    Object? refundedTransactionId = _Undefined,
    Object? sellerId = _Undefined,
    Object? paymentMethod = _Undefined,
    Object? balanceAfter = _Undefined,
  }) {
    return Transaction(
      id: id is int? ? id : this.id,
      userId: userId is int? ? userId : this.userId,
      type: type ?? this.type,
      totalAmount: totalAmount ?? this.totalAmount,
      timestamp: timestamp ?? this.timestamp,
      notes: notes is String? ? notes : this.notes,
      refundedTransactionId: refundedTransactionId is int?
          ? refundedTransactionId
          : this.refundedTransactionId,
      sellerId: sellerId is int? ? sellerId : this.sellerId,
      paymentMethod: paymentMethod is _i4oqxmai.PaymentMethod?
          ? paymentMethod
          : this.paymentMethod,
      balanceAfter: balanceAfter is double? ? balanceAfter : this.balanceAfter,
    );
  }
}

class TransactionUpdateTable extends _is.UpdateTable<TransactionTable> {
  TransactionUpdateTable(super.table);

  _is.ColumnValue<int, int> userId(int? value) => _is.ColumnValue(
    table.userId,
    value,
  );

  _is.ColumnValue<_igem0ql0.TransactionType, _igem0ql0.TransactionType> type(
    _igem0ql0.TransactionType value,
  ) => _is.ColumnValue(
    table.type,
    value,
  );

  _is.ColumnValue<double, double> totalAmount(double value) => _is.ColumnValue(
    table.totalAmount,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> timestamp(DateTime value) =>
      _is.ColumnValue(
        table.timestamp,
        value,
      );

  _is.ColumnValue<String, String> notes(String? value) => _is.ColumnValue(
    table.notes,
    value,
  );

  _is.ColumnValue<int, int> refundedTransactionId(int? value) =>
      _is.ColumnValue(
        table.refundedTransactionId,
        value,
      );

  _is.ColumnValue<int, int> sellerId(int? value) => _is.ColumnValue(
    table.sellerId,
    value,
  );

  _is.ColumnValue<_i4oqxmai.PaymentMethod, _i4oqxmai.PaymentMethod>
  paymentMethod(_i4oqxmai.PaymentMethod? value) => _is.ColumnValue(
    table.paymentMethod,
    value,
  );

  _is.ColumnValue<double, double> balanceAfter(double? value) =>
      _is.ColumnValue(
        table.balanceAfter,
        value,
      );
}

class TransactionTable extends _is.Table<int?> {
  TransactionTable({super.tableRelation}) : super(tableName: 'transactions') {
    updateTable = TransactionUpdateTable(this);
    userId = _is.ColumnInt(
      'userId',
      this,
    );
    type = _is.ColumnEnum(
      'type',
      this,
      _is.EnumSerialization.byName,
    );
    totalAmount = _is.ColumnDouble(
      'totalAmount',
      this,
    );
    timestamp = _is.ColumnDateTime(
      'timestamp',
      this,
    );
    notes = _is.ColumnString(
      'notes',
      this,
    );
    refundedTransactionId = _is.ColumnInt(
      'refundedTransactionId',
      this,
    );
    sellerId = _is.ColumnInt(
      'sellerId',
      this,
    );
    paymentMethod = _is.ColumnEnum(
      'paymentMethod',
      this,
      _is.EnumSerialization.byName,
    );
    balanceAfter = _is.ColumnDouble(
      'balanceAfter',
      this,
    );
  }

  late final TransactionUpdateTable updateTable;

  late final _is.ColumnInt userId;

  late final _is.ColumnEnum<_igem0ql0.TransactionType> type;

  late final _is.ColumnDouble totalAmount;

  late final _is.ColumnDateTime timestamp;

  late final _is.ColumnString notes;

  late final _is.ColumnInt refundedTransactionId;

  late final _is.ColumnInt sellerId;

  late final _is.ColumnEnum<_i4oqxmai.PaymentMethod> paymentMethod;

  late final _is.ColumnDouble balanceAfter;

  @override
  List<_is.Column> get columns => [
    id,
    userId,
    type,
    totalAmount,
    timestamp,
    notes,
    refundedTransactionId,
    sellerId,
    paymentMethod,
    balanceAfter,
  ];
}

class TransactionInclude extends _is.IncludeObject {
  TransactionInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Transaction.t;
}

class TransactionIncludeList extends _is.IncludeList {
  TransactionIncludeList._({
    _is.WhereExpressionBuilder<TransactionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Transaction.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Transaction.t;
}

class TransactionRepository {
  const TransactionRepository._();

  /// Returns a list of [Transaction]s matching the given query parameters.
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
  Future<List<Transaction>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TransactionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TransactionTable>? orderBy,
    _is.OrderByListBuilder<TransactionTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Transaction>(
      where: where?.call(Transaction.t),
      orderBy: orderBy?.call(Transaction.t),
      orderByList: orderByList?.call(Transaction.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Transaction] matching the given query parameters.
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
  Future<Transaction?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TransactionTable>? where,
    int? offset,
    _is.OrderByBuilder<TransactionTable>? orderBy,
    _is.OrderByListBuilder<TransactionTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Transaction>(
      where: where?.call(Transaction.t),
      orderBy: orderBy?.call(Transaction.t),
      orderByList: orderByList?.call(Transaction.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Transaction] by its [id] or null if no such row exists.
  Future<Transaction?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Transaction>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Transaction]s in the list and returns the inserted rows.
  ///
  /// The returned [Transaction]s will have their `id` fields set.
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
  Future<List<Transaction>> insert(
    _is.DatabaseSession session,
    List<Transaction> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Transaction>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Transaction] and returns the inserted row.
  ///
  /// The returned [Transaction] will have its `id` field set.
  Future<Transaction> insertRow(
    _is.DatabaseSession session,
    Transaction row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Transaction>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Transaction]s in the list and returns the resulting rows.
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
  /// The returned [Transaction]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Transaction>> upsert(
    _is.DatabaseSession session,
    List<Transaction> rows, {
    required _is.ColumnSelections<TransactionTable> conflictColumns,
    _is.ColumnSelections<TransactionTable>? updateColumns,
    _is.WhereExpressionBuilder<TransactionTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Transaction>(
      rows,
      conflictColumns: conflictColumns(Transaction.t),
      updateColumns: updateColumns?.call(Transaction.t),
      updateWhere: updateWhere?.call(Transaction.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Transaction] and returns the resulting row.
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
  /// The returned [Transaction] will have its `id` field set.
  Future<Transaction?> upsertRow(
    _is.DatabaseSession session,
    Transaction row, {
    required _is.ColumnSelections<TransactionTable> conflictColumns,
    _is.ColumnSelections<TransactionTable>? updateColumns,
    _is.WhereExpressionBuilder<TransactionTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Transaction>(
      row,
      conflictColumns: conflictColumns(Transaction.t),
      updateColumns: updateColumns?.call(Transaction.t),
      updateWhere: updateWhere?.call(Transaction.t),
      transaction: transaction,
    );
  }

  /// Updates all [Transaction]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Transaction>> update(
    _is.DatabaseSession session,
    List<Transaction> rows, {
    _is.ColumnSelections<TransactionTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Transaction>(
      rows,
      columns: columns?.call(Transaction.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Transaction]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Transaction> updateRow(
    _is.DatabaseSession session,
    Transaction row, {
    _is.ColumnSelections<TransactionTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Transaction>(
      row,
      columns: columns?.call(Transaction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Transaction] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Transaction?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<TransactionUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Transaction>(
      id,
      columnValues: columnValues(Transaction.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Transaction]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Transaction>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<TransactionUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<TransactionTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TransactionTable>? orderBy,
    _is.OrderByListBuilder<TransactionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Transaction>(
      columnValues: columnValues(Transaction.t.updateTable),
      where: where(Transaction.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Transaction.t),
      orderByList: orderByList?.call(Transaction.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Transaction]s in the list and returns the deleted rows.
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
  Future<List<Transaction>> delete(
    _is.DatabaseSession session,
    List<Transaction> rows, {
    _is.OrderByBuilder<TransactionTable>? orderBy,
    _is.OrderByListBuilder<TransactionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Transaction>(
      rows,
      orderBy: orderBy?.call(Transaction.t),
      orderByList: orderByList?.call(Transaction.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Transaction].
  Future<Transaction> deleteRow(
    _is.DatabaseSession session,
    Transaction row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Transaction>(
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
  Future<List<Transaction>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<TransactionTable> where,
    _is.OrderByBuilder<TransactionTable>? orderBy,
    _is.OrderByListBuilder<TransactionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Transaction>(
      where: where(Transaction.t),
      orderBy: orderBy?.call(Transaction.t),
      orderByList: orderByList?.call(Transaction.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TransactionTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Transaction>(
      where: where?.call(Transaction.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Transaction] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<TransactionTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Transaction>(
      where: where(Transaction.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
