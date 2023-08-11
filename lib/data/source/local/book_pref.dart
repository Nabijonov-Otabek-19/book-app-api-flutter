import 'package:shared_preferences/shared_preferences.dart';

class BookPRef {
  SharedPreferences? prefs;

  static const THEME_STATUS = "THEMESTATUS";
  static const ISFIRST = "isFirst";

  Future<void> setPosition(String path, double offset) async {
    prefs ??= await SharedPreferences.getInstance();
    await prefs?.setDouble(path, offset);
  }

  Future<double> getPosition(String path) async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs?.getDouble(path) ?? 0;
  }

  Future<bool> getBool() async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs?.getBool(ISFIRST) ?? true;
  }

  Future setBool(bool value) async {
    prefs ??= await SharedPreferences.getInstance();
    await prefs?.setBool(ISFIRST, value);
  }

  Future setDarkTheme(bool value) async {
    prefs ??= await SharedPreferences.getInstance();
    await prefs?.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs?.getBool(THEME_STATUS) ?? false;
  }
}
