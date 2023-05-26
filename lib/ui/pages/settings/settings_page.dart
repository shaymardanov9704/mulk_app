import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mulk_app/core/common/words.dart';
import 'package:mulk_app/core/utils/app_colors.dart';
import 'package:mulk_app/core/utils/app_text_styles.dart';
import 'package:mulk_app/provider/theme_provider.dart';
import 'package:mulk_app/ui/app_icons.dart';
import 'package:mulk_app/ui/dialogs/language_dialog.dart';
import 'package:mulk_app/ui/pages/about_app_page.dart';
import 'package:mulk_app/ui/pages/settings/widgets/toggle_switch.dart';
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
            body: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                const SizedBox(height: 12),
                _Item(
                  icon: AppIcons.moonDark.copyWith(
                    color: Provider.of<ThemeProvider>(context).isDark
                        ? AppColors.white
                        : AppColors.black,
                    width: 24,
                  ),
                  title: Words.darkMode.tr(),
                  onTap: () {},
                  toggle: const ToggleSwitch(),
                ),
                const SizedBox(height: 12),
                _Item(
                  icon: AppIcons.earth.copyWith(
                    color: Provider.of<ThemeProvider>(context).isDark
                        ? AppColors.white
                        : AppColors.black,
                    width: 25,
                  ),
                  title: Words.changeLanguage.tr(),
                  onTap: () {
                    LanguageDialog(context: context).show();
                  },
                  // toggle: Text(Words.uz.tr()),
                ),
                const SizedBox(height: 12),
                _Item(
                  icon: AppIcons.share.copyWith(
                    color: Provider.of<ThemeProvider>(context).isDark
                        ? AppColors.white
                        : AppColors.black,
                    width: 25,
                  ),
                  onTap: () {},
                  title: Words.share.tr(),
                ),
                const SizedBox(height: 12),
                _Item(
                  icon: AppIcons.playStore.copyWith(
                    color: Provider.of<ThemeProvider>(context).isDark
                        ? AppColors.white
                        : AppColors.black,
                    width: 28,
                  ),
                  onTap: () {},
                  title: Words.rateApp.tr(),
                ),
                const SizedBox(height: 12),
                _Item(
                  icon: AppIcons.info.copyWith(
                    color: Provider.of<ThemeProvider>(context).isDark
                        ? AppColors.white
                        : AppColors.black,
                    width: 34,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const AboutAppPage(),
                      ),
                    );
                  },
                  title: Words.about.tr(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final Widget icon;
  final String title;
  final Widget? toggle;
  final Function() onTap;

  const _Item({
    Key? key,
    required this.icon,
    required this.title,
    this.toggle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Provider.of<ThemeProvider>(context).isDark
              ? AppColors.darkBackground
              : AppColors.lightBackground,
          border: Border.all(width: 0.5, color: AppColors.primary),
        ),
        child: Row(
          children: [
            SizedBox(width: 42, child: Center(child: icon)),
            const SizedBox(width: 8),
            Text(
              title,
              style: AppTextStyles.style600.copyWith(
                fontSize: 17,
                color: Provider.of<ThemeProvider>(context).isDark
                    ? AppColors.white
                    : AppColors.black,
              ),
            ),
            const Expanded(child: SizedBox()),
            toggle ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}
