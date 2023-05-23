import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mulk_app/core/app_colors.dart';

class AppThemes {
  const AppThemes._();

  static ThemeData light() {
    return ThemeData(
      primaryColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: const ColorScheme.light(),
      brightness: Brightness.light,
      hintColor: AppColors.white,
      iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
        backgroundColor: AppColors.white,
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      primaryColor: AppColors.white,
      colorScheme: const ColorScheme.dark(),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.black,
      iconTheme: const IconThemeData(color: Colors.red, opacity: 0.8),
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
        backgroundColor: AppColors.black,
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
