import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mulk_app/ui/widgets/btn.dart';
import 'bloc/settings_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final bloc = SettingsBloc();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Settings"),
            ),
            body: ListView(
              padding: const EdgeInsets.all(10),
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
        },
      ),
    );
  }
}
