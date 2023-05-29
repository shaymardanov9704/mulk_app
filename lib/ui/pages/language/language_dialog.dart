import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulk_app/core/common/words.dart';
import 'package:mulk_app/core/utils/app_colors.dart';
import 'package:mulk_app/core/utils/app_text_styles.dart';
import 'package:mulk_app/provider/theme_provider.dart';
import 'package:mulk_app/ui/widgets/language_item_widget.dart';
import 'package:provider/provider.dart';

class LanguageDialog {
  final BuildContext context;

  LanguageDialog({required this.context});

  Future<void> show() async {
    await showDialog(
      context: context,
      builder: (_) {
        return Builder(builder: (context) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Provider.of<ThemeProvider>(context).isDark
                      ? AppColors.darkBackground
                      : AppColors.lightBackground),
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
                    LanguageItemWidget(
                      locale: context.supportedLocales[0],
                      title: Words.uz.tr(),
                    ),
                    LanguageItemWidget(
                      locale: context.supportedLocales[1],
                      title: Words.cyr.tr(),
                    ),
                    LanguageItemWidget(
                      locale: context.supportedLocales[2],
                      title: Words.ru.tr(),
                    ),
                    LanguageItemWidget(
                      locale: context.supportedLocales[3],
                      title: Words.en.tr(),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
