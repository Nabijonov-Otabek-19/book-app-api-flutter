import 'package:shared_preferences/shared_preferences.dart';

class BookPRef {
  static final BookPRef myPref = BookPRef._internal();

  factory BookPRef() => myPref;

  BookPRef._internal();

  SharedPreferences? _prefs;

  static const THEME_STATUS = "THEMESTATUS";
  static const ISFIRST = "isFirst";

  Future<void> setPosition(String path, double offset) async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs?.setDouble(path, offset);
  }

  Future<double> getPosition(String path) async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs?.getDouble(path) ?? 0;
  }

  Future<bool> getBool() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs?.getBool(ISFIRST) ?? true;
  }

  Future setBool(bool value) async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs?.setBool(ISFIRST, value);
  }

  Future setDarkTheme(bool value) async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs?.setBool(THEME_STATUS, value);
  }

  Future<bool> getDarkTheme() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs?.getBool(THEME_STATUS) ?? false;
  }
}
