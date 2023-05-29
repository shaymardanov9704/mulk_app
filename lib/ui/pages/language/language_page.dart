import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mulk_app/core/common/words.dart';
import 'package:mulk_app/core/utils/app_colors.dart';
import 'package:mulk_app/core/utils/app_text_styles.dart';
import 'package:mulk_app/ui/pages/main/main_page.dart';
import 'bloc/language_bloc.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  final bloc = LanguageBloc();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
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
          );
        },
      ),
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

