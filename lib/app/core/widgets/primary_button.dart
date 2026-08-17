import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// The green pill CTA used across the kit ("Create Account", "Place My Order", ...).
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.height = 58,
    this.icon,
    this.loading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final double height;
  final Widget? icon;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(height / 2),
          boxShadow: const [
            BoxShadow(color: Color(0x4015BE77), offset: Offset(6, 10), blurRadius: 20),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(height / 2),
            onTap: loading ? null : onPressed,
            child: Center(
              child: loading
                  ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (icon != null) ...[icon!, const SizedBox(width: 10)],
                        Text(label, style: AppTextStyles.bodyBold(Colors.white)),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Small white pill button used inside the promo banner ("Buy Now").
class GhostPillButton extends StatelessWidget {
  const GhostPillButton({super.key, required this.label, this.onPressed, this.textColor});

  final String label;
  final VoidCallback? onPressed;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            label,
            style: AppTextStyles.overline(textColor ?? AppColors.primaryGreenDark).copyWith(fontSize: 10),
          ),
        ),
      ),
    );
  }
}
