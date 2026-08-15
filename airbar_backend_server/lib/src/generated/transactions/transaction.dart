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
import '../transactions/transaction_type.dart' as _i2;
import '../transactions/payment_method.dart' as _i3;

abstract class Transaction
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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
    required _i2.TransactionType type,
    required double totalAmount,
    required DateTime timestamp,
    String? notes,
    int? refundedTransactionId,
    int? sellerId,
    _i3.PaymentMethod? paymentMethod,
    double? balanceAfter,
  }) = _TransactionImpl;

  factory Transaction.fromJson(Map<String, dynamic> jsonSerialization) {
    return Transaction(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int?,
      type: _i2.TransactionType.fromJson((jsonSerialization['type'] as String)),
      totalAmount: (jsonSerialization['totalAmount'] as num).toDouble(),
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      notes: jsonSerialization['notes'] as String?,
      refundedTransactionId: jsonSerialization['refundedTransactionId'] as int?,
      sellerId: jsonSerialization['sellerId'] as int?,
      paymentMethod: jsonSerialization['paymentMethod'] == null
          ? null
          : _i3.PaymentMethod.fromJson(
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

  _i2.TransactionType type;

  double totalAmount;

  DateTime timestamp;

  String? notes;

  int? refundedTransactionId;

  int? sellerId;

  _i3.PaymentMethod? paymentMethod;

  double? balanceAfter;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Transaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Transaction copyWith({
    int? id,
    int? userId,
    _i2.TransactionType? type,
    double? totalAmount,
    DateTime? timestamp,
    String? notes,
    int? refundedTransactionId,
    int? sellerId,
    _i3.PaymentMethod? paymentMethod,
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
    _i1.WhereExpressionBuilder<TransactionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TransactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TransactionTable>? orderByList,
    TransactionInclude? include,
  }) {
    return TransactionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Transaction.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Transaction.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TransactionImpl extends Transaction {
  _TransactionImpl({
    int? id,
    int? userId,
    required _i2.TransactionType type,
    required double totalAmount,
    required DateTime timestamp,
    String? notes,
    int? refundedTransactionId,
    int? sellerId,
    _i3.PaymentMethod? paymentMethod,
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
  @_i1.useResult
  @override
  Transaction copyWith({
    Object? id = _Undefined,
    Object? userId = _Undefined,
    _i2.TransactionType? type,
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
      paymentMethod: paymentMethod is _i3.PaymentMethod?
          ? paymentMethod
          : this.paymentMethod,
      balanceAfter: balanceAfter is double? ? balanceAfter : this.balanceAfter,
    );
  }
}

class TransactionUpdateTable extends _i1.UpdateTable<TransactionTable> {
  TransactionUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int? value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<_i2.TransactionType, _i2.TransactionType> type(
    _i2.TransactionType value,
  ) => _i1.ColumnValue(
    table.type,
    value,
  );

  _i1.ColumnValue<double, double> totalAmount(double value) => _i1.ColumnValue(
    table.totalAmount,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> timestamp(DateTime value) =>
      _i1.ColumnValue(
        table.timestamp,
        value,
      );

  _i1.ColumnValue<String, String> notes(String? value) => _i1.ColumnValue(
    table.notes,
    value,
  );

  _i1.ColumnValue<int, int> refundedTransactionId(int? value) =>
      _i1.ColumnValue(
        table.refundedTransactionId,
        value,
      );

  _i1.ColumnValue<int, int> sellerId(int? value) => _i1.ColumnValue(
    table.sellerId,
    value,
  );

  _i1.ColumnValue<_i3.PaymentMethod, _i3.PaymentMethod> paymentMethod(
    _i3.PaymentMethod? value,
  ) => _i1.ColumnValue(
    table.paymentMethod,
    value,
  );

  _i1.ColumnValue<double, double> balanceAfter(double? value) =>
      _i1.ColumnValue(
        table.balanceAfter,
        value,
      );
}

class TransactionTable extends _i1.Table<int?> {
  TransactionTable({super.tableRelation}) : super(tableName: 'transactions') {
    updateTable = TransactionUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    totalAmount = _i1.ColumnDouble(
      'totalAmount',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
      this,
    );
    notes = _i1.ColumnString(
      'notes',
      this,
    );
    refundedTransactionId = _i1.ColumnInt(
      'refundedTransactionId',
      this,
    );
    sellerId = _i1.ColumnInt(
      'sellerId',
      this,
    );
    paymentMethod = _i1.ColumnEnum(
      'paymentMethod',
      this,
      _i1.EnumSerialization.byName,
    );
    balanceAfter = _i1.ColumnDouble(
      'balanceAfter',
      this,
    );
  }

  late final TransactionUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnEnum<_i2.TransactionType> type;

  late final _i1.ColumnDouble totalAmount;

  late final _i1.ColumnDateTime timestamp;

  late final _i1.ColumnString notes;

  late final _i1.ColumnInt refundedTransactionId;

  late final _i1.ColumnInt sellerId;

  late final _i1.ColumnEnum<_i3.PaymentMethod> paymentMethod;

  late final _i1.ColumnDouble balanceAfter;

  @override
  List<_i1.Column> get columns => [
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

class TransactionInclude extends _i1.IncludeObject {
  TransactionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Transaction.t;
}

class TransactionIncludeList extends _i1.IncludeList {
  TransactionIncludeList._({
    _i1.WhereExpressionBuilder<TransactionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Transaction.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Transaction.t;
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
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TransactionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TransactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TransactionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Transaction>(
      where: where?.call(Transaction.t),
      orderBy: orderBy?.call(Transaction.t),
      orderByList: orderByList?.call(Transaction.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
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
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TransactionTable>? where,
    int? offset,
    _i1.OrderByBuilder<TransactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TransactionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Transaction>(
      where: where?.call(Transaction.t),
      orderBy: orderBy?.call(Transaction.t),
      orderByList: orderByList?.call(Transaction.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Transaction] by its [id] or null if no such row exists.
  Future<Transaction?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Transaction>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Transaction]s in the list and returns the inserted rows.
  ///
  /// The returned [Transaction]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Transaction>> insert(
    _i1.Session session,
    List<Transaction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Transaction>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Transaction] and returns the inserted row.
  ///
  /// The returned [Transaction] will have its `id` field set.
  Future<Transaction> insertRow(
    _i1.Session session,
    Transaction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Transaction>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Transaction]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Transaction>> update(
    _i1.Session session,
    List<Transaction> rows, {
    _i1.ColumnSelections<TransactionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Transaction>(
      rows,
      columns: columns?.call(Transaction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Transaction]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Transaction> updateRow(
    _i1.Session session,
    Transaction row, {
    _i1.ColumnSelections<TransactionTable>? columns,
    _i1.Transaction? transaction,
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
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<TransactionUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Transaction>(
      id,
      columnValues: columnValues(Transaction.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Transaction]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Transaction>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TransactionUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TransactionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TransactionTable>? orderBy,
    _i1.OrderByListBuilder<TransactionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Transaction>(
      columnValues: columnValues(Transaction.t.updateTable),
      where: where(Transaction.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Transaction.t),
      orderByList: orderByList?.call(Transaction.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Transaction]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Transaction>> delete(
    _i1.Session session,
    List<Transaction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Transaction>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Transaction].
  Future<Transaction> deleteRow(
    _i1.Session session,
    Transaction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Transaction>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Transaction>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TransactionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Transaction>(
      where: where(Transaction.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TransactionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Transaction>(
      where: where?.call(Transaction.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
