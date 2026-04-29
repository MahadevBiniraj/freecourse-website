import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterCourseColors {
  static const Color background = Color(0xFF000000);
  static const Color surface = Color(0xFF111111);
  static const Color primary = Color(0xFF00FF85); // Neon Green
  static const Color secondary = Color(0xFF00FFCC); // Teal Green
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color darkAccent = Color(0xFF0A1A1A);
  
  // Flutter brand colors for specific logo/highlights if still needed, 
  // but theme will be Black/Green
  static const Color flutterBlue = Color(0xFF0553B1);
  static const Color skyBlue = Color(0xFF027DFD);
  static const Color teal = Color(0xFF13B9FD);
}

class FlutterCourseFonts {
  static TextStyle body(double size, {Color? color, FontWeight? weight, double? height}) {
    return GoogleFonts.dmSans(
      fontSize: size,
      color: color ?? FlutterCourseColors.textPrimary,
      fontWeight: weight ?? FontWeight.w400,
      height: height,
    );
  }

  static TextStyle label(double size, {Color? color, FontWeight? weight, double? height}) {
    return GoogleFonts.spaceMono(
      fontSize: size,
      color: color ?? FlutterCourseColors.primary,
      fontWeight: weight ?? FontWeight.w400,
      height: height,
    );
  }
}
