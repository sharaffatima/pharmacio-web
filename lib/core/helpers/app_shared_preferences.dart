import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/shared_pref_keys.dart';
import 'web_storage_stub.dart' if (dart.library.html) 'web_storage_web.dart';

class AppSharedPreferences {
  static final AppSharedPreferences _instance =
      AppSharedPreferences._internal();

  late SharedPreferences _prefs;
  final WebStorage _webStorage = WebStorage();

  AppSharedPreferences._internal();

  factory AppSharedPreferences() => _instance;

  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  bool _useSessionStorage(String key) {
    if (!kIsWeb) {
      return false;
    }
    return key == AppSharedPrefKeys.accessToken ||
        key == AppSharedPrefKeys.refreshToken;
  }

  // Setters
  Future<void> setString(String key, String value) async {
    if (_useSessionStorage(key)) {
      _webStorage.setItem(key, value);
      return;
    }
    await _prefs.setString(key, value);
  }

  Future<void> setBool(String key, bool value) async =>
      await _prefs.setBool(key, value);

  Future<void> setInt(String key, int value) async =>
      await _prefs.setInt(key, value);

  Future<void> setDouble(String key, double value) async =>
      await _prefs.setDouble(key, value);

  // Getters
  String? getString(String key) {
    if (_useSessionStorage(key)) {
      return _webStorage.getItem(key);
    }
    return _prefs.getString(key);
  }

  bool? getBool(String key) => _prefs.getBool(key);

  int? getInt(String key) => _prefs.getInt(key);

  double? getDouble(String key) => _prefs.getDouble(key);

  // Clear all data
  Future<bool> clear() async {
    if (kIsWeb) {
      _webStorage.clear();
    }
    return await _prefs.clear();
  }

  // Clear specific key
  Future<bool> removeKey(String key) async {
    if (_useSessionStorage(key)) {
      _webStorage.removeItem(key);
      return true;
    }
    return await _prefs.remove(key);
  }
}
