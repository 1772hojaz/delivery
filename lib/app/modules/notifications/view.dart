import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/soft_card.dart';
import 'controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: Row(
                children: [
                  AppBackButton(onPressed: () => Get.back()),
                  const SizedBox(width: 16),
                  Text('Notifications', style: AppTextStyles.h3(ext.headingColor)),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                  children: [
                    _SectionLabel(label: 'Today'),
                    const SizedBox(height: 12),
                    ...controller.today.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: _NotificationCard(item: item),
                      ),
                    ),
                    const SizedBox(height: 8),
                    _SectionLabel(label: 'Earlier'),
                    const SizedBox(height: 12),
                    ...controller.earlier.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: _NotificationCard(item: item),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Text(label, style: AppTextStyles.captionBold(ext.mutedTextColor));
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.item});
  final NotificationItem item;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return SoftCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 46,
            width: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: item.color.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(item.icon, color: item.color, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(item.title, style: AppTextStyles.bodyBold(ext.headingColor)),
                    ),
                    const SizedBox(width: 8),
                    Text(item.time, style: AppTextStyles.caption(ext.mutedTextColor)),
                  ],
                ),
                const SizedBox(height: 6),
                Text(item.message, style: AppTextStyles.bodySmall(ext.mutedTextColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
