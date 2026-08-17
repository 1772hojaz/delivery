import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme_extension.dart';

enum MainTab { home, profile, cart, chat }

/// The floating rounded pill bottom navigation shared by Home / Profile /
/// Order-cart / Message screens. Presentation-only — callers decide what
/// happens on tap (usually `Get.offNamed(...)`), keeping this widget free
/// of a dependency on the routing layer.
class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.current,
    required this.onTap,
    this.cartCount = 0,
    this.hasChatNotification = false,
  });

  final MainTab current;
  final ValueChanged<MainTab> onTap;
  final int cartCount;
  final bool hasChatNotification;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Container(
      height: 74,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: ext.cardColor,
        borderRadius: BorderRadius.circular(22),
        boxShadow: ext.cardShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavItem(
            icon: Icons.home_rounded,
            label: 'Home',
            active: current == MainTab.home,
            onTap: () => onTap(MainTab.home),
          ),
          _NavItem(
            icon: Icons.person_rounded,
            label: 'Profile',
            active: current == MainTab.profile,
            onTap: () => onTap(MainTab.profile),
          ),
          _NavItem(
            icon: Icons.shopping_bag_rounded,
            label: 'Cart',
            active: current == MainTab.cart,
            badgeCount: cartCount,
            onTap: () => onTap(MainTab.cart),
          ),
          _NavItem(
            icon: Icons.chat_bubble_rounded,
            label: 'Chat',
            active: current == MainTab.chat,
            showDot: hasChatNotification,
            onTap: () => onTap(MainTab.chat),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
    this.badgeCount = 0,
    this.showDot = false,
  });

  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;
  final int badgeCount;
  final bool showDot;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                gradient: active ? AppColors.primaryGradient.scale(0.1) : null,
                color: active ? null : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 20,
                    color: active ? AppColors.primaryGreenDark : ext.mutedTextColor,
                  ),
                  if (active) ...[
                    const SizedBox(width: 8),
                    Text(label, style: AppTextStyles.bodyMedium(ext.headingColor)),
                  ],
                ],
              ),
            ),
            if (badgeCount > 0)
              Positioned(
                right: -2,
                top: -2,
                child: _Badge(text: '$badgeCount'),
              ),
            if (showDot)
              const Positioned(
                right: 2,
                top: 2,
                child: _Dot(),
              ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: AppColors.primaryGreenDark, shape: BoxShape.circle),
      child: Text(text, style: AppTextStyles.overline(Colors.white).copyWith(fontSize: 9)),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: const BoxDecoration(color: AppColors.error, shape: BoxShape.circle),
    );
  }
}

extension on LinearGradient {
  LinearGradient scale(double opacity) {
    return LinearGradient(
      begin: begin,
      end: end,
      colors: colors.map((c) => c.withValues(alpha: opacity)).toList(),
    );
  }
}
