import 'package:flutter/material.dart';
import '../main.dart'; // Da bi video globalni 'client'

class SignUpViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Dodajemo ovo da popravimo tvoju grešku u SignUpScreen-u
  bool _registrationSuccess = false;
  bool get registrationSuccess => _registrationSuccess;

  Future<bool> signUp(String username, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Pravi Serverpod poziv za registraciju
      // Napomena: Ovo šalje verifikacioni kod na email
      bool success = await client.modules.auth.email.createAccountRequest(
        username,
        email,
        password,
      );

      _registrationSuccess = success;
      return success;
    } catch (e) {
      debugPrint("Serverpod SignUp Error: $e");
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
