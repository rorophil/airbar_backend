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
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import '../stock/movement_type.dart' as _i5r1t5hy;

abstract class StockMovement
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
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
    required _i5r1t5hy.MovementType movementType,
    required int userId,
    required DateTime timestamp,
    String? notes,
  }) = _StockMovementImpl;

  factory StockMovement.fromJson(Map<String, dynamic> jsonSerialization) {
    return StockMovement(
      id: jsonSerialization['id'] as int?,
      productId: jsonSerialization['productId'] as int,
      quantity: (jsonSerialization['quantity'] as num).toDouble(),
      movementType: _i5r1t5hy.MovementType.fromJson(
        (jsonSerialization['movementType'] as String),
      ),
      userId: jsonSerialization['userId'] as int,
      timestamp: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      notes: jsonSerialization['notes'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int productId;

  double quantity;

  _i5r1t5hy.MovementType movementType;

  int userId;

  DateTime timestamp;

  String? notes;

  /// Returns a shallow copy of this [StockMovement]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  StockMovement copyWith({
    int? id,
    int? productId,
    double? quantity,
    _i5r1t5hy.MovementType? movementType,
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

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StockMovementImpl extends StockMovement {
  _StockMovementImpl({
    int? id,
    required int productId,
    required double quantity,
    required _i5r1t5hy.MovementType movementType,
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
  @_isc.useResult
  @override
  StockMovement copyWith({
    Object? id = _Undefined,
    int? productId,
    double? quantity,
    _i5r1t5hy.MovementType? movementType,
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
