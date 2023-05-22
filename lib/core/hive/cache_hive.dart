import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CacheHive {
  final Box _box;

  CacheHive(this._box);

  Future<void> setFirstTime() => _box.put("firstTime", false);

  bool get firstTime => _box.get("firstTime", defaultValue: true);

  Future<void> saveThemeMode(ThemeMode mode) =>
      _box.put("ThemeMode", mode.name);

  ThemeMode get themeMode {
    final mode = _box.get("ThemeMode", defaultValue: "light");
    final index = ThemeMode.values.toList().indexWhere((e) => e.name == mode);
    return ThemeMode.values[index];
  }
}
