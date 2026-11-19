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

abstract class BatchBillingRequest
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
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
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String requestKey;

  int adminId;

  String requestHash;

  String transactionIds;

  DateTime createdAt;

  /// Returns a shallow copy of this [BatchBillingRequest]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
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

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
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
  @_isc.useResult
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
