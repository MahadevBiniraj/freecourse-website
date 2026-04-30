import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MarketingCourseColors {
  static const Color background = Color(0xFF000000); // Pure Black
  static const Color surface = Color(0xFF0A0A0A);
  static const Color primary = Color(0xFF00FF88); // Neon Green
  static const Color accent = Color(0xFF00E676);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF888888);
  static const Color border = Color(0xFF1A1A1A);
  static const Color glassBackground = Color(0x0DFFFFFF);
  static const Color glassBorder = Color(0x1AFFFFFF);
}

class MarketingCourseFonts {
  static TextStyle heading(double size, {Color? color, FontWeight? weight, double? height}) {
    return GoogleFonts.spaceGrotesk(
      fontSize: size,
      color: color ?? MarketingCourseColors.textPrimary,
      fontWeight: weight ?? FontWeight.w700,
      height: height,
      letterSpacing: -1.0,
    );
  }

  static TextStyle body(double size, {Color? color, FontWeight? weight, double? height}) {
    return GoogleFonts.inter(
      fontSize: size,
      color: color ?? MarketingCourseColors.textSecondary,
      fontWeight: weight ?? FontWeight.w400,
      height: height,
    );
  }

  static TextStyle display(double size, {Color? color, FontWeight? weight, double? height}) {
    return GoogleFonts.spaceGrotesk(
      fontSize: size,
      color: color ?? MarketingCourseColors.textPrimary,
      fontWeight: weight ?? FontWeight.w900,
      height: height,
      letterSpacing: -2.0,
    );
  }
}
