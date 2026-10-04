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
import '../stock/movement_type.dart' as _i2;

abstract class StockMovement
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  StockMovement._({
    this.id,
    required this.productId,
    required this.quantity,
    required this.movementType,
    required this.userId,
    required this.timestamp,
    this.notes,
  });

  factory StockMovement({
    int? id,
    required int productId,
    required double quantity,
    required _i2.MovementType movementType,
    required int userId,
    required DateTime timestamp,
    String? notes,
  }) = _StockMovementImpl;

  factory StockMovement.fromJson(Map<String, dynamic> jsonSerialization) {
    return StockMovement(
      id: jsonSerialization['id'] as int?,
      productId: jsonSerialization['productId'] as int,
      quantity: (jsonSerialization['quantity'] as num).toDouble(),
      movementType: _i2.MovementType.fromJson(
        (jsonSerialization['movementType'] as String),
      ),
      userId: jsonSerialization['userId'] as int,
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      notes: jsonSerialization['notes'] as String?,
    );
  }

  static final t = StockMovementTable();

  static const db = StockMovementRepository._();

  @override
  int? id;

  int productId;

  double quantity;

  _i2.MovementType movementType;

  int userId;

  DateTime timestamp;

  String? notes;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [StockMovement]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StockMovement copyWith({
    int? id,
    int? productId,
    double? quantity,
    _i2.MovementType? movementType,
    int? userId,
    DateTime? timestamp,
    String? notes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StockMovement',
      if (id != null) 'id': id,
      'productId': productId,
      'quantity': quantity,
      'movementType': movementType.toJson(),
      'userId': userId,
      'timestamp': timestamp.toJson(),
      if (notes != null) 'notes': notes,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StockMovement',
      if (id != null) 'id': id,
      'productId': productId,
      'quantity': quantity,
      'movementType': movementType.toJson(),
      'userId': userId,
      'timestamp': timestamp.toJson(),
      if (notes != null) 'notes': notes,
    };
  }

  static StockMovementInclude include() {
    return StockMovementInclude._();
  }

  static StockMovementIncludeList includeList({
    _i1.WhereExpressionBuilder<StockMovementTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StockMovementTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StockMovementTable>? orderByList,
    StockMovementInclude? include,
  }) {
    return StockMovementIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StockMovement.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(StockMovement.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StockMovementImpl extends StockMovement {
  _StockMovementImpl({
    int? id,
    required int productId,
    required double quantity,
    required _i2.MovementType movementType,
    required int userId,
    required DateTime timestamp,
    String? notes,
  }) : super._(
         id: id,
         productId: productId,
         quantity: quantity,
         movementType: movementType,
         userId: userId,
         timestamp: timestamp,
         notes: notes,
       );

  /// Returns a shallow copy of this [StockMovement]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StockMovement copyWith({
    Object? id = _Undefined,
    int? productId,
    double? quantity,
    _i2.MovementType? movementType,
    int? userId,
    DateTime? timestamp,
    Object? notes = _Undefined,
  }) {
    return StockMovement(
      id: id is int? ? id : this.id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      movementType: movementType ?? this.movementType,
      userId: userId ?? this.userId,
      timestamp: timestamp ?? this.timestamp,
      notes: notes is String? ? notes : this.notes,
    );
  }
}

class StockMovementUpdateTable extends _i1.UpdateTable<StockMovementTable> {
  StockMovementUpdateTable(super.table);

  _i1.ColumnValue<int, int> productId(int value) => _i1.ColumnValue(
    table.productId,
    value,
  );

  _i1.ColumnValue<double, double> quantity(double value) => _i1.ColumnValue(
    table.quantity,
    value,
  );

  _i1.ColumnValue<_i2.MovementType, _i2.MovementType> movementType(
    _i2.MovementType value,
  ) => _i1.ColumnValue(
    table.movementType,
    value,
  );

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
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
}

class StockMovementTable extends _i1.Table<int?> {
  StockMovementTable({super.tableRelation})
    : super(tableName: 'stock_movements') {
    updateTable = StockMovementUpdateTable(this);
    productId = _i1.ColumnInt(
      'productId',
      this,
    );
    quantity = _i1.ColumnDouble(
      'quantity',
      this,
    );
    movementType = _i1.ColumnEnum(
      'movementType',
      this,
      _i1.EnumSerialization.byName,
    );
    userId = _i1.ColumnInt(
      'userId',
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
  }

  late final StockMovementUpdateTable updateTable;

  late final _i1.ColumnInt productId;

  late final _i1.ColumnDouble quantity;

  late final _i1.ColumnEnum<_i2.MovementType> movementType;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnDateTime timestamp;

  late final _i1.ColumnString notes;

  @override
  List<_i1.Column> get columns => [
    id,
    productId,
    quantity,
    movementType,
    userId,
    timestamp,
    notes,
  ];
}

class StockMovementInclude extends _i1.IncludeObject {
  StockMovementInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => StockMovement.t;
}

class StockMovementIncludeList extends _i1.IncludeList {
  StockMovementIncludeList._({
    _i1.WhereExpressionBuilder<StockMovementTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(StockMovement.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => StockMovement.t;
}

class StockMovementRepository {
  const StockMovementRepository._();

  /// Returns a list of [StockMovement]s matching the given query parameters.
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
  Future<List<StockMovement>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StockMovementTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StockMovementTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StockMovementTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<StockMovement>(
      where: where?.call(StockMovement.t),
      orderBy: orderBy?.call(StockMovement.t),
      orderByList: orderByList?.call(StockMovement.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [StockMovement] matching the given query parameters.
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
  Future<StockMovement?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StockMovementTable>? where,
    int? offset,
    _i1.OrderByBuilder<StockMovementTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StockMovementTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<StockMovement>(
      where: where?.call(StockMovement.t),
      orderBy: orderBy?.call(StockMovement.t),
      orderByList: orderByList?.call(StockMovement.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [StockMovement] by its [id] or null if no such row exists.
  Future<StockMovement?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<StockMovement>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [StockMovement]s in the list and returns the inserted rows.
  ///
  /// The returned [StockMovement]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<StockMovement>> insert(
    _i1.Session session,
    List<StockMovement> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<StockMovement>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [StockMovement] and returns the inserted row.
  ///
  /// The returned [StockMovement] will have its `id` field set.
  Future<StockMovement> insertRow(
    _i1.Session session,
    StockMovement row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<StockMovement>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [StockMovement]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<StockMovement>> update(
    _i1.Session session,
    List<StockMovement> rows, {
    _i1.ColumnSelections<StockMovementTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<StockMovement>(
      rows,
      columns: columns?.call(StockMovement.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StockMovement]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<StockMovement> updateRow(
    _i1.Session session,
    StockMovement row, {
    _i1.ColumnSelections<StockMovementTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<StockMovement>(
      row,
      columns: columns?.call(StockMovement.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StockMovement] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<StockMovement?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<StockMovementUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<StockMovement>(
      id,
      columnValues: columnValues(StockMovement.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [StockMovement]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<StockMovement>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<StockMovementUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<StockMovementTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StockMovementTable>? orderBy,
    _i1.OrderByListBuilder<StockMovementTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<StockMovement>(
      columnValues: columnValues(StockMovement.t.updateTable),
      where: where(StockMovement.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StockMovement.t),
      orderByList: orderByList?.call(StockMovement.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [StockMovement]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<StockMovement>> delete(
    _i1.Session session,
    List<StockMovement> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<StockMovement>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [StockMovement].
  Future<StockMovement> deleteRow(
    _i1.Session session,
    StockMovement row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<StockMovement>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<StockMovement>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<StockMovementTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<StockMovement>(
      where: where(StockMovement.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StockMovementTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<StockMovement>(
      where: where?.call(StockMovement.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
