import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mulk_app/di.dart';
import 'package:mulk_app/core/utils/app_themes.dart';
import 'package:mulk_app/ui/app.dart';
import 'package:mulk_app/ui/pages/main/main_page.dart';
import 'package:provider/provider.dart';
import 'provider/theme_provider.dart';

void main() async {
  runZonedGuarded(() async {
    await setup();
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider(di.get())),
        ],
        child: App(
          hive: di.get(),
          enabledPreview: false,
          child: const MyApp(),
        ),
      ),
    );
  }, (error, stack) {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al Mulk',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: context.watch<ThemeProvider>().themeMode,
      theme: AppThemes.light(),
      darkTheme: AppThemes.dark(),
      home: const MainPage(),
    );
  }
}
