import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulk_app/core/common/words.dart';
import 'package:mulk_app/core/utils/app_colors.dart';
import 'package:mulk_app/core/utils/app_text_styles.dart';
import 'package:mulk_app/ui/pages/main/main_page.dart';

class LanguageDialog {
  final BuildContext context;

  LanguageDialog({required this.context});

  Future<void> show() async {
    await showDialog(
      context: context,
      builder: (_) {
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.darkBackground,
            ),
            child: Scaffold(
              body: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    Words.changeLanguage.tr(),
                    style: AppTextStyles.style600.copyWith(
                      fontSize: 20,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _Item(
                    locale: context.supportedLocales[0],
                    title: Words.uz.tr(),
                  ),
                  _Item(
                    locale: context.supportedLocales[1],
                    title: Words.cyr.tr(),
                  ),
                  _Item(
                    locale: context.supportedLocales[2],
                    title: Words.ru.tr(),
                  ),
                  _Item(
                    locale: context.supportedLocales[3],
                    title: Words.en.tr(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  final Locale locale;
  final String title;

  const _Item({Key? key, required this.locale, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.setLocale(locale);
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (_) => const MainPage()),
          (route) => false,
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 9,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 0.5,
              color: AppColors.primary,
            )),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.style500.copyWith(
              color: context.locale == locale
                  ? AppColors.primary
                  : AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
