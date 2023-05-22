import 'package:flutter/material.dart';
import 'package:mulk_app/ui/core/utils/app_colors.dart';

class AppThemes {
  const AppThemes._();

  static ThemeData light() {
    return ThemeData(
      primaryColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: const ColorScheme.light(),
      hintColor: AppColors.white,
      iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
      useMaterial3: true,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      primaryColor: AppColors.white,
      colorScheme: const ColorScheme.dark(),
      scaffoldBackgroundColor: AppColors.black,
      iconTheme: const IconThemeData(color: Colors.red, opacity: 0.8),
      useMaterial3: true,
    );
  }
}
