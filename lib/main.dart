import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mulk_app/core/translations/codegen_loader.g.dart';
import 'package:mulk_app/ui/pages/main/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('uz'),
        Locale('ru'),
        Locale('de')
      ],
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: const Locale("Uz"),
      title: 'Mulk',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
      ),
      home: const MainPage(),
    );
  }
}
