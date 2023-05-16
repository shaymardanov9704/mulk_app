import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mulk_app/core/translations/locale_keys.g.dart';
import 'package:quran/quran.dart' as quran;

class AyahWidget extends StatelessWidget {
  final int number;
  final Function() onTap;

  const AyahWidget({
    Key? key,
    required this.number,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                child: Text(
                  number == 0 ? quran.basmala : quran.getVerse(67, number),
                  textAlign: TextAlign.right,
                  maxLines: 5,
                  style: const TextStyle(
                    fontSize: 27,
                    fontFamily: 'Scheherazade',
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            child: Text(
              number == 0
                  ? LocaleKeys.basmala.tr()
                  : '  (67:$number) ${"ayah$number".tr()}',
              maxLines: 7,
              style: GoogleFonts.roboto(
                color: Colors.green.shade900,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.green.shade400,
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
