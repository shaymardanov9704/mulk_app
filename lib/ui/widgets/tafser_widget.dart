import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mulk_app/ui/core/translations/locale_keys.g.dart';
import 'package:quran/quran.dart' as quran;

class TafseerWidget extends StatelessWidget {
  final int number;

  const TafseerWidget({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          number == 0
              ? const Center(
                  child: Text(
                    quran.basmala,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Scheherazade',
                    ),
                  ),
                )
              : Text(
                  "  ${quran.getVerse(67, number)}",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Scheherazade',
                  ),
                ),
          const SizedBox(height: 5),
          Text(
            number == 0
                ? LocaleKeys.basmala.tr()
                : '(67:$number) ${"ayah$number".tr()}',
            style: GoogleFonts.roboto(
                color: Colors.lightGreen.shade900,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            number == 0 ? LocaleKeys.first_t.tr() : "tafser$number".tr(),
            style: GoogleFonts.roboto(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
