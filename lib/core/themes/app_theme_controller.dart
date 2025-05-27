import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_clinic/core/app_preferences.dart';
import 'package:smart_clinic/core/themes/app_colors.dart';

class ThemeControllerProvider extends ChangeNotifier {
  final AppPreferences _appPref = AppPreferences();
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ThemeData get lightThemeData => FlexThemeData.light(
    colors: FlexSchemeColor(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
  );

  ThemeData get darkThemeData => FlexThemeData.dark(
    colors: FlexSchemeColor(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
  );

  Future<ThemeData> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _themeMode = _appPref.getThemeMode(prefs);
    notifyListeners();
    switch (_themeMode) {
      case ThemeMode.light:
        return lightThemeData;
      case ThemeMode.dark:
        return darkThemeData;
      case ThemeMode.system:
        return darkThemeData;
    }
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    _themeMode = themeMode;
    await _appPref.setThemeMode(themeMode);
    notifyListeners();
  }
}

final themeControllerProvider = ChangeNotifierProvider<ThemeControllerProvider>(
  (ref) => ThemeControllerProvider(),
);
