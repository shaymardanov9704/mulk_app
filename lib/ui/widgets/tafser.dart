import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mulk_app/core/common/words.dart';
import 'package:mulk_app/core/translations/locale_keys.g.dart';
import 'package:quran/quran.dart' as quran;
import 'package:mulk_app/core/utils/app_text_styles.dart';

class Tafser extends StatelessWidget {
  final int number;

  const Tafser({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mulk (67:$number) tafser"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            number == 0
                ? Center(
                    child: Text(
                      quran.basmala,
                      textAlign: TextAlign.right,
                      style: AppTextStyles.arabic.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  )
                : Text(
                    "  ${quran.getVerse(67, number)}",
                    textAlign: TextAlign.right,
                    style: AppTextStyles.arabic.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
            const SizedBox(height: 5),
            Text(
              number == 0
                  ? LocaleKeys.basmala.tr()
                  : '(67:$number) ${Words.ayah.tr(number)}',
              style: AppTextStyles.style600.copyWith(
                fontSize: 16,
                color: Colors.lightGreen,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              number == 0 ? LocaleKeys.first_t.tr() : Words.tafser.tr(number),
              style: AppTextStyles.style600.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
