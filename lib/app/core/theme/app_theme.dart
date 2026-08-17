import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'app_theme_extension.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.lightBackground,
        textTheme: GoogleFonts.plusJakartaSansTextTheme(),
        colorScheme: const ColorScheme.light(
          primary: AppColors.primaryGreenDark,
          secondary: AppColors.accentOrange,
          surface: AppColors.lightSurface,
          error: AppColors.error,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          iconTheme: IconThemeData(color: AppColors.textDark),
        ),
        extensions: const [AppThemeExt.light],
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBackground,
        textTheme: GoogleFonts.plusJakartaSansTextTheme(ThemeData(brightness: Brightness.dark).textTheme),
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primaryGreenLight,
          secondary: AppColors.accentOrange,
          surface: AppColors.darkSurface,
          error: AppColors.error,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          iconTheme: IconThemeData(color: AppColors.textLight),
        ),
        extensions: const [AppThemeExt.dark],
      );
}
