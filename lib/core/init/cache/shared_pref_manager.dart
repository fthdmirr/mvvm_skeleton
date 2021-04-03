import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enum/preferences_keys.dart';

class DataManager {
  static final DataManager _instance = DataManager._init();
  static DataManager get instance => _instance;

  SharedPreferences? _preferences;

  DataManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  Future<void> setIntValue(PreferencesKeys key, int value) async {
    await _preferences!.setInt(key.toString(), value);
  }

  Future<void> setDoubleValue(PreferencesKeys key, double value) async {
    await _preferences!.setDouble(key.toString(), value);
  }

  Future<void> setBoolValue(PreferencesKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  Future<void> clearData(PreferencesKeys key) async {
    await _preferences!.remove(key.toString());
  }

   Future<void> clearAllData(PreferencesKeys key) async {
    await _preferences!.clear();
  }

  String getStringValue(PreferencesKeys key) =>
      _preferences!.getString(key.toString()) ?? '';
  int getIntValue(PreferencesKeys key) =>
      _preferences!.getInt(key.toString()) ?? 0;
  double getDoubleValue(PreferencesKeys key) =>
      _preferences!.getDouble(key.toString()) ?? 0;
  bool getBoolValue(PreferencesKeys key) =>
      _preferences!.getBool(key.toString()) ?? false;
}
