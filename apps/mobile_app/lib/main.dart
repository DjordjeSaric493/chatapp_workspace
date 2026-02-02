import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; //arget of URI doesn't exist: 'package:firebase_core/firebase_core.dart'.
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:chatapp_client/chatapp_client.dart';
import 'firebase_options.dart';

// Globalni klijent da bi mu mogao pristupiti bilo gde u fajlu
late Client client;
late SessionManager sessionManager; //

void main() async {
  // Obavezno za async operacije u main-u
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Inicijalizacija Firebase-a
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // 2. Inicijalizacija Session Managera (Ovo rešava tvoj problem)
  sessionManager = FlutterAuthSessionManager() as SessionManager;
  await sessionManager.initialize();

  // 2. Inicijalizacija Serverpod klijenta
  // Napomena: Za Android Emulator koristi 'http://10.0.2.2:8080/'
  client = Client(
    'http://localhost:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  // 3. Inicijalizacija Auth modula
  await client.auth.initialize();
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    // Provera da li je korisnik ulogovan preko Serverpod session manager-a
    _isLoggedIn = sessionManager.isSignedIn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat App FON"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isLoggedIn ? "Ulogovani ste!" : "Niste ulogovani.",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ovde bi išla tvoja logika za login bez provajdera
                print("Dugme kliknuto");
              },
              child: const Text("Prijavi se sa Google-om"),
            ),
          ],
        ),
      ),
    );
  }
}
