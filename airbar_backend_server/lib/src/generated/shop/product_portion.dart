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

abstract class ProductPortion
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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
      isActive: jsonSerialization['isActive'] as bool?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
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
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ProductPortion]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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
    _i1.WhereExpressionBuilder<ProductPortionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductPortionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductPortionTable>? orderByList,
    ProductPortionInclude? include,
  }) {
    return ProductPortionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductPortion.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProductPortion.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
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
  @_i1.useResult
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

class ProductPortionUpdateTable extends _i1.UpdateTable<ProductPortionTable> {
  ProductPortionUpdateTable(super.table);

  _i1.ColumnValue<int, int> productId(int value) => _i1.ColumnValue(
    table.productId,
    value,
  );

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<double, double> quantity(double value) => _i1.ColumnValue(
    table.quantity,
    value,
  );

  _i1.ColumnValue<double, double> price(double value) => _i1.ColumnValue(
    table.price,
    value,
  );

  _i1.ColumnValue<int, int> displayOrder(int value) => _i1.ColumnValue(
    table.displayOrder,
    value,
  );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class ProductPortionTable extends _i1.Table<int?> {
  ProductPortionTable({super.tableRelation})
    : super(tableName: 'product_portions') {
    updateTable = ProductPortionUpdateTable(this);
    productId = _i1.ColumnInt(
      'productId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    quantity = _i1.ColumnDouble(
      'quantity',
      this,
    );
    price = _i1.ColumnDouble(
      'price',
      this,
    );
    displayOrder = _i1.ColumnInt(
      'displayOrder',
      this,
      hasDefault: true,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
      hasDefault: true,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final ProductPortionUpdateTable updateTable;

  late final _i1.ColumnInt productId;

  late final _i1.ColumnString name;

  late final _i1.ColumnDouble quantity;

  late final _i1.ColumnDouble price;

  late final _i1.ColumnInt displayOrder;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
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

class ProductPortionInclude extends _i1.IncludeObject {
  ProductPortionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ProductPortion.t;
}

class ProductPortionIncludeList extends _i1.IncludeList {
  ProductPortionIncludeList._({
    _i1.WhereExpressionBuilder<ProductPortionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProductPortion.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ProductPortion.t;
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
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductPortionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductPortionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductPortionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ProductPortion>(
      where: where?.call(ProductPortion.t),
      orderBy: orderBy?.call(ProductPortion.t),
      orderByList: orderByList?.call(ProductPortion.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
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
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductPortionTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProductPortionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductPortionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ProductPortion>(
      where: where?.call(ProductPortion.t),
      orderBy: orderBy?.call(ProductPortion.t),
      orderByList: orderByList?.call(ProductPortion.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [ProductPortion] by its [id] or null if no such row exists.
  Future<ProductPortion?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ProductPortion>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [ProductPortion]s in the list and returns the inserted rows.
  ///
  /// The returned [ProductPortion]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProductPortion>> insert(
    _i1.Session session,
    List<ProductPortion> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProductPortion>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProductPortion] and returns the inserted row.
  ///
  /// The returned [ProductPortion] will have its `id` field set.
  Future<ProductPortion> insertRow(
    _i1.Session session,
    ProductPortion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProductPortion>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProductPortion]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProductPortion>> update(
    _i1.Session session,
    List<ProductPortion> rows, {
    _i1.ColumnSelections<ProductPortionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProductPortion>(
      rows,
      columns: columns?.call(ProductPortion.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProductPortion]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProductPortion> updateRow(
    _i1.Session session,
    ProductPortion row, {
    _i1.ColumnSelections<ProductPortionTable>? columns,
    _i1.Transaction? transaction,
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
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ProductPortionUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ProductPortion>(
      id,
      columnValues: columnValues(ProductPortion.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ProductPortion]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ProductPortion>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ProductPortionUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ProductPortionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductPortionTable>? orderBy,
    _i1.OrderByListBuilder<ProductPortionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ProductPortion>(
      columnValues: columnValues(ProductPortion.t.updateTable),
      where: where(ProductPortion.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductPortion.t),
      orderByList: orderByList?.call(ProductPortion.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ProductPortion]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProductPortion>> delete(
    _i1.Session session,
    List<ProductPortion> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProductPortion>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProductPortion].
  Future<ProductPortion> deleteRow(
    _i1.Session session,
    ProductPortion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProductPortion>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProductPortion>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProductPortionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProductPortion>(
      where: where(ProductPortion.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductPortionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProductPortion>(
      where: where?.call(ProductPortion.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
