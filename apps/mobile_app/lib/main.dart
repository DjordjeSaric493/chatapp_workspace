import 'package:chatapp_flutter/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:chatapp_client/chatapp_client.dart';
import 'firebase_options.dart';
import 'screens/sign_in_screen.dart';

// Globalni klijent da bi mu mogao pristupiti bilo gde u fajlu
late Client client;
late FlutterAuthSessionManager sessionManager;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Inicijalizacija Firebase-a
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 2. Kreiramo KeyManager koji će deliti svi
  var authKeyManager = FlutterAuthenticationKeyManager();

  // 3. Inicijalizacija Serverpod klijenta sa tim menadžerom
  client = Client(
    'http://192.168.0.37:8080/', // Podsetnik: 10.0.2.2 ako si na emulatoru!
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  // 4. Inicijalizacija Session Managera sa istim klijentom
  // On će interno koristiti isti authKeyManager preko klijenta
  sessionManager = FlutterAuthSessionManager();
  await sessionManager.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App FON',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SignInScreen(),
    );
  }
}
