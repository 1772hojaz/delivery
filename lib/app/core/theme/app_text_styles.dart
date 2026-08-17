import 'package:flutter/material.dart';

/// The Figma file uses the licensed "BentonSans" family (Bold / Medium / Book / Regular).
/// We substitute the closest-matching open font — Plus Jakarta Sans — which shares
/// BentonSans' geometric grotesque proportions and full weight range. Bundled locally
/// (assets/fonts) so the app works fully offline instead of fetching at runtime.
class AppTextStyles {
  AppTextStyles._();

  static const _family = 'PlusJakartaSans';

  static TextStyle _base({
    required double size,
    required FontWeight weight,
    required Color color,
    double? height,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: _family,
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // Display / headline
  static TextStyle h1(Color color) => _base(size: 31, weight: FontWeight.w800, color: color, height: 1.2);
  static TextStyle h2(Color color) => _base(size: 24, weight: FontWeight.w800, color: color, height: 1.25);
  static TextStyle h3(Color color) => _base(size: 20, weight: FontWeight.w700, color: color, height: 1.3);
  static TextStyle h4(Color color) => _base(size: 17, weight: FontWeight.w700, color: color, height: 1.31);

  // Body
  static TextStyle bodyBold(Color color) => _base(size: 16, weight: FontWeight.w700, color: color, height: 1.31);
  static TextStyle bodyMedium(Color color) => _base(size: 15, weight: FontWeight.w600, color: color, height: 1.31);
  static TextStyle bodyRegular(Color color) => _base(size: 14, weight: FontWeight.w400, color: color, height: 1.31);
  static TextStyle bodySmall(Color color) => _base(size: 13, weight: FontWeight.w400, color: color, height: 1.31);

  // Caption / labels
  static TextStyle caption(Color color) =>
      _base(size: 12, weight: FontWeight.w400, color: color, height: 1.31, letterSpacing: 0.5);
  static TextStyle captionBold(Color color) => _base(size: 12, weight: FontWeight.w700, color: color, height: 1.31);
  static TextStyle overline(Color color) =>
      _base(size: 10, weight: FontWeight.w700, color: color, height: 1.31, letterSpacing: 0.5);

  // Brand logo wordmark ("FoodNinja")
  static TextStyle logo(Color color) => TextStyle(
        fontFamily: 'Baloo2',
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: color,
      );

  static TextStyle price(Color color) => _base(size: 22, weight: FontWeight.w800, color: color, height: 1.31);
}
