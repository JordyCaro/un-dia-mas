import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:un_dia_mas/core/theme/app_colors.dart';

abstract final class AppTheme {
  static ThemeData get dark {
    final base = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accent,
        surface: AppColors.surface,
        onSurface: AppColors.primaryText,
      ),
      useMaterial3: true,
    );

    return base.copyWith(
      textTheme: GoogleFonts.crimsonProTextTheme(base.textTheme).apply(
        bodyColor: AppColors.primaryText,
        displayColor: AppColors.primaryText,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent.withValues(alpha: 0.2),
          foregroundColor: AppColors.accent,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: BorderSide(color: AppColors.accent.withValues(alpha: 0.4)),
          ),
        ),
      ),
    );
  }
}
