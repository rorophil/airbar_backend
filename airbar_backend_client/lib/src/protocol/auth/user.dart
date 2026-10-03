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
import '../auth/user_role.dart' as _ip8qv1h2;

abstract class User
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  User._({
    this.id,
    required this.email,
    required this.passwordHash,
    required this.role,
    double? balance,
    required this.pin,
    required this.firstName,
    required this.lastName,
    bool? isActive,
    required this.createdAt,
    required this.updatedAt,
  }) : balance = balance ?? 0.0,
       isActive = isActive ?? true;

  factory User({
    int? id,
    required String email,
    required String passwordHash,
    required _ip8qv1h2.UserRole role,
    double? balance,
    required String pin,
    required String firstName,
    required String lastName,
    bool? isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      email: jsonSerialization['email'] as String,
      passwordHash: jsonSerialization['passwordHash'] as String,
      role: _ip8qv1h2.UserRole.fromJson((jsonSerialization['role'] as String)),
      balance: (jsonSerialization['balance'] as num?)?.toDouble(),
      pin: jsonSerialization['pin'] as String,
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      isActive: jsonSerialization['isActive'] == null
          ? null
          : _isc.BoolJsonExtension.fromJson(jsonSerialization['isActive']),
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String email;

  String passwordHash;

  _ip8qv1h2.UserRole role;

  double balance;

  String pin;

  String firstName;

  String lastName;

  bool isActive;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  User copyWith({
    int? id,
    String? email,
    String? passwordHash,
    _ip8qv1h2.UserRole? role,
    double? balance,
    String? pin,
    String? firstName,
    String? lastName,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'User',
      if (id != null) 'id': id,
      'email': email,
      'passwordHash': passwordHash,
      'role': role.toJson(),
      'balance': balance,
      'pin': pin,
      'firstName': firstName,
      'lastName': lastName,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'User',
      if (id != null) 'id': id,
      'email': email,
      'passwordHash': passwordHash,
      'role': role.toJson(),
      'balance': balance,
      'pin': pin,
      'firstName': firstName,
      'lastName': lastName,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String email,
    required String passwordHash,
    required _ip8qv1h2.UserRole role,
    double? balance,
    required String pin,
    required String firstName,
    required String lastName,
    bool? isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         email: email,
         passwordHash: passwordHash,
         role: role,
         balance: balance,
         pin: pin,
         firstName: firstName,
         lastName: lastName,
         isActive: isActive,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  User copyWith({
    Object? id = _Undefined,
    String? email,
    String? passwordHash,
    _ip8qv1h2.UserRole? role,
    double? balance,
    String? pin,
    String? firstName,
    String? lastName,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id is int? ? id : this.id,
      email: email ?? this.email,
      passwordHash: passwordHash ?? this.passwordHash,
      role: role ?? this.role,
      balance: balance ?? this.balance,
      pin: pin ?? this.pin,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
