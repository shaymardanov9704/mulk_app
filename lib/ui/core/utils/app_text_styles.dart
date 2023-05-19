import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mulk_app/ui/core/utils/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static final TextStyle _style = GoogleFonts.poppins().copyWith(
    fontSize: 14,
    color: AppColors.black,
  );

  static TextStyle arabic = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    fontFamily: 'Scheherazade',
  );

  static final style500 = _style.copyWith(fontWeight: FontWeight.w500);
  static final style600 = _style.copyWith(fontWeight: FontWeight.w600);
  static final style700 = _style.copyWith(fontWeight: FontWeight.w700);
}
