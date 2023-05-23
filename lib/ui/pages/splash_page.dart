import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mulk_app/ui/pages/main_page.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  afterSplash() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    });
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
            style: GoogleFonts.rubik(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 240),
        ],
      ),
    );
  }
}
