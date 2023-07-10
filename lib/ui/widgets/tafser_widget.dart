import 'package:flutter/material.dart';
import 'package:mulk_app/core/common/words.dart';
import 'package:mulk_app/core/utils/app_colors.dart';
import 'package:mulk_app/core/utils/app_text_styles.dart';
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
              ? Center(
                  child: Text(
                    quran.basmala,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.arabic,
                  ),
                )
              : Text(
                  quran.getVerse(67, number),
                  textAlign: TextAlign.right,
                  style: AppTextStyles.arabic,
                ),
          const SizedBox(height: 5),
          Text(
            number == 0
                ? Words.basmala.tr()
                : '(67:$number) ${Words.ayah.tr(number)}',
            style: AppTextStyles.style600.copyWith(
              fontSize: 17,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            number == 0 ? Words.firstTafser.tr() : Words.tafser.tr(number),
            style: AppTextStyles.style600.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
