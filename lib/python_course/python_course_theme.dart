import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PythonCourseColors {
  static const Color background = Color(0xFF000000);
  static const Color surface = Color(0xFF0A0A0A);
  static const Color primary = Color(0xFF00FF88); // Neon Green
  static const Color accent = Color(0xFF00BFA5); // Cyan-ish accent
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF888888);
  static const Color border = Color(0xFF1A1A1A);
  static const Color cardGlow = Color(0x1A00FF88);
}

class PythonCourseFonts {
  static TextStyle heading(double size, {Color? color, FontWeight? weight, double? height}) {
    return GoogleFonts.spaceGrotesk(
      fontSize: size,
      color: color ?? PythonCourseColors.textPrimary,
      fontWeight: weight ?? FontWeight.w700,
      height: height,
      letterSpacing: -0.5,
    );
  }

  static TextStyle body(double size, {Color? color, FontWeight? weight, double? height}) {
    return GoogleFonts.inter(
      fontSize: size,
      color: color ?? PythonCourseColors.textSecondary,
      fontWeight: weight ?? FontWeight.w400,
      height: height,
    );
  }

  static TextStyle mono(double size, {Color? color, FontWeight? weight, double? height}) {
    return GoogleFonts.jetBrainsMono(
      fontSize: size,
      color: color ?? PythonCourseColors.primary,
      fontWeight: weight ?? FontWeight.w400,
      height: height,
    );
  }
}
