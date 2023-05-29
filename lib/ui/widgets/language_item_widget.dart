import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulk_app/core/utils/app_colors.dart';
import 'package:mulk_app/core/utils/app_text_styles.dart';
import 'package:mulk_app/provider/theme_provider.dart';
import 'package:mulk_app/ui/pages/main/main_page.dart';
import 'package:provider/provider.dart';

class LanguageItemWidget extends StatelessWidget {
  final Locale locale;
  final String title;

  const LanguageItemWidget({
    Key? key,
    required this.locale,
    required this.title,
  }) : super(key: key);

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
              color: Provider.of<ThemeProvider>(context).isDark
                  ? context.locale == locale
                      ? AppColors.primary
                      : AppColors.white
                  : context.locale == locale
                      ? AppColors.primary
                      : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
