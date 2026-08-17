import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme_extension.dart';

/// The rounded-square orange back chevron used at the top of most detail screens.
class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onPressed, this.color});

  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: (color ?? AppColors.accentOrangeSoft).withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onPressed ?? () => Navigator.of(context).maybePop(),
        child: SizedBox(
          height: 44,
          width: 44,
          child: Icon(Icons.chevron_left_rounded, color: color ?? AppColors.accentOrange, size: 26),
        ),
      ),
    );
  }
}

/// The soft rounded icon-button used for favorite/notification/settings glyphs
/// floating over hero images (white/translucent circle with a subtle shadow).
class SoftIconButton extends StatelessWidget {
  const SoftIconButton({super.key, required this.icon, this.onPressed, this.color, this.background});

  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    final bg = background ?? context.appColors.cardColor;
    return Material(
      color: bg,
      shape: const CircleBorder(),
      elevation: 0,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: SizedBox(
          height: 44,
          width: 44,
          child: Icon(icon, color: color ?? AppColors.textDark, size: 20),
        ),
      ),
    );
  }
}
