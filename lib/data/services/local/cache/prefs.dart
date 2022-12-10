import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

enum PrefsEnum {
  accessToken,
  isAuthenticated,
  isOnboardingShown,
  userId,
  blockList
}

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String getString(PrefsEnum key, [String? defValue]) {
    return _prefsInstance?.getString(key.name) ?? defValue ?? "";
  }

  static Future<bool> setString(PrefsEnum key, String value) async {
    SharedPreferences? prefs = await _instance;
    return prefs.setString(key.name, value);
  }

  static bool getBool(PrefsEnum key, [bool? defValue]) {
    return _prefsInstance?.getBool(key.name) ?? defValue ?? false;
  }

  static Future<bool> setBool(PrefsEnum key, bool value) async {
    SharedPreferences? prefs = await _instance;
    return prefs.setBool(key.name, value);
  }

  static Future<bool> setInt(PrefsEnum key, int value) async {
    SharedPreferences? prefs = await _instance;
    return prefs.setInt(key.name, value);
  }

  static int getInt(PrefsEnum key, [int? defValue]) {
    return _prefsInstance?.getInt(key.name) ?? defValue ?? 0;
  }
}
