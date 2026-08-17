import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme_extension.dart';

/// The [-] qty [+] control used in cart / order-detail rows, with the "+" pill
/// always rendered in the primary green gradient.
class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    super.key,
    required this.quantity,
    required this.onIncrement,
    this.onDecrement,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback? onDecrement;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _StepButton(
          onTap: onDecrement,
          background: AppColors.primaryGreenDark.withValues(alpha: 0.12),
          child: Icon(Icons.remove_rounded, size: 16, color: AppColors.primaryGreenDark),
        ),
        SizedBox(
          width: 28,
          child: Text(
            '$quantity',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium(ext.headingColor),
          ),
        ),
        _StepButton(
          onTap: onIncrement,
          gradient: AppColors.primaryGradient,
          child: const Icon(Icons.add_rounded, size: 16, color: Colors.white),
        ),
      ],
    );
  }
}

class _StepButton extends StatelessWidget {
  const _StepButton({required this.child, this.onTap, this.background, this.gradient});

  final Widget child;
  final VoidCallback? onTap;
  final Color? background;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: gradient == null ? background : null,
      shape: const CircleBorder(),
      child: Ink(
        decoration: gradient != null ? BoxDecoration(gradient: gradient, shape: BoxShape.circle) : null,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: SizedBox(height: 28, width: 28, child: Center(child: child)),
        ),
      ),
    );
  }
}
