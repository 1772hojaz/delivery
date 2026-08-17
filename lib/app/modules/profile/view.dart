import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/controllers/cart_controller.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/bottom_nav_bar.dart';
import '../../core/widgets/soft_card.dart';
import '../../routes/app_routes.dart';
import 'controller.dart';

/// Profile screen — a bottom-nav root ("1.43 Profile" / "1.44 Profile
/// Scroll Mode"). Same collapsing-header treatment as the restaurant/dish
/// detail screens: the avatar/name/email identity block collapses into a
/// compact "Profile" bar on scroll.
class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final pageBg = isDark ? AppColors.darkBackground : AppColors.lightBackground;

    return Scaffold(
      backgroundColor: pageBg,
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 258,
            backgroundColor: pageBg,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16, top: 8),
                child: SoftIconButton(
                  icon: Icons.notifications_rounded,
                  onPressed: () => Get.toNamed(Routes.notifications),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.only(bottom: 18),
              title: Text('Profile', style: AppTextStyles.h4(ext.headingColor)),
              background: Container(
                decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          controller.avatarAsset,
                          height: 88,
                          width: 88,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(controller.userName, style: AppTextStyles.h3(Colors.white)),
                      const SizedBox(height: 4),
                      Text(
                        controller.userEmail,
                        style: AppTextStyles.bodySmall(Colors.white.withValues(alpha: 0.85)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: Column(
                children: [
                  for (final entry in controller.menuEntries) ...[
                    _ProfileMenuRow(entry: entry),
                    const SizedBox(height: 12),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 12),
          child: Obx(
            () => AppBottomNavBar(
              current: MainTab.profile,
              cartCount: CartController.to.itemCount,
              onTap: controller.onNavTap,
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileMenuRow extends StatelessWidget {
  const _ProfileMenuRow({required this.entry});

  final ProfileMenuEntry entry;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    final tint = entry.isDestructive ? AppColors.error : AppColors.primaryGreenDark;
    return SoftCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      onTap: entry.onTap,
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(color: tint.withValues(alpha: 0.12), shape: BoxShape.circle),
            child: Icon(entry.icon, size: 20, color: tint),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              entry.label,
              style: AppTextStyles.bodyMedium(entry.isDestructive ? AppColors.error : ext.headingColor),
            ),
          ),
          Icon(Icons.chevron_right_rounded, color: ext.mutedTextColor),
        ],
      ),
    );
  }
}
