import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mulk_app/core/common/words.dart';
import 'package:mulk_app/core/utils/app_colors.dart';
import 'package:mulk_app/core/utils/app_text_styles.dart';
import 'package:mulk_app/provider/theme_provider.dart';
import 'package:mulk_app/ui/dialogs/language_dialog.dart';
import 'package:mulk_app/ui/widgets/btn.dart';
import 'package:provider/provider.dart';
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Words.darkMode.tr(),
                      style: AppTextStyles.style600.copyWith(fontSize: 16),
                    ),
                    const Btn(),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    LanguageDialog(context: context).show();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Provider.of<ThemeProvider>(context).isDark
                          ? AppColors.darkBackground
                          : AppColors.lightBackground,
                    ),
                    child: Center(
                      child: Text(
                        Words.changeLanguage.tr(),
                        style: AppTextStyles.style500.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
