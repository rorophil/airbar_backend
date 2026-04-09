import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart' as protocol;
import 'package:crypto/crypto.dart';
import 'dart:convert';

/// Endpoint for user management (admin operations)
class UserEndpoint extends Endpoint {
  /// Get all users (admin only)
  Future<List<protocol.User>> getAllUsers(Session session) async {
    try {
      return await protocol.User.db.find(session);
    } catch (e) {
      session.log('Get all users error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Get user by ID
  Future<protocol.User?> getUserById(Session session, int userId) async {
    try {
      return await protocol.User.db.findById(session, userId);
    } catch (e) {
      session.log('Get user by ID error: $e', level: LogLevel.warning);
      return null;
    }
  }

  /// Create new user (admin only)
  Future<protocol.User> createUser(
    Session session,
    String email,
    String password,
    String firstName,
    String lastName,
    String pin,
    protocol.UserRole role,
  ) async {
    try {
      // Check if email already exists
      final existingUsers = await protocol.User.db.find(
        session,
        where: (t) => t.email.equals(email),
      );

      if (existingUsers.isNotEmpty) {
        throw InvalidParametersException('Cet email est déjà utilisé');
      }

      // Create user
      final user = protocol.User(
        email: email,
        passwordHash: _hashPassword(password),
        role: role,
        balance: 0.0,
        pin: _hashPassword(pin),
        firstName: firstName,
        lastName: lastName,
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      return await protocol.User.db.insertRow(session, user);
    } catch (e) {
      session.log('Create user error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Update user (admin only)
  Future<protocol.User> updateUser(
    Session session,
    int userId,
    String email,
    String firstName,
    String lastName,
    protocol.UserRole role,
  ) async {
    try {
      final user = await protocol.User.db.findById(session, userId);

      if (user == null) {
        throw Exception('Utilisateur non trouvé');
      }

      // Check if email is taken by another user
      if (email != user.email) {
        final existingUsers = await protocol.User.db.find(
          session,
          where: (t) => t.email.equals(email),
        );

        if (existingUsers.isNotEmpty) {
          throw Exception('Cet email est déjà utilisé');
        }
      }

      user.email = email;
      user.firstName = firstName;
      user.lastName = lastName;
      user.role = role;
      user.updatedAt = DateTime.now();

      return await protocol.User.db.updateRow(session, user);
    } catch (e) {
      session.log('Update user error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Deactivate user (soft delete, admin only)
  Future<void> deactivateUser(Session session, int userId) async {
    try {
      final user = await protocol.User.db.findById(session, userId);

      if (user == null) {
        throw Exception('Utilisateur non trouvé');
      }

      user.isActive = false;
      user.updatedAt = DateTime.now();

      await protocol.User.db.updateRow(session, user);
    } catch (e) {
      session.log('Deactivate user error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Reactivate user (admin only)
  Future<void> reactivateUser(Session session, int userId) async {
    try {
      final user = await protocol.User.db.findById(session, userId);

      if (user == null) {
        throw Exception('Utilisateur non trouvé');
      }

      user.isActive = true;
      user.updatedAt = DateTime.now();

      await protocol.User.db.updateRow(session, user);
    } catch (e) {
      session.log('Reactivate user error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Reset user password (admin only)
  Future<void> resetPassword(
    Session session,
    int userId,
    String newPassword,
  ) async {
    try {
      final user = await protocol.User.db.findById(session, userId);

      if (user == null) {
        throw Exception('Utilisateur non trouvé');
      }

      // Update password
      user.passwordHash = _hashPassword(newPassword);
      user.updatedAt = DateTime.now();

      await protocol.User.db.updateRow(session, user);
      session.log('Password reset for user ${user.id}', level: LogLevel.info);
    } catch (e) {
      session.log('Reset password error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Reset user PIN code (admin only)
  Future<void> resetPin(
    Session session,
    int userId,
    String newPin,
  ) async {
    try {
      final user = await protocol.User.db.findById(session, userId);

      if (user == null) {
        throw Exception('Utilisateur non trouvé');
      }

      // Update PIN
      user.pin = _hashPassword(newPin);
      user.updatedAt = DateTime.now();

      await protocol.User.db.updateRow(session, user);
      session.log('PIN reset for user ${user.id}', level: LogLevel.info);
    } catch (e) {
      session.log('Reset PIN error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Delete user (hard delete, admin only)
  Future<void> deleteUser(Session session, int userId) async {
    try {
      final user = await protocol.User.db.findById(session, userId);

      if (user == null) {
        throw InvalidParametersException('Utilisateur non trouvé');
      }

      // Check if user has transactions
      final transactions = await protocol.Transaction.db.find(
        session,
        where: (t) => t.userId.equals(userId),
        limit: 1,
      );

      if (transactions.isNotEmpty) {
        throw InvalidParametersException(
          'Impossible de supprimer cet utilisateur car il a des transactions associées',
        );
      }

      await protocol.User.db.deleteRow(session, user);
    } catch (e) {
      session.log('Delete user error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Credit or debit user account (admin only)
  Future<protocol.Transaction> creditAccount(
    Session session,
    int userId,
    double amount,
    String? notes,
  ) async {
    try {
      if (amount == 0) {
        throw Exception('Le montant ne peut pas être zéro');
      }

      return await session.db.transaction((transaction) async {
        // Get user
        final user = await protocol.User.db.findById(session, userId);

        if (user == null) {
          throw Exception('Utilisateur non trouvé');
        }

        // Check if debit would make balance negative
        if (amount < 0 && user.balance + amount < 0) {
          throw Exception(
            'Solde insuffisant. Solde actuel: ${user.balance.toStringAsFixed(2)} €',
          );
        }

        // Update balance (works for both credit and debit)
        user.balance += amount;
        user.updatedAt = DateTime.now();
        await protocol.User.db.updateRow(session, user);

        // Create transaction record
        final trans = protocol.Transaction(
          userId: userId,
          type: protocol.TransactionType.credit,
          totalAmount: amount,
          timestamp: DateTime.now(),
          notes: notes,
          refundedTransactionId: null,
        );

        return await protocol.Transaction.db.insertRow(session, trans);
      });
    } catch (e) {
      session.log('Credit/Debit account error: $e', level: LogLevel.warning);
      rethrow;
    }
  }

  /// Hash password using SHA256
  String _hashPassword(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
