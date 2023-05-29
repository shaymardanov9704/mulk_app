import 'package:flutter/material.dart';
import 'package:mulk_app/core/hive/cache_hive.dart';

class ThemeProvider extends ChangeNotifier {
  final CacheHive _hive;

  ThemeProvider(this._hive) {
    themeMode = _hive.themeMode;
    notifyListeners();
  }

  ThemeMode themeMode = ThemeMode.light;

  bool get isDark => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) async {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    await _hive.saveThemeMode(isOn ? ThemeMode.dark : ThemeMode.light);
    notifyListeners();
  }
}
