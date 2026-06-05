import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryGreen = Color(0xFF388E3C);
  static const Color darkGreen = Color(0xFF2E7D32);
  static const Color lightGreen = Color(0xFFC8E6C9);
  static const Color accentGreen = Color(0xFF4ADE80);
  static const Color accentOrange = Color(0xFFF97316);
  static const Color darkText = Color(0xFF212121);
  static const Color lightText = Color(0xFF6B7280);
  static const Color background = Color(0xFFE8F5E9);
  static const Color white = Color(0xFFFFFFFF);
  static const Color secondaryGreen = Color(0xFFC8E6C9);
  static const Color cardBg = Color(0xFFFFFFFF);

  static ThemeData get theme {
    final robotoSlab = GoogleFonts.robotoSlabTextTheme();
    final roboto = GoogleFonts.robotoTextTheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryGreen,
        primary: primaryGreen,
        secondary: darkGreen,
        surface: white,
        onSurface: darkText,
      ),
      scaffoldBackgroundColor: background,
      textTheme: GoogleFonts.robotoTextTheme(
        TextTheme(
          displayLarge: robotoSlab.displayLarge?.copyWith(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: darkText,
            height: 1.2,
          ),
          displayMedium: robotoSlab.displayMedium?.copyWith(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: darkText,
            height: 1.2,
          ),
          headlineLarge: robotoSlab.headlineLarge?.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: darkText,
          ),
          headlineMedium: robotoSlab.headlineMedium?.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: darkText,
          ),
          titleLarge: roboto.titleLarge?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: darkText,
          ),
          titleMedium: roboto.titleMedium?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: darkText,
          ),
          bodyLarge: roboto.bodyLarge?.copyWith(
            fontSize: 16,
            color: darkText,
            height: 1.6,
          ),
          bodyMedium: roboto.bodyMedium?.copyWith(
            fontSize: 16,
            color: darkText,
            height: 1.5,
          ),
          bodySmall: roboto.bodySmall?.copyWith(
            fontSize: 14,
            color: darkText,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGreen,
          foregroundColor: white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryGreen,
          side: const BorderSide(color: primaryGreen, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: cardBg,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
