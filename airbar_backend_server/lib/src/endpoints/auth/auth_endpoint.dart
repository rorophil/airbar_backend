import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

/// Endpoint for authentication operations
class AuthEndpoint extends Endpoint {
  /// Login with email and password
  Future<User?> login(Session session, String email, String password) async {
    try {
      // Find user by email
      final users = await User.db.find(
        session,
        where: (t) => t.email.equals(email),
      );

      if (users.isEmpty) {
        throw Exception('Utilisateur non trouvé');
      }

      final user = users.first;

      // Check if user is active
      if (!user.isActive) {
        throw Exception('Compte désactivé');
      }

      // Verify password
      final passwordHash = _hashPassword(password);
      if (user.passwordHash != passwordHash) {
        throw Exception('Mot de passe incorrect');
      }

      // Return user without sensitive data
      return user;
    } catch (e) {
      session.log('Login error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Validate PIN code for checkout
  Future<bool> validatePin(Session session, int userId, String pin) async {
    try {
      final user = await User.db.findById(session, userId);

      if (user == null) {
        throw Exception('Utilisateur non trouvé');
      }

      final pinHash = _hashPassword(pin);
      return user.pin == pinHash;
    } catch (e) {
      session.log('PIN validation error: $e', level: LogLevel.warning);
      return false;
    }
  }

  /// Change PIN code
  Future<void> changePin(
    Session session,
    int userId,
    String oldPin,
    String newPin,
  ) async {
    try {
      final user = await User.db.findById(session, userId);

      if (user == null) {
        throw Exception('Utilisateur non trouvé');
      }

      // Verify old PIN
      final oldPinHash = _hashPassword(oldPin);
      if (user.pin != oldPinHash) {
        throw Exception('Code PIN actuel incorrect');
      }

      // Update PIN
      user.pin = _hashPassword(newPin);
      user.updatedAt = DateTime.now();
      await User.db.updateRow(session, user);
    } catch (e) {
      session.log('Change PIN error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Hash password or PIN using SHA256
  String _hashPassword(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
