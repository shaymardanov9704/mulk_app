import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mulk_app/ui/core/utils/app_text_styles.dart';
import 'package:mulk_app/ui/pages/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
    // TODO: implement initState
    super.initState();
    afterSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 200),
          const Image(
            image: AssetImage('assets/images/mulk_logo.png'),
          ),
          Text(
            'Al-Mulk',
            style: AppTextStyles.style700.copyWith(fontSize: 24),
          ),
          const SizedBox(height: 240),
        ],
      ),
    );
  }
}
