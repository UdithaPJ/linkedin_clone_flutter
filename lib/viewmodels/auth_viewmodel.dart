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

  Future<void> signUp(String name, String email, String password, bool isMarkedRemember) async {
    _isLoading = true;
    notifyListeners();

    _user = await _authService.signUp(name, email, password);
    if(isMarkedRemember) {
      await _localStorageService.setLoggedIn(true);
      await _localStorageService.setUserUid(_user!.uid);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> signIn(String email, String password, bool isMarkedRemember) async {
    _isLoading = true;
    notifyListeners();

    _user = await _authService.signIn(email, password);
    if(isMarkedRemember) {
      await _localStorageService.setLoggedIn(true);
      await _localStorageService.setUserUid(_user!.uid);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchUserData(String uid) async {
    final UserModel user = await _userService.getUserByUid(uid);
  }

  Future<void> signOut() async {
    await _localStorageService.clearLoggedIn();
    await _localStorageService.clearUserUid();
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }
}