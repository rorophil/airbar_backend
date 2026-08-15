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

abstract class TransactionItem
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [TransactionItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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
    _i1.WhereExpressionBuilder<TransactionItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TransactionItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TransactionItemTable>? orderByList,
    TransactionItemInclude? include,
  }) {
    return TransactionItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TransactionItem.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TransactionItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
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
  @_i1.useResult
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

class TransactionItemUpdateTable extends _i1.UpdateTable<TransactionItemTable> {
  TransactionItemUpdateTable(super.table);

  _i1.ColumnValue<int, int> transactionId(int value) => _i1.ColumnValue(
    table.transactionId,
    value,
  );

  _i1.ColumnValue<int, int> productId(int value) => _i1.ColumnValue(
    table.productId,
    value,
  );

  _i1.ColumnValue<String, String> productName(String value) => _i1.ColumnValue(
    table.productName,
    value,
  );

  _i1.ColumnValue<int, int> quantity(int value) => _i1.ColumnValue(
    table.quantity,
    value,
  );

  _i1.ColumnValue<double, double> unitPrice(double value) => _i1.ColumnValue(
    table.unitPrice,
    value,
  );

  _i1.ColumnValue<double, double> subtotal(double value) => _i1.ColumnValue(
    table.subtotal,
    value,
  );

  _i1.ColumnValue<double, double> stockDeduction(double? value) =>
      _i1.ColumnValue(
        table.stockDeduction,
        value,
      );
}

class TransactionItemTable extends _i1.Table<int?> {
  TransactionItemTable({super.tableRelation})
    : super(tableName: 'transaction_items') {
    updateTable = TransactionItemUpdateTable(this);
    transactionId = _i1.ColumnInt(
      'transactionId',
      this,
    );
    productId = _i1.ColumnInt(
      'productId',
      this,
    );
    productName = _i1.ColumnString(
      'productName',
      this,
    );
    quantity = _i1.ColumnInt(
      'quantity',
      this,
    );
    unitPrice = _i1.ColumnDouble(
      'unitPrice',
      this,
    );
    subtotal = _i1.ColumnDouble(
      'subtotal',
      this,
    );
    stockDeduction = _i1.ColumnDouble(
      'stockDeduction',
      this,
      hasDefault: true,
    );
  }

  late final TransactionItemUpdateTable updateTable;

  late final _i1.ColumnInt transactionId;

  late final _i1.ColumnInt productId;

  late final _i1.ColumnString productName;

  late final _i1.ColumnInt quantity;

  late final _i1.ColumnDouble unitPrice;

  late final _i1.ColumnDouble subtotal;

  late final _i1.ColumnDouble stockDeduction;

  @override
  List<_i1.Column> get columns => [
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

class TransactionItemInclude extends _i1.IncludeObject {
  TransactionItemInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => TransactionItem.t;
}

class TransactionItemIncludeList extends _i1.IncludeList {
  TransactionItemIncludeList._({
    _i1.WhereExpressionBuilder<TransactionItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TransactionItem.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => TransactionItem.t;
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
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TransactionItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TransactionItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TransactionItemTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TransactionItem>(
      where: where?.call(TransactionItem.t),
      orderBy: orderBy?.call(TransactionItem.t),
      orderByList: orderByList?.call(TransactionItem.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
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
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TransactionItemTable>? where,
    int? offset,
    _i1.OrderByBuilder<TransactionItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TransactionItemTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<TransactionItem>(
      where: where?.call(TransactionItem.t),
      orderBy: orderBy?.call(TransactionItem.t),
      orderByList: orderByList?.call(TransactionItem.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [TransactionItem] by its [id] or null if no such row exists.
  Future<TransactionItem?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<TransactionItem>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [TransactionItem]s in the list and returns the inserted rows.
  ///
  /// The returned [TransactionItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<TransactionItem>> insert(
    _i1.Session session,
    List<TransactionItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TransactionItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [TransactionItem] and returns the inserted row.
  ///
  /// The returned [TransactionItem] will have its `id` field set.
  Future<TransactionItem> insertRow(
    _i1.Session session,
    TransactionItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TransactionItem>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TransactionItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TransactionItem>> update(
    _i1.Session session,
    List<TransactionItem> rows, {
    _i1.ColumnSelections<TransactionItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TransactionItem>(
      rows,
      columns: columns?.call(TransactionItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TransactionItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TransactionItem> updateRow(
    _i1.Session session,
    TransactionItem row, {
    _i1.ColumnSelections<TransactionItemTable>? columns,
    _i1.Transaction? transaction,
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
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<TransactionItemUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<TransactionItem>(
      id,
      columnValues: columnValues(TransactionItem.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TransactionItem]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<TransactionItem>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TransactionItemUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<TransactionItemTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TransactionItemTable>? orderBy,
    _i1.OrderByListBuilder<TransactionItemTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<TransactionItem>(
      columnValues: columnValues(TransactionItem.t.updateTable),
      where: where(TransactionItem.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TransactionItem.t),
      orderByList: orderByList?.call(TransactionItem.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [TransactionItem]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TransactionItem>> delete(
    _i1.Session session,
    List<TransactionItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TransactionItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TransactionItem].
  Future<TransactionItem> deleteRow(
    _i1.Session session,
    TransactionItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TransactionItem>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TransactionItem>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TransactionItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TransactionItem>(
      where: where(TransactionItem.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TransactionItemTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TransactionItem>(
      where: where?.call(TransactionItem.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
