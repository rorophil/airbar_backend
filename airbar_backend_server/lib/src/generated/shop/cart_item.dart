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

abstract class CartItem
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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
      addedAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['addedAt']),
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
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CartItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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
    _i1.WhereExpressionBuilder<CartItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CartItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CartItemTable>? orderByList,
    CartItemInclude? include,
  }) {
    return CartItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CartItem.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CartItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
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
  @_i1.useResult
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

class CartItemUpdateTable extends _i1.UpdateTable<CartItemTable> {
  CartItemUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<int, int> productId(int value) => _i1.ColumnValue(
    table.productId,
    value,
  );

  _i1.ColumnValue<int, int> productPortionId(int? value) => _i1.ColumnValue(
    table.productPortionId,
    value,
  );

  _i1.ColumnValue<int, int> quantity(int value) => _i1.ColumnValue(
    table.quantity,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> addedAt(DateTime value) =>
      _i1.ColumnValue(
        table.addedAt,
        value,
      );
}

class CartItemTable extends _i1.Table<int?> {
  CartItemTable({super.tableRelation}) : super(tableName: 'cart_items') {
    updateTable = CartItemUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    productId = _i1.ColumnInt(
      'productId',
      this,
    );
    productPortionId = _i1.ColumnInt(
      'productPortionId',
      this,
    );
    quantity = _i1.ColumnInt(
      'quantity',
      this,
      hasDefault: true,
    );
    addedAt = _i1.ColumnDateTime(
      'addedAt',
      this,
    );
  }

  late final CartItemUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnInt productId;

  late final _i1.ColumnInt productPortionId;

  late final _i1.ColumnInt quantity;

  late final _i1.ColumnDateTime addedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    productId,
    productPortionId,
    quantity,
    addedAt,
  ];
}

class CartItemInclude extends _i1.IncludeObject {
  CartItemInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => CartItem.t;
}

class CartItemIncludeList extends _i1.IncludeList {
  CartItemIncludeList._({
    _i1.WhereExpressionBuilder<CartItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CartItem.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CartItem.t;
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
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CartItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CartItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CartItemTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CartItem>(
      where: where?.call(CartItem.t),
      orderBy: orderBy?.call(CartItem.t),
      orderByList: orderByList?.call(CartItem.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
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
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CartItemTable>? where,
    int? offset,
    _i1.OrderByBuilder<CartItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CartItemTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<CartItem>(
      where: where?.call(CartItem.t),
      orderBy: orderBy?.call(CartItem.t),
      orderByList: orderByList?.call(CartItem.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [CartItem] by its [id] or null if no such row exists.
  Future<CartItem?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<CartItem>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [CartItem]s in the list and returns the inserted rows.
  ///
  /// The returned [CartItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CartItem>> insert(
    _i1.Session session,
    List<CartItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CartItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CartItem] and returns the inserted row.
  ///
  /// The returned [CartItem] will have its `id` field set.
  Future<CartItem> insertRow(
    _i1.Session session,
    CartItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CartItem>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CartItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CartItem>> update(
    _i1.Session session,
    List<CartItem> rows, {
    _i1.ColumnSelections<CartItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CartItem>(
      rows,
      columns: columns?.call(CartItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CartItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CartItem> updateRow(
    _i1.Session session,
    CartItem row, {
    _i1.ColumnSelections<CartItemTable>? columns,
    _i1.Transaction? transaction,
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
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<CartItemUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CartItem>(
      id,
      columnValues: columnValues(CartItem.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CartItem]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CartItem>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CartItemUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CartItemTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CartItemTable>? orderBy,
    _i1.OrderByListBuilder<CartItemTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CartItem>(
      columnValues: columnValues(CartItem.t.updateTable),
      where: where(CartItem.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CartItem.t),
      orderByList: orderByList?.call(CartItem.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CartItem]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CartItem>> delete(
    _i1.Session session,
    List<CartItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CartItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CartItem].
  Future<CartItem> deleteRow(
    _i1.Session session,
    CartItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CartItem>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CartItem>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CartItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CartItem>(
      where: where(CartItem.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CartItemTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CartItem>(
      where: where?.call(CartItem.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
