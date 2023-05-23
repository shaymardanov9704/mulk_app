import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static final TextStyle _style = GoogleFonts.roboto().copyWith(fontSize: 14,letterSpacing: 1.5);

  static TextStyle arabic = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    fontFamily: 'Scheherazade',
  );

  static final style500 = _style.copyWith(fontWeight: FontWeight.w500,letterSpacing: 1.5);
  static final style600 = _style.copyWith(fontWeight: FontWeight.w600,letterSpacing: 1.5);
  static final style700 = _style.copyWith(fontWeight: FontWeight.w700,letterSpacing: 1.5);
}
