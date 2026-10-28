import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// One helper that creates every text style, always in the Inter font.
/// Example: AppText.inter(16, weight: FontWeight.w600)
class AppText {
  AppText._();

  static TextStyle inter(
    double size, {
    FontWeight weight = FontWeight.w400,
    Color color = AppColors.textPrimary,
    double? letterSpacing,
    double? height, // line height divided by font size (24px / 15px = 1.6)
  }) {
    return GoogleFonts.inter(
      fontSize: size,
      fontWeight: weight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }
}
