import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mulk_app/core/common/words.dart';
import 'package:mulk_app/core/utils/app_text_styles.dart';
import 'package:mulk_app/ui/widgets/language_item_widget.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Lottie.asset(
                "assets/lotties/splash.json",
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              Words.chooseLang.tr(),
              style: AppTextStyles.style600.copyWith(fontSize: 22),
            ),
            const SizedBox(height: 10),
            Text(
              Words.chooseLangDes.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyles.style600.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 40),
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
    );
  }
}
