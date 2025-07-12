import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferance {
  static SharedPreferences? _preferences;
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setData({required String key, required dynamic value}) async {
    if (value is int) {
      await _preferences?.setInt(key, value);
    } else if (value is double) {
      await _preferences?.setDouble(key, value);
    } else if (value is bool) {
      await _preferences?.setBool(key, value);
    } else if (value is String) {
      await _preferences?.setString(key, value);
    } else if (value is List<String>) {
      await _preferences?.setStringList(key, value);
    }
  }

  static T? getData<T>(String key) {
    if (_preferences == null) return null;

    if (T == int) {
      return _preferences!.getInt(key) as T?;
    } else if (T == double) {
      return _preferences!.getDouble(key) as T?;
    } else if (T == bool) {
      return _preferences!.getBool(key) as T?;
    } else if (T == String) {
      return _preferences!.getString(key) as T?;
    } else if (T == List<String>) {
      return _preferences!.getStringList(key) as T?;
    } else {
      throw Exception('Unsupported type');
    }
  }

  static Future deletData({required String key}) async {
    await _preferences?.remove(key);
  }

  static Future clearData() async {
    await _preferences?.clear();
  }
}
