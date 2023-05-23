import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mulk_app/application/provider/theme_provider.dart';
import 'package:mulk_app/di.dart';
import 'package:mulk_app/ui/core/themes/app_themes.dart';
import 'package:mulk_app/ui/core/translations/codegen_loader.g.dart';
import 'package:mulk_app/ui/pages/main_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setup();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('uz'),
        Locale('en'),
        Locale('ru'),
        Locale('de')
      ],
      fallbackLocale: const Locale('uz'),
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(di.get()),
      builder: (context, _) {
        final provider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          debugShowCheckedModeBanner: false,
          locale: const Locale("uz"),
          title: 'Al Mulk',
          themeMode: provider.themeMode,
          theme: AppThemes.light(),
          darkTheme: AppThemes.dark(),
          home: const MainPage(),
        );
      },
    );
  }
}
