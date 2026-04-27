import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color background = Color(0xFF000000);
  static const Color surface = Color(0xFF111111);
  static const Color primary = Color(0xFF00FF85); // Neon Green
  static const Color accent = Color(0xFF1A2B4C); // Deep Blue Glow
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFE0E0E0);
  static const Color grey = Color(0xFF777777);

  // Neon Palette
  static const Color neonPurple = Color(0xFFBF5AF2);
  static const Color neonBlue = Color(0xFF0A84FF);
  static const Color neonTeal = Color(0xFF64D2FF);
  static const Color neonYellow = Color(0xFFFFD60A);
  static const Color neonPink = Color(0xFFFF375F);

  static const LinearGradient neonGradient = LinearGradient(
    colors: [primary, Color(0xFF00FFCC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glowGradient = LinearGradient(
    colors: [Color(0xFF1A2B4C), Colors.transparent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppStyles {
  static BoxDecoration glassBox({
    double blur = 20,
    double opacity = 0.05,
    Color? borderColor,
    BorderRadius? borderRadius,
  }) {
    return BoxDecoration(
      color: Colors.white.withValues(alpha: opacity),
      borderRadius: borderRadius ?? BorderRadius.circular(24),
      border: Border.all(
        color: borderColor ?? Colors.white.withValues(alpha: 0.08),
        width: 1,
      ),
    );
  }

  static List<BoxShadow> neonGlow(Color color, {double opacity = 0.15}) {
    return [
      BoxShadow(
        color: color.withValues(alpha: opacity),
        blurRadius: 40,
        spreadRadius: -10,
        offset: const Offset(0, 10),
      ),
      BoxShadow(
        color: color.withValues(alpha: opacity * 0.5),
        blurRadius: 20,
        spreadRadius: -5,
      ),
    ];
  }

  static List<BoxShadow> premiumShadow = [
    BoxShadow(
      color: AppColors.primary.withValues(alpha: 0.2),
      blurRadius: 40,
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
        secondary: AppColors.accent,
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
