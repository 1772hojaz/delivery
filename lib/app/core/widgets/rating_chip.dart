import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme_extension.dart';

/// Small star + value chip ("4.8 Rating") seen on restaurant/product detail headers.
class RatingChip extends StatelessWidget {
  const RatingChip({super.key, required this.rating, this.label = 'Rating'});

  final double rating;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star_rounded, color: AppColors.star, size: 18),
        const SizedBox(width: 6),
        Text('$rating $label', style: AppTextStyles.bodySmall(ext.mutedTextColor)),
      ],
    );
  }
}

/// Rounded pill badge ("Popular") shown above product/restaurant hero images.
class StatusPill extends StatelessWidget {
  const StatusPill({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryGreenDark.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: AppTextStyles.bodySmall(AppColors.primaryGreenDark)),
    );
  }
}
