import 'package:flutter/material.dart';

/// Design tokens extracted from the Pixel True "Food Delivery UI Kit" Figma file.
class AppColors {
  AppColors._();

  // Brand
  static const Color primaryGreenLight = Color(0xFF53E88B);
  static const Color primaryGreenDark = Color(0xFF15BE77);
  static const Color primaryGreen = Color(0xFF1FCC7D);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryGreenLight, primaryGreenDark],
  );

  // Accent
  static const Color accentOrange = Color(0xFFFF7C32);
  static const Color accentOrangeSoft = Color(0xFFF9A84D);
  static const Color accentAmber = Color(0xFFFEAD1D);

  // Neutrals - Light theme
  static const Color textDark = Color(0xFF09051C);
  static const Color textBody = Color(0xFF3B3B3B);
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSearchFill = Color(0xFFFEF6ED);
  static const Color cardShadowBlue = Color(0xFF5A6CEA);

  // Neutrals - Dark theme
  static const Color darkBackground = Color(0xFF0D0D0D);
  static const Color darkSurface = Color(0xFF252525);
  static const Color darkSearchFill = Color(0xFF1C1C1C);
  static const Color textLight = Color(0xFFFFFFFF);
  static const Color textLightMuted = Color(0xB3FFFFFF);

  static const Color success = primaryGreenDark;
  static const Color error = Color(0xFFFF4D4D);
  static const Color star = Color(0xFFFFC107);
}
