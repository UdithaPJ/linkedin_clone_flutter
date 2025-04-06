import 'package:flutter/material.dart';
import 'package:linkedin_clone_flutter/core/models/user_model.dart';
import 'package:linkedin_clone_flutter/core/services/auth_service.dart';
import 'package:linkedin_clone_flutter/core/services/user_service.dart';

import '../core/services/localstorage_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final LocalStorageService _localStorageService = LocalStorageService();
  final UserService _userService = UserService();

  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> signUp(String name, String email, String password, bool isMarkedRemember, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    _user = await _authService.signUp(name, email, password, context);
    if(isMarkedRemember) {
      await _localStorageService.setLoggedIn(true);
      await _localStorageService.setUserUid(_user!.uid);
    }
    await _localStorageService.setWelcomed(true);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> signIn(String email, String password, bool isMarkedRemember, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    _user = await _authService.signIn(email, password, context);
    if(isMarkedRemember) {
      await _localStorageService.setLoggedIn(true);
      await _localStorageService.setUserUid(_user!.uid);
    }
    await _localStorageService.setWelcomed(true);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> signOut(BuildContext context) async {
    await _localStorageService.clearLoggedIn();
    await _localStorageService.clearUserUid();
    await _authService.signOut(context);
    _user = null;
    notifyListeners();
  }
}