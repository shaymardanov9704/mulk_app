import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mulk_app/ui/widgets/btn.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Btn(),
          ElevatedButton(
            onPressed: () {
              context.setLocale(const Locale('en'));
            },
            child: const Text("English"),
          ),
          ElevatedButton(
            onPressed: () {
              context.setLocale(const Locale('uz'));
            },
            child: const Text("O`zbek"),
          ),
          ElevatedButton(
            onPressed: () {
              context.setLocale(const Locale('de'));
            },
            child: const Text("Ўзбек"),
          ),
          ElevatedButton(
            onPressed: () {
              context.setLocale(const Locale('ru'));
            },
            child: const Text("Русский"),
          ),
        ],
      ),
    );
  }
}
