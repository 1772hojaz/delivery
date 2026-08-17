import 'package:flutter/material.dart';
import '../theme/app_theme_extension.dart';

/// White/dark rounded card with the soft bluish drop shadow used throughout
/// the kit for menu items, restaurant tiles and list rows.
class SoftCard extends StatelessWidget {
  const SoftCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 22,
    this.onTap,
    this.color,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Container(
      decoration: BoxDecoration(
        color: color ?? ext.cardColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: ext.cardShadow,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onTap,
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}
