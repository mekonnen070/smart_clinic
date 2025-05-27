import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_clinic/core/themes/theme_strings.dart';

/// This class is responsible for managing app preferences using SharedPreferences.
/// It provides methods to set and get user login status and language preference.
///
class AppPreferences {
  SharedPreferences? prefs;

  AppPreferences() {
    _init();
  }

  /// Shared Preferences Keys
  static const String kLoggedInPrefKey = 'isLoggedIn';

  /// The key used to store and retrieve the theme mode preference.
  static const String themeKey = 'theme_mode';

  Future<void> _init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> setUserLoggedIn(bool isLoggedIn) async {
    final pref = prefs ?? await SharedPreferences.getInstance();
    await pref.setBool(kLoggedInPrefKey, isLoggedIn);
  }

  bool getUserIsLoggedIn(SharedPreferences prefs) {
    return prefs.getBool(kLoggedInPrefKey) ?? false;
  }

  /// Sets the theme mode in shared preferences.
  ///
  Future<void> setThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    String themeString;
    switch (themeMode) {
      case ThemeMode.light:
        themeString = ThemeStrings.light;
        break;
      case ThemeMode.dark:
        themeString = ThemeStrings.dark;
        break;
      default:
        themeString = ThemeStrings.system;
    }
    await prefs.setString(themeKey, themeString);
  }

  /// Gets the theme mode from shared preferences.
  ///
  ThemeMode getThemeMode(SharedPreferences prefs) {
    final themeString = prefs.getString(themeKey);
    if (themeString == ThemeStrings.light) return ThemeMode.light;
    if (themeString == ThemeStrings.dark) return ThemeMode.dark;
    return ThemeMode.system;
  }
}
