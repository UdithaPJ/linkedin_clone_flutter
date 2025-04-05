import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _welcomedKey = 'hasWelcomed';
  static const String _loggedInKey = 'isLoggedIn';
  static const String _userUidKey = 'userUid';

  Future<void> setUserUid(String uid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userUidKey, uid);
  }

  Future<String?> getUserUid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userUidKey);
  }

  Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loggedInKey, value);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loggedInKey) ?? false;
  }

  Future<void> setWelcomed(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_welcomedKey, value);
  }

  Future<bool> hasWelcomed() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_welcomedKey) ?? false;
  }

  Future<void> clearLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_loggedInKey);
  }

  Future<void> clearUserUid() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userUidKey);
  }
}
