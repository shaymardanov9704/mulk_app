import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mulk_app/di.dart';
import 'package:mulk_app/ui/pages/language/language_page.dart';
import 'bloc/splash_bloc.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:mulk_app/core/common/words.dart';
import 'package:mulk_app/core/utils/app_text_styles.dart';
import 'package:mulk_app/ui/pages/main/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final bloc = SplashBloc(di.get());

  afterSplash() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      },
    );
  }

  @override
  void initState() {
    bloc.add(SplashEvent.init());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.firstTime) {
            Future.delayed(
              const Duration(seconds: 3),
              () {
                Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(builder: (_) => const LanguagePage()),
                  (route) => false,
                );
              },
            );
          } else {
            Future.delayed(
              const Duration(seconds: 3),
              () {
                Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(builder: (_) => const MainPage()),
                  (route) => false,
                );
              },
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Lottie.asset(
                    "assets/lotties/splash.json",
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  Words.title.tr(),
                  style: AppTextStyles.arabic.copyWith(fontSize: 45),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
