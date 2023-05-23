import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {}, child: const Text("Change Theme")),
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
