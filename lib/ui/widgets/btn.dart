import 'package:flutter/material.dart';
import 'package:mulk_app/application/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class Btn extends StatelessWidget {
  const Btn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return Switch(
      value: theme.isDark,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}
