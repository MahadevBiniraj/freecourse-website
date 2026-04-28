import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color background = Color(0xFF000000); // Back to Black
  static const Color surface = Color(0xFF111111);
  static const Color primary = Color(0xFF00FF85); // Neon Green
  static const Color secondary = Color(0xFF00FFCC); // Teal Green
  static const Color darkAccent = Color(0xFF0A1A1A); // Deep Dark Green/Black
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color grey = Color(0xFF333333);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppStyles {
  static BoxDecoration glassBox({
    double blur = 20,
    double opacity = 0.1,
    Color? borderColor,
    BorderRadius? borderRadius,
  }) {
    return BoxDecoration(
      color: Colors.white.withValues(alpha: opacity),
      borderRadius: borderRadius ?? BorderRadius.circular(24),
      border: Border.all(
        color: borderColor ?? Colors.white.withValues(alpha: 0.1),
        width: 1,
      ),
    );
  }

  static List<BoxShadow> glowEffect = [
    BoxShadow(
      color: AppColors.primary.withValues(alpha: 0.3),
      blurRadius: 30,
      spreadRadius: 5,
    )
  ];

  static List<BoxShadow> hoverShadow = [
    BoxShadow(
      color: AppColors.primary.withValues(alpha: 0.2),
      blurRadius: 40,
      offset: const Offset(0, 10),
    ),
  ];

  static List<BoxShadow> premiumShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.5),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
  ];
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme)
          .copyWith(
            displayLarge: GoogleFonts.inter(
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: AppColors.textPrimary,
              letterSpacing: -1.5,
            ),
            displayMedium: GoogleFonts.inter(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            bodyLarge: GoogleFonts.inter(
              fontSize: 18,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
            bodyMedium: GoogleFonts.inter(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Colors.white10),
        ),
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          textStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w900,
            fontSize: 16,
            letterSpacing: -0.2,
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
