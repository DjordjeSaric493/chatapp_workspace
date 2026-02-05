import 'dart:io';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';
import 'src/web/routes/app_config_route.dart';
import 'src/web/routes/root.dart';

/// The starting point of the Serverpod server.
void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(args, Protocol(), Endpoints());

  // -----------------------------------------------------------------------
  // 🛠️ FIX ZA ĐORĐA: GLOBALNI AUTH CONFIG
  // Ovim "prevarimo" Serverpod da misli da je email poslat, a zapravo
  // mi odmah potvrđujemo nalog u bazi.
  // -----------------------------------------------------------------------
  auth.AuthConfig.set(
    auth.AuthConfig(
      sendValidationEmail: (session, email, validationCode) async {
        print('🚀 GLOBALNI BYPASS AKTIVIRAN ZA: $email (Kod: $validationCode)');

        // Odmah pozivamo funkciju za kreiranje naloga
        var userInfo = await auth.Emails.tryCreateAccount(
          session,
          email: email,
          verificationCode: validationCode,
        );

        if (userInfo != null) {
          print('✅ USPEH: Nalog kreiran kroz globalni config!');
          return true; // Vraćamo true da Serverpod misli da je email poslat
        } else {
          print('⚠️ NIJE USPELO: tryCreateAccount vratio null.');
          return false;
        }
      },
      sendPasswordResetEmail: (session, userInfo, validationCode) async {
        print('Password reset code za ${userInfo.email}: $validationCode');
        return true;
      },
    ),
  );
  // -----------------------------------------------------------------------

  // Initialize authentication services for the server.
  pod.initializeAuthServices(
    tokenManagerBuilders: [
      JwtConfigFromPasswords(),
    ],
    identityProviderBuilders: [
      EmailIdpConfigFromPasswords(
        // Ostavljamo i ovde tvoje funkcije za svaki slučaj, ali
        // gornji AuthConfig.set će verovatno prvi uhvatiti zahtev.
        sendRegistrationVerificationCode: _sendRegistrationCode,
        sendPasswordResetVerificationCode: _sendPasswordResetCode,
      ),
    ],
  );

  // Setup a default page at the web root.
  pod.webServer.addRoute(RootRoute(), '/');
  pod.webServer.addRoute(RootRoute(), '/index.html');

  // Serve all files in the web/static relative directory under /.
  final root = Directory(Uri(path: 'web/static').toFilePath());
  pod.webServer.addRoute(StaticRoute.directory(root));

  // Setup the app config route.
  pod.webServer.addRoute(
    AppConfigRoute(apiConfig: pod.config.apiServer),
    '/app/assets/assets/config.json',
  );

  // Checks if the flutter web app has been built and serves it if it has.
  final appDir = Directory(Uri(path: 'web/app').toFilePath());
  if (appDir.existsSync()) {
    pod.webServer.addRoute(
      FlutterRoute(
        Directory(
          Uri(path: 'web/app').toFilePath(),
        ),
      ),
      '/app',
    );
  } else {
    pod.webServer.addRoute(
      StaticRoute.file(
        File(
          Uri(path: 'web/pages/build_flutter_app.html').toFilePath(),
        ),
      ),
      '/app/**',
    );
  }

  // Start the server.
  await pod.start();
}

// Ostavljamo i ovu funkciju kao backup
void _sendRegistrationCode(
  Session session, {
  required String email,
  required UuidValue accountRequestId,
  required String verificationCode,
  required Transaction? transaction,
}) async {
  print('🚀 BACKUP BYPASS ZA: $email');
  // Logika je sada prebačena i gore u AuthConfig.set
  // ali neka stoji ovde da ne pukne kod ako Serverpod odluči da koristi ovo.
  await auth.Emails.tryCreateAccount(
    session,
    email: email,
    verificationCode: verificationCode,
  );
}

void _sendPasswordResetCode(
  Session session, {
  required String email,
  required UuidValue passwordResetRequestId,
  required String verificationCode,
  required Transaction? transaction,
}) {
  session.log('[EmailIdp] Password reset code ($email): $verificationCode');
}
