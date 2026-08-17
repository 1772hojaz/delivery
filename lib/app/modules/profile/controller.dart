import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/widgets/bottom_nav_bar.dart';
import '../../routes/app_routes.dart';

/// A tappable row in the profile menu list.
class ProfileMenuEntry {
  const ProfileMenuEntry({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;
}

/// Controls the Profile screen — a bottom-nav root, so it owns the
/// collapsing identity header (avatar/name/email) plus the menu list.
class ProfileController extends GetxController {
  final scrollController = ScrollController();

  final userName = 'Audryashleen Chivanga';
  final userEmail = 'audryashleenchivanga@gmail.com';
  final avatarAsset = 'assets/images/profile/avatar.png';

  late final List<ProfileMenuEntry> menuEntries = [
    ProfileMenuEntry(
      icon: Icons.receipt_long_rounded,
      label: 'Your Orders',
      onTap: () => Get.toNamed(Routes.yourOrders),
    ),
    ProfileMenuEntry(
      icon: Icons.local_offer_rounded,
      label: 'Voucher & Promo',
      onTap: () => Get.toNamed(Routes.voucherPromo),
    ),
    ProfileMenuEntry(
      icon: Icons.credit_card_rounded,
      label: 'Payments',
      onTap: () => Get.toNamed(Routes.payments),
    ),
    ProfileMenuEntry(
      icon: Icons.location_on_rounded,
      label: 'Edit Location',
      onTap: () => Get.toNamed(Routes.editLocation),
    ),
    ProfileMenuEntry(
      icon: Icons.notifications_rounded,
      label: 'Notifications',
      onTap: () => Get.toNamed(Routes.notifications),
    ),
    ProfileMenuEntry(
      icon: Icons.logout_rounded,
      label: 'Log Out',
      isDestructive: true,
      onTap: confirmLogout,
    ),
  ];

  void onNavTap(MainTab tab) {
    switch (tab) {
      case MainTab.home:
        Get.offNamed(Routes.home);
        break;
      case MainTab.cart:
        Get.offNamed(Routes.orderCart);
        break;
      case MainTab.chat:
        Get.offNamed(Routes.message);
        break;
      case MainTab.profile:
        break;
    }
  }

  void confirmLogout() {
    Get.dialog(
      AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out of your account?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Get.offAllNamed(Routes.signIn),
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
