
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageHelper {
  LocalStorageHelper._internal();
  static final LocalStorageHelper _shared = LocalStorageHelper._internal();

  factory LocalStorageHelper() {
    return _shared;
  }

  late SharedPreferences _preferences;

  static Future<void> initLocalStorageHelper() async {
    _shared._preferences = await SharedPreferences.getInstance();
  }

  static dynamic getValue(String key) {
    return _shared._preferences.get(key);
  }

  static Future<void> setValue(String key, dynamic value) async {
    if (value is int) {
      await _shared._preferences.setInt(key, value);
    } else if (value is double) {
      await _shared._preferences.setDouble(key, value);
    } else if (value is bool) {
      await _shared._preferences.setBool(key, value);
    } else if (value is String) {
      await _shared._preferences.setString(key, value);
    } else if (value is List<String>) {
      await _shared._preferences.setStringList(key, value);
    }
  }

  static Future<void> setString(String key, String value) async {
    await _shared._preferences.setString(key, value);
  }

  static void getBoolNotification() {
    LocalStorageHelper.getValue('isNotificationOn');
  }

  // history search string
  static Future<void> setListHistorySearch(String value) async {
    Set<String> setHistorySearch =
        _shared._preferences.getStringList("setListHistorySearch")?.toSet() ??
            Set();
    setHistorySearch.add(value);
    _shared._preferences
        .setStringList("setListHistorySearch", setHistorySearch.toList());
  }

  static Future<List<String>> getListHistorySearch() async {
    List<String> listHistorySearch =
        _shared._preferences.getStringList("setListHistorySearch") ?? [];
    return listHistorySearch;
  }

  static Future<void> clearListHistorySearch() async {
    Set<String> setHistorySearch =
        _shared._preferences.getStringList("setListHistorySearch")?.toSet() ??
            Set();
    setHistorySearch.clear();
    _shared._preferences
        .setStringList("setListHistorySearch", setHistorySearch.toList());
  }

  // clear sharedPrefences logout
  static Future<void> clearListHistoryCurrentTour() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('setListHistoryCurrentTour');
    await prefs.remove('setListHistoryCurrentDes');
  }
}
