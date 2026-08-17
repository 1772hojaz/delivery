import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_theme_extension.dart';

class AppTheme {
  AppTheme._();

  static const _fontFamily = 'PlusJakartaSans';

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.lightBackground,
        fontFamily: _fontFamily,
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
        fontFamily: _fontFamily,
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
