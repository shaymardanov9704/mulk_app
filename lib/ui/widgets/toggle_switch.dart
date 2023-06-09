import 'package:flutter/material.dart';
import 'package:mulk_app/core/utils/app_colors.dart';
import 'package:mulk_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';


class ToggleSwitch extends StatelessWidget {
  const ToggleSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return Switch(
      value: theme.isDark,
      activeColor: AppColors.lightBackground,
      activeTrackColor: AppColors.primary,
      inactiveTrackColor: AppColors.lightBackground,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}