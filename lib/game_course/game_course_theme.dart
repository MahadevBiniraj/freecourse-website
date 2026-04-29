import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameCourseColors {
  static const Color background = Color(0xFF000000);
  static const Color surface = Color(0xFF111111);
  static const Color primary = Color(0xFF00FF88); // Neon Green
  static const Color secondary = Color(0xFF00FFCC); // Teal Green
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);
  
  static const LinearGradient neonGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class GameCourseStyles {
  static BoxDecoration glassBox({double opacity = 0.05, double blur = 20, Color? borderColor}) {
    return BoxDecoration(
      color: Colors.white.withValues(alpha: opacity),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: borderColor ?? Colors.white.withValues(alpha: 0.1), width: 1),
    );
  }
}

class GameCourseFonts {
  static TextStyle body(double size, {Color? color, FontWeight? weight, double? height}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: size,
      color: color ?? GameCourseColors.textPrimary,
      fontWeight: weight ?? FontWeight.w400,
      height: height,
    );
  }

  static TextStyle heading(double size, {Color? color, FontWeight? weight, double? height}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: size,
      color: color ?? GameCourseColors.textPrimary,
      fontWeight: weight ?? FontWeight.w900,
      height: height,
      letterSpacing: -1,
    );
  }

  static TextStyle mono(double size, {Color? color, FontWeight? weight}) {
    return GoogleFonts.firaCode(
      fontSize: size,
      color: color ?? GameCourseColors.primary,
      fontWeight: weight ?? FontWeight.w400,
    );
  }
}
