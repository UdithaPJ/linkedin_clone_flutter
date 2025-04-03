

import 'package:flutter/material.dart';
import 'package:linkedin_clone_flutter/core/models/user_model.dart';
import 'package:linkedin_clone_flutter/core/services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> signUp(String name, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    _user = await _authService.signUp(name, email, password);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    _user = await _authService.signIn(email, password);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> signOut() async {
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }
}