import 'package:flutter/material.dart';
import 'package:linkedin_clone_flutter/core/services/localstorage_service.dart';
import 'package:linkedin_clone_flutter/core/services/user_service.dart';

import '../core/models/user_model.dart';

class ProfileViewModel extends ChangeNotifier {
  final UserService _userService = UserService();
  final LocalStorageService _localStorageService = LocalStorageService();

  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> fetchUserProfile(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    final String? uid = await _localStorageService.getUserUid();
    _user = await _userService.getUserByUid(uid!, context);

    _isLoading = false;
    notifyListeners();
  }
}
