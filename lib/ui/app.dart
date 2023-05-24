import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mulk_app/core/hive/cache_hive.dart';
import 'package:mulk_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final Widget child;
  final bool enabledPreview;
  final CacheHive hive;

  const App({
    Key? key,
    required this.child,
    required this.hive,
    this.enabledPreview = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(hive),
      child: EasyLocalization(
        supportedLocales: const [
          Locale("uz", "UZ"),
          Locale("uz", "CYR"),
          Locale("ru", "RU"),
          Locale("en", "EN"),
        ],
        path: 'assets/tr',
        fallbackLocale: const Locale("uz", "UZ"),
        startLocale: const Locale("uz", "UZ"),
        useOnlyLangCode: false,
        saveLocale: true,
        child: DevicePreview(
          enabled: enabledPreview,
          builder: (_) => child,
        ),
      ),
    );
  }
}
