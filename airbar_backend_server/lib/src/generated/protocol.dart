/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:airbar_backend_server/src/generated/auth/user.dart'
    as _i1sq8sn0;
import 'package:airbar_backend_server/src/generated/cashier/cash_sale_item_data.dart'
    as _ixitvqwz;
import 'package:airbar_backend_server/src/generated/shop/cart_item.dart'
    as _inzocifv;
import 'package:airbar_backend_server/src/generated/shop/product.dart'
    as _it311bq9;
import 'package:airbar_backend_server/src/generated/shop/product_category.dart'
    as _idye8uc7;
import 'package:airbar_backend_server/src/generated/shop/product_portion.dart'
    as _in4gaz80;
import 'package:airbar_backend_server/src/generated/stock/stock_movement.dart'
    as _ivsz30e3;
import 'package:airbar_backend_server/src/generated/transactions/transaction.dart'
    as _igjc5le3;
import 'package:airbar_backend_server/src/generated/transactions/transaction_item.dart'
    as _iqa92bwu;
import 'package:serverpod/protocol.dart' as _isp;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import 'auth/user.dart' as _ihzw26wp;
import 'auth/user_role.dart' as _imfzqkbp;
import 'cashier/cash_sale_item_data.dart' as _i8q255bz;
import 'exceptions/business_exception.dart' as _inujlvgf;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'shop/cart_item.dart' as _i4ros8ig;
import 'shop/product.dart' as _ictnbmx0;
import 'shop/product_category.dart' as _ioy1aw0v;
import 'shop/product_portion.dart' as _ip205i9w;
import 'stock/movement_type.dart' as _iu46gsdm;
import 'stock/stock_movement.dart' as _iq6rmlux;
import 'transactions/payment_method.dart' as _iaa3e0kl;
import 'transactions/transaction.dart' as _iqhl4hru;
import 'transactions/transaction_item.dart' as _i37amypa;
import 'transactions/transaction_type.dart' as _ijg0uxum;
export 'auth/user.dart';
export 'auth/user_role.dart';
export 'cashier/cash_sale_item_data.dart';
export 'exceptions/business_exception.dart';
export 'greetings/greeting.dart';
export 'shop/cart_item.dart';
export 'shop/product.dart';
export 'shop/product_category.dart';
export 'shop/product_portion.dart';
export 'stock/movement_type.dart';
export 'stock/stock_movement.dart';
export 'transactions/payment_method.dart';
export 'transactions/transaction.dart';
export 'transactions/transaction_item.dart';
export 'transactions/transaction_type.dart';

class Protocol extends _is.DatabaseSerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static List<_isp.TableDefinition> get targetTableDefinitions => [
    _isp.TableDefinition(
      name: 'cart_items',
      dartName: 'CartItem',
      schema: 'public',
      module: 'airbar_backend',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'productId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'productPortionId',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'quantity',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '1',
        ),
        _isp.ColumnDefinition(
          name: 'addedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'cart_user_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'product_categories',
      dartName: 'ProductCategory',
      schema: 'public',
      module: 'airbar_backend',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'iconName',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'displayOrder',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isp.ColumnDefinition(
          name: 'isActive',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'product_portions',
      dartName: 'ProductPortion',
      schema: 'public',
      module: 'airbar_backend',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'productId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'quantity',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'price',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'displayOrder',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isp.ColumnDefinition(
          name: 'isActive',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'product_portions_product_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'productId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'product_portions_active_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'isActive',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'displayOrder',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'products',
      dartName: 'Product',
      schema: 'public',
      module: 'airbar_backend',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'price',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'categoryId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'stockQuantity',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isp.ColumnDefinition(
          name: 'minStockAlert',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '5',
        ),
        _isp.ColumnDefinition(
          name: 'currentUnitRemaining',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _isp.ColumnDefinition(
          name: 'imageUrl',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'isActive',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _isp.ColumnDefinition(
          name: 'isDeleted',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _isp.ColumnDefinition(
          name: 'trackStock',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _isp.ColumnDefinition(
          name: 'isBulkProduct',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _isp.ColumnDefinition(
          name: 'bulkUnit',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'bulkTotalQuantity',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'products_category_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'categoryId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'products_deleted_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'isDeleted',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'isActive',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'stock_movements',
      dartName: 'StockMovement',
      schema: 'public',
      module: 'airbar_backend',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'productId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'quantity',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'movementType',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:MovementType',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'timestamp',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'notes',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'stock_movements_product_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'productId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'stock_movements_timestamp_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'timestamp',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'stock_movements_user_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'transaction_items',
      dartName: 'TransactionItem',
      schema: 'public',
      module: 'airbar_backend',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'transactionId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'productId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'productName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'quantity',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'unitPrice',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'subtotal',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'stockDeduction',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
          columnDefault: '0',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'transaction_items_transaction_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'transactionId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'transaction_items_product_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'productId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'transactions',
      dartName: 'Transaction',
      schema: 'public',
      module: 'airbar_backend',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'type',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:TransactionType',
        ),
        _isp.ColumnDefinition(
          name: 'totalAmount',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'timestamp',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'notes',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'refundedTransactionId',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'sellerId',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'paymentMethod',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'protocol:PaymentMethod?',
        ),
        _isp.ColumnDefinition(
          name: 'balanceAfter',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'transactions_user_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'transactions_timestamp_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'timestamp',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'transactions_type_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'type',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'users',
      dartName: 'User',
      schema: 'public',
      module: 'airbar_backend',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'email',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'passwordHash',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'role',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:UserRole',
        ),
        _isp.ColumnDefinition(
          name: 'balance',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
          columnDefault: '0.0',
        ),
        _isp.ColumnDefinition(
          name: 'pin',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'firstName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'lastName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'isActive',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'users_email_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'email',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._iais.Protocol.targetTableDefinitions,
    ..._iacs.Protocol.targetTableDefinitions,
    ..._isp.Protocol.targetTableDefinitions,
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _is.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _ihzw26wp.User) {
      return _ihzw26wp.User.fromJson(data) as T;
    }
    if (t == _imfzqkbp.UserRole) {
      return _imfzqkbp.UserRole.fromJson(data) as T;
    }
    if (t == _i8q255bz.CashSaleItemData) {
      return _i8q255bz.CashSaleItemData.fromJson(data) as T;
    }
    if (t == _inujlvgf.BusinessException) {
      return _inujlvgf.BusinessException.fromJson(data) as T;
    }
    if (t == _izw8z7ou.Greeting) {
      return _izw8z7ou.Greeting.fromJson(data) as T;
    }
    if (t == _i4ros8ig.CartItem) {
      return _i4ros8ig.CartItem.fromJson(data) as T;
    }
    if (t == _ictnbmx0.Product) {
      return _ictnbmx0.Product.fromJson(data) as T;
    }
    if (t == _ioy1aw0v.ProductCategory) {
      return _ioy1aw0v.ProductCategory.fromJson(data) as T;
    }
    if (t == _ip205i9w.ProductPortion) {
      return _ip205i9w.ProductPortion.fromJson(data) as T;
    }
    if (t == _iu46gsdm.MovementType) {
      return _iu46gsdm.MovementType.fromJson(data) as T;
    }
    if (t == _iq6rmlux.StockMovement) {
      return _iq6rmlux.StockMovement.fromJson(data) as T;
    }
    if (t == _iaa3e0kl.PaymentMethod) {
      return _iaa3e0kl.PaymentMethod.fromJson(data) as T;
    }
    if (t == _iqhl4hru.Transaction) {
      return _iqhl4hru.Transaction.fromJson(data) as T;
    }
    if (t == _i37amypa.TransactionItem) {
      return _i37amypa.TransactionItem.fromJson(data) as T;
    }
    if (t == _ijg0uxum.TransactionType) {
      return _ijg0uxum.TransactionType.fromJson(data) as T;
    }
    if (t == _is.getType<_ihzw26wp.User?>()) {
      return (data != null ? _ihzw26wp.User.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_imfzqkbp.UserRole?>()) {
      return (data != null ? _imfzqkbp.UserRole.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i8q255bz.CashSaleItemData?>()) {
      return (data != null ? _i8q255bz.CashSaleItemData.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_inujlvgf.BusinessException?>()) {
      return (data != null ? _inujlvgf.BusinessException.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i4ros8ig.CartItem?>()) {
      return (data != null ? _i4ros8ig.CartItem.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ictnbmx0.Product?>()) {
      return (data != null ? _ictnbmx0.Product.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ioy1aw0v.ProductCategory?>()) {
      return (data != null ? _ioy1aw0v.ProductCategory.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ip205i9w.ProductPortion?>()) {
      return (data != null ? _ip205i9w.ProductPortion.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iu46gsdm.MovementType?>()) {
      return (data != null ? _iu46gsdm.MovementType.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iq6rmlux.StockMovement?>()) {
      return (data != null ? _iq6rmlux.StockMovement.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iaa3e0kl.PaymentMethod?>()) {
      return (data != null ? _iaa3e0kl.PaymentMethod.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iqhl4hru.Transaction?>()) {
      return (data != null ? _iqhl4hru.Transaction.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i37amypa.TransactionItem?>()) {
      return (data != null ? _i37amypa.TransactionItem.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ijg0uxum.TransactionType?>()) {
      return (data != null ? _ijg0uxum.TransactionType.fromJson(data) : null)
          as T;
    }
    if (t == List<_i1sq8sn0.User>) {
      return (data as List).map((e) => deserialize<_i1sq8sn0.User>(e)).toList()
          as T;
    }
    if (t == List<_ixitvqwz.CashSaleItemData>) {
      return (data as List)
              .map((e) => deserialize<_ixitvqwz.CashSaleItemData>(e))
              .toList()
          as T;
    }
    if (t == List<_igjc5le3.Transaction>) {
      return (data as List)
              .map((e) => deserialize<_igjc5le3.Transaction>(e))
              .toList()
          as T;
    }
    if (t == List<_inzocifv.CartItem>) {
      return (data as List)
              .map((e) => deserialize<_inzocifv.CartItem>(e))
              .toList()
          as T;
    }
    if (t == List<_idye8uc7.ProductCategory>) {
      return (data as List)
              .map((e) => deserialize<_idye8uc7.ProductCategory>(e))
              .toList()
          as T;
    }
    if (t == List<_it311bq9.Product>) {
      return (data as List)
              .map((e) => deserialize<_it311bq9.Product>(e))
              .toList()
          as T;
    }
    if (t == List<_in4gaz80.ProductPortion>) {
      return (data as List)
              .map((e) => deserialize<_in4gaz80.ProductPortion>(e))
              .toList()
          as T;
    }
    if (t == List<_ivsz30e3.StockMovement>) {
      return (data as List)
              .map((e) => deserialize<_ivsz30e3.StockMovement>(e))
              .toList()
          as T;
    }
    if (t == List<_iqa92bwu.TransactionItem>) {
      return (data as List)
              .map((e) => deserialize<_iqa92bwu.TransactionItem>(e))
              .toList()
          as T;
    }
    try {
      return _iais.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacs.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _isp.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _ihzw26wp.User => 'User',
      _imfzqkbp.UserRole => 'UserRole',
      _i8q255bz.CashSaleItemData => 'CashSaleItemData',
      _inujlvgf.BusinessException => 'BusinessException',
      _izw8z7ou.Greeting => 'Greeting',
      _i4ros8ig.CartItem => 'CartItem',
      _ictnbmx0.Product => 'Product',
      _ioy1aw0v.ProductCategory => 'ProductCategory',
      _ip205i9w.ProductPortion => 'ProductPortion',
      _iu46gsdm.MovementType => 'MovementType',
      _iq6rmlux.StockMovement => 'StockMovement',
      _iaa3e0kl.PaymentMethod => 'PaymentMethod',
      _iqhl4hru.Transaction => 'Transaction',
      _i37amypa.TransactionItem => 'TransactionItem',
      _ijg0uxum.TransactionType => 'TransactionType',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'airbar_backend.',
        '',
      );
    }

    switch (data) {
      case _ihzw26wp.User():
        return 'User';
      case _imfzqkbp.UserRole():
        return 'UserRole';
      case _i8q255bz.CashSaleItemData():
        return 'CashSaleItemData';
      case _inujlvgf.BusinessException():
        return 'BusinessException';
      case _izw8z7ou.Greeting():
        return 'Greeting';
      case _i4ros8ig.CartItem():
        return 'CartItem';
      case _ictnbmx0.Product():
        return 'Product';
      case _ioy1aw0v.ProductCategory():
        return 'ProductCategory';
      case _ip205i9w.ProductPortion():
        return 'ProductPortion';
      case _iu46gsdm.MovementType():
        return 'MovementType';
      case _iq6rmlux.StockMovement():
        return 'StockMovement';
      case _iaa3e0kl.PaymentMethod():
        return 'PaymentMethod';
      case _iqhl4hru.Transaction():
        return 'Transaction';
      case _i37amypa.TransactionItem():
        return 'TransactionItem';
      case _ijg0uxum.TransactionType():
        return 'TransactionType';
    }
    className = _iais.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacs.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    className = _isp.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'User') {
      return deserialize<_ihzw26wp.User>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_imfzqkbp.UserRole>(data['data']);
    }
    if (dataClassName == 'CashSaleItemData') {
      return deserialize<_i8q255bz.CashSaleItemData>(data['data']);
    }
    if (dataClassName == 'BusinessException') {
      return deserialize<_inujlvgf.BusinessException>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_izw8z7ou.Greeting>(data['data']);
    }
    if (dataClassName == 'CartItem') {
      return deserialize<_i4ros8ig.CartItem>(data['data']);
    }
    if (dataClassName == 'Product') {
      return deserialize<_ictnbmx0.Product>(data['data']);
    }
    if (dataClassName == 'ProductCategory') {
      return deserialize<_ioy1aw0v.ProductCategory>(data['data']);
    }
    if (dataClassName == 'ProductPortion') {
      return deserialize<_ip205i9w.ProductPortion>(data['data']);
    }
    if (dataClassName == 'MovementType') {
      return deserialize<_iu46gsdm.MovementType>(data['data']);
    }
    if (dataClassName == 'StockMovement') {
      return deserialize<_iq6rmlux.StockMovement>(data['data']);
    }
    if (dataClassName == 'PaymentMethod') {
      return deserialize<_iaa3e0kl.PaymentMethod>(data['data']);
    }
    if (dataClassName == 'Transaction') {
      return deserialize<_iqhl4hru.Transaction>(data['data']);
    }
    if (dataClassName == 'TransactionItem') {
      return deserialize<_i37amypa.TransactionItem>(data['data']);
    }
    if (dataClassName == 'TransactionType') {
      return deserialize<_ijg0uxum.TransactionType>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _iais.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacs.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _isp.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iais.Protocol().registerHostProtocol('airbar_backend', this);
    _iacs.Protocol().registerHostProtocol('airbar_backend', this);
  }

  @override
  _is.Table? getTableForType(Type t) {
    {
      var table = _iais.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _iacs.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _isp.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _ihzw26wp.User:
        return _ihzw26wp.User.t;
      case _i4ros8ig.CartItem:
        return _i4ros8ig.CartItem.t;
      case _ictnbmx0.Product:
        return _ictnbmx0.Product.t;
      case _ioy1aw0v.ProductCategory:
        return _ioy1aw0v.ProductCategory.t;
      case _ip205i9w.ProductPortion:
        return _ip205i9w.ProductPortion.t;
      case _iq6rmlux.StockMovement:
        return _iq6rmlux.StockMovement.t;
      case _iqhl4hru.Transaction:
        return _iqhl4hru.Transaction.t;
      case _i37amypa.TransactionItem:
        return _i37amypa.TransactionItem.t;
    }
    return null;
  }

  @override
  List<_isp.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'airbar_backend';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _iais.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacs.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
