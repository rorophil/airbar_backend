import 'dart:io';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:serverpod/serverpod.dart' as serverpod;
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';
import 'src/web/routes/app_config_route.dart';
import 'src/web/routes/root.dart';

/// The starting point of the Serverpod server.
void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = serverpod.Serverpod(args, Protocol(), Endpoints());

  // Initialize authentication services for the server.
  // Token managers will be used to validate and issue authentication keys,
  // and the identity providers will be the authentication options available for users.
  pod.initializeAuthServices(
    tokenManagerBuilders: [
      // Use JWT for authentication keys towards the server.
      JwtConfigFromPasswords(),
    ],
    identityProviderBuilders: [
      // Configure the email identity provider for email/password authentication.
      EmailIdpConfigFromPasswords(
        sendRegistrationVerificationCode: _sendRegistrationCode,
        sendPasswordResetVerificationCode: _sendPasswordResetCode,
      ),
    ],
  );

  // Setup a default page at the web root.
  // These are used by the default page.
  pod.webServer.addRoute(RootRoute(), '/');
  pod.webServer.addRoute(RootRoute(), '/index.html');

  // Serve all files in the web/static relative directory under /.
  // These are used by the default web page.
  final root = Directory(Uri(path: 'web/static').toFilePath());
  pod.webServer.addRoute(serverpod.StaticRoute.directory(root));

  // Setup the app config route.
  // We build this configuration based on the servers api url and serve it to
  // the flutter app.
  pod.webServer.addRoute(
    AppConfigRoute(apiConfig: pod.config.apiServer),
    '/app/assets/assets/config.json',
  );

  // Checks if the flutter web app has been built and serves it if it has.
  final appDir = Directory(Uri(path: 'web/app').toFilePath());
  if (appDir.existsSync()) {
    // Serve the flutter web app under the /app path.
    pod.webServer.addRoute(
      serverpod.FlutterRoute(
        Directory(
          Uri(path: 'web/app').toFilePath(),
        ),
      ),
      '/app',
    );
  } else {
    // If the flutter web app has not been built, serve the build app page.
    pod.webServer.addRoute(
      serverpod.StaticRoute.file(
        File(
          Uri(path: 'web/pages/build_flutter_app.html').toFilePath(),
        ),
      ),
      '/app/**',
    );
  }

  // Start the server.
  await pod.start();

  // Create first admin if none exists
  await _ensureFirstAdmin(pod);
}

/// Ensure at least one admin exists, create default admin if none found
Future<void> _ensureFirstAdmin(serverpod.Serverpod pod) async {
  // Create a session to interact with the database
  final session = await pod.createSession();

  try {
    session.log(
      '🔍 Checking for existing admin accounts...',
      level: serverpod.LogLevel.info,
    );

    // Count admin users instead of fetching them to avoid parsing issues
    int adminCount = 0;
    try {
      final result = await session.db.unsafeQuery(
        "SELECT COUNT(*) FROM users WHERE role = '${UserRole.admin.name}'",
      );
      if (result.isNotEmpty && result.first.isNotEmpty) {
        adminCount = result.first.first as int;
      }
    } catch (e) {
      session.log(
        '⚠️  Error counting admin users: $e - Will attempt to create admin anyway',
        level: serverpod.LogLevel.warning,
      );
    }

    if (adminCount > 0) {
      session.log(
        '✅ Admin account(s) found: $adminCount',
        level: serverpod.LogLevel.info,
      );
      return;
    }

    // No admin found, create default admin
    session.log(
      '⚠️  No admin account found. Creating default admin...',
      level: serverpod.LogLevel.warning,
    );

    // Check if admin email already exists (in case of data inconsistency)
    final emailCheck = await session.db.unsafeQuery(
      "SELECT COUNT(*) FROM users WHERE email = 'admin@airbar.com'",
    );
    final emailExists =
        emailCheck.isNotEmpty &&
        emailCheck.first.isNotEmpty &&
        (emailCheck.first.first as int) > 0;

    if (emailExists) {
      session.log(
        '⚠️  Admin email already exists in database but may have corrupted data.',
        level: serverpod.LogLevel.warning,
      );
      session.log(
        '📧 Use existing: admin@airbar.com / Admin123! / PIN:1234',
        level: serverpod.LogLevel.info,
      );
      return;
    }

    final defaultAdmin = User(
      email: 'admin@airbar.com',
      passwordHash: _hashPassword('Admin123!'),
      role: UserRole.admin,
      balance: 0.0,
      pin: _hashPassword('1234'),
      firstName: 'Admin',
      lastName: 'AirBar',
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await User.db.insertRow(session, defaultAdmin);

    session.log(
      '✅ Default admin created successfully!',
      level: serverpod.LogLevel.info,
    );
    session.log(
      '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━',
      level: serverpod.LogLevel.info,
    );
    session.log(
      '📧 Email: admin@airbar.com',
      level: serverpod.LogLevel.info,
    );
    session.log(
      '🔑 Password: Admin123!',
      level: serverpod.LogLevel.info,
    );
    session.log(
      '📌 PIN: 1234',
      level: serverpod.LogLevel.info,
    );
    session.log(
      '⚠️  IMPORTANT: Change these credentials after first login!',
      level: serverpod.LogLevel.warning,
    );
    session.log(
      '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━',
      level: serverpod.LogLevel.info,
    );
  } catch (e, stackTrace) {
    session.log(
      '❌ Error in admin setup: $e',
      level: serverpod.LogLevel.error,
    );
    session.log(
      'Stack trace: $stackTrace',
      level: serverpod.LogLevel.error,
    );
  } finally {
    await session.close();
  }
}

/// Hash password using SHA256
String _hashPassword(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}

void _sendRegistrationCode(
  serverpod.Session session, {
  required String email,
  required serverpod.UuidValue accountRequestId,
  required String verificationCode,
  required serverpod.Transaction? transaction,
}) {
  // NOTE: Here you call your mail service to send the verification code to
  // the user. For testing, we will just log the verification code.
  session.log('[EmailIdp] Registration code ($email): $verificationCode');
}

void _sendPasswordResetCode(
  serverpod.Session session, {
  required String email,
  required serverpod.UuidValue passwordResetRequestId,
  required String verificationCode,
  required serverpod.Transaction? transaction,
}) {
  // NOTE: Here you call your mail service to send the verification code to
  // the user. For testing, we will just log the verification code.
  session.log('[EmailIdp] Password reset code ($email): $verificationCode');
}
