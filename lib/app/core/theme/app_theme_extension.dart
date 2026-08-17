import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Screen-level tokens that flip between light and dark but aren't covered
/// well by [ColorScheme] (soft card shadows, search field fill, muted text).
class AppThemeExt extends ThemeExtension<AppThemeExt> {
  const AppThemeExt({
    required this.cardColor,
    required this.searchFieldColor,
    required this.headingColor,
    required this.mutedTextColor,
    required this.cardShadow,
  });

  final Color cardColor;
  final Color searchFieldColor;
  final Color headingColor;
  final Color mutedTextColor;
  final List<BoxShadow> cardShadow;

  static const light = AppThemeExt(
    cardColor: AppColors.lightSurface,
    searchFieldColor: AppColors.lightSearchFill,
    headingColor: AppColors.textDark,
    mutedTextColor: Color(0x993B3B3B),
    cardShadow: [
      BoxShadow(color: Color(0x125A6CEA), offset: Offset(12, 26), blurRadius: 50),
    ],
  );

  static const dark = AppThemeExt(
    cardColor: AppColors.darkSurface,
    searchFieldColor: AppColors.darkSearchFill,
    headingColor: AppColors.textLight,
    mutedTextColor: Color(0x99FFFFFF),
    cardShadow: [
      BoxShadow(color: Color(0x40000000), offset: Offset(0, 10), blurRadius: 30),
    ],
  );

  @override
  AppThemeExt copyWith({
    Color? cardColor,
    Color? searchFieldColor,
    Color? headingColor,
    Color? mutedTextColor,
    List<BoxShadow>? cardShadow,
  }) {
    return AppThemeExt(
      cardColor: cardColor ?? this.cardColor,
      searchFieldColor: searchFieldColor ?? this.searchFieldColor,
      headingColor: headingColor ?? this.headingColor,
      mutedTextColor: mutedTextColor ?? this.mutedTextColor,
      cardShadow: cardShadow ?? this.cardShadow,
    );
  }

  @override
  AppThemeExt lerp(ThemeExtension<AppThemeExt>? other, double t) {
    if (other is! AppThemeExt) return this;
    return t < 0.5 ? this : other;
  }
}

extension AppThemeExtGetter on BuildContext {
  AppThemeExt get appColors => Theme.of(this).extension<AppThemeExt>()!;
}
