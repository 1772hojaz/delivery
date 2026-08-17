import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/bottom_nav_bar.dart';
import '../../core/widgets/soft_card.dart';
import '../../routes/app_routes.dart';
import 'controller.dart';

class MessageView extends GetView<MessageController> {
  const MessageView({super.key});

  void _onNavTap(MainTab tab) {
    switch (tab) {
      case MainTab.home:
        Get.offNamed(Routes.home);
        break;
      case MainTab.profile:
        Get.offNamed(Routes.profile);
        break;
      case MainTab.cart:
        Get.offNamed(Routes.orderCart);
        break;
      case MainTab.chat:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Messages', style: AppTextStyles.h2(ext.headingColor)),
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreenDark.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        controller.hasUnread ? 'New' : 'All read',
                        style: AppTextStyles.captionBold(AppColors.primaryGreenDark),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.separated(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                  itemCount: controller.conversations.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    final item = controller.conversations[index];
                    final unread = item.unreadCount > 0;
                    return SoftCard(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      onTap: () => controller.openChat(item),
                      child: Row(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                radius: 27,
                                backgroundColor: item.avatarColor.withValues(alpha: 0.16),
                                child: Text(
                                  item.avatarInitial,
                                  style: AppTextStyles.bodyBold(item.avatarColor),
                                ),
                              ),
                              if (item.online)
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    height: 13,
                                    width: 13,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryGreenDark,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: ext.cardColor, width: 2),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.name, style: AppTextStyles.bodyBold(ext.headingColor)),
                                const SizedBox(height: 4),
                                Text(
                                  item.lastMessage,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: unread
                                      ? AppTextStyles.bodySmall(ext.headingColor)
                                      : AppTextStyles.bodySmall(ext.mutedTextColor),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(item.time, style: AppTextStyles.caption(ext.mutedTextColor)),
                              const SizedBox(height: 8),
                              if (unread)
                                Container(
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: AppColors.accentOrange,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '${item.unreadCount}',
                                    style: AppTextStyles.overline(Colors.white).copyWith(fontSize: 10),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: AppBottomNavBar(
                current: MainTab.chat,
                onTap: _onNavTap,
                hasChatNotification: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
