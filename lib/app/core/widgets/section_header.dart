import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme_extension.dart';

/// "Nearest Restaurant  ·  View More" style row heading used across list screens.
class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.actionLabel, this.onActionTap});

  final String title;
  final String? actionLabel;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.bodyBold(ext.headingColor)),
        if (actionLabel != null)
          GestureDetector(
            onTap: onActionTap,
            child: Text(actionLabel!, style: AppTextStyles.caption(AppColors.accentOrange)),
          ),
      ],
    );
  }
}
