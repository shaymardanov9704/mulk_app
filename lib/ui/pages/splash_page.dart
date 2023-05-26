import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mulk_app/core/common/words.dart';
import 'package:mulk_app/core/utils/app_text_styles.dart';
import 'package:mulk_app/ui/pages/main/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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
    super.initState();
    afterSplash();
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
