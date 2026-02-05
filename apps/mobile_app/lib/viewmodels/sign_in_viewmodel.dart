import 'package:flutter/material.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import '../main.dart';

class SignInViewModel extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  SignInViewModel() {
    client.auth.authInfoListenable.addListener(_updateSignedInState);
    _isSignedIn = client.auth.isAuthenticated;
  }

  void disposeVM() {
    client.auth.authInfoListenable.removeListener(_updateSignedInState);
  }

  void _updateSignedInState() {
    _isSignedIn = client.auth.isAuthenticated;
    notifyListeners();
  }
}
