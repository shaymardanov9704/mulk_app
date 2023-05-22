import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDark => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mulk_app/core/hive/cache_hive.dart';
// import 'package:mulk_app/main.dart';
// import 'package:provider/provider.dart';
//
// class ThemeProvider extends ChangeNotifier {
//   final CacheHive _hive;
//
//   ThemeProvider(this._hive) {
//     _mode = _hive.themeMode;
//     notifyListeners();
//   }
//
//   var _mode = ThemeMode.light;
//
//   static ThemeProvider instance = mainKey.currentContext!.read<ThemeProvider>();
//
//   void toLight() => _changeTheme(ThemeMode.light);
//
//   void toDark() => _changeTheme(ThemeMode.dark);
//
//   void change() => isLight ? toDark() : toLight();
//
//   void _changeTheme(ThemeMode mode) {
//     _mode = mode;
//     notifyListeners();
//     _hive.saveThemeMode(mode);
//     SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle(
//         statusBarBrightness:
//             mode == ThemeMode.dark ? Brightness.dark : Brightness.light,
//       ),
//     );
//   }
//
//   bool get isLight => _mode == ThemeMode.light;
//
//   bool get isDark => _mode == ThemeMode.dark;
//
//   ThemeMode get mode => _mode;
// }
