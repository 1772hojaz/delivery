import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/soft_card.dart';
import '../../routes/app_routes.dart';
import 'controller.dart';

/// "1.36 Your Orders" — order history with Active / Completed tabs.
class YourOrdersView extends GetView<YourOrdersController> {
  const YourOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 8),
              child: Row(
                children: [
                  AppBackButton(onPressed: () => Get.back()),
                  const SizedBox(width: 16),
                  Text('Your Orders', style: AppTextStyles.h3(ext.headingColor)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 4),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: ext.searchFieldColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TabBar(
                  controller: controller.tabController,
                  indicator: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  splashBorderRadius: BorderRadius.circular(12),
                  labelColor: Colors.white,
                  unselectedLabelColor: ext.mutedTextColor,
                  labelStyle: AppTextStyles.bodyMedium(Colors.white),
                  unselectedLabelStyle: AppTextStyles.bodyMedium(ext.mutedTextColor),
                  tabs: const [Tab(text: 'Active'), Tab(text: 'Completed')],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  _OrderList(
                    orders: controller.activeOrders,
                    emptyLabel: 'No active orders',
                    onTapOrder: (order) => Get.toNamed(Routes.trackOrder),
                  ),
                  _OrderList(
                    orders: controller.completedOrders,
                    emptyLabel: 'No completed orders yet',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderList extends StatelessWidget {
  const _OrderList({required this.orders, required this.emptyLabel, this.onTapOrder});

  final List<OrderHistoryItem> orders;
  final String emptyLabel;
  final ValueChanged<OrderHistoryItem>? onTapOrder;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    if (orders.isEmpty) {
      return Center(child: Text(emptyLabel, style: AppTextStyles.bodyMedium(ext.mutedTextColor)));
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
      itemCount: orders.length,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (_, i) {
        final order = orders[i];
        return SoftCard(
          padding: const EdgeInsets.all(16),
          onTap: onTapOrder == null ? null : () => onTapOrder!(order),
          child: Row(
            children: [
              Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  color: (order.active ? AppColors.primaryGreenDark : ext.mutedTextColor).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  order.active ? Icons.delivery_dining_rounded : Icons.check_circle_rounded,
                  color: order.active ? AppColors.primaryGreenDark : ext.mutedTextColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.restaurant, style: AppTextStyles.bodyBold(ext.headingColor)),
                    const SizedBox(height: 4),
                    Text(order.items, style: AppTextStyles.caption(ext.mutedTextColor)),
                    const SizedBox(height: 4),
                    Text(order.date, style: AppTextStyles.caption(ext.mutedTextColor)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('\$${order.total.toStringAsFixed(2)}', style: AppTextStyles.bodyBold(AppColors.primaryGreenDark)),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: (order.active ? AppColors.primaryGreenDark : ext.mutedTextColor).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      order.active ? 'Active' : 'Completed',
                      style: AppTextStyles.overline(order.active ? AppColors.primaryGreenDark : ext.mutedTextColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
