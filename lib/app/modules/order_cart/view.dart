import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/bottom_nav_bar.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/quantity_stepper.dart';
import '../../core/widgets/soft_card.dart';
import '../../routes/app_routes.dart';
import 'controller.dart';

/// "1.32 Order Details With Trash" — the real shopping-cart screen, wired to
/// the shared [CartController] so quantity changes and totals are live.
class OrderCartView extends GetView<OrderCartController> {
  const OrderCartView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('My Cart', style: AppTextStyles.h2(ext.headingColor)),
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreenDark.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${controller.cart.itemCount} items',
                        style: AppTextStyles.captionBold(AppColors.primaryGreenDark),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                final items = controller.cart.items;
                if (items.isEmpty) {
                  return _EmptyCart(headingColor: ext.headingColor, mutedColor: ext.mutedTextColor);
                }
                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (_, i) {
                    final item = items[i];
                    return SoftCard(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(
                              gradient: AppColors.primaryGradient,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(Icons.restaurant_rounded, color: Colors.white, size: 28),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.name, style: AppTextStyles.bodyBold(ext.headingColor)),
                                const SizedBox(height: 4),
                                Text(item.subtitle, style: AppTextStyles.caption(ext.mutedTextColor)),
                                const SizedBox(height: 8),
                                Text(
                                  '\$${item.price.toStringAsFixed(2)}',
                                  style: AppTextStyles.bodyBold(AppColors.primaryGreenDark),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () => controller.cart.removeItem(item.id),
                                child: const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(Icons.delete_outline_rounded, color: AppColors.error, size: 22),
                                ),
                              ),
                              const SizedBox(height: 18),
                              Obx(
                                () => QuantityStepper(
                                  quantity: item.quantity.value,
                                  onIncrement: () => controller.cart.increment(item.id),
                                  onDecrement: () => controller.cart.decrement(item.id),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
            Obx(() {
              final cart = controller.cart;
              return Padding(
                padding: const EdgeInsets.fromLTRB(24, 4, 24, 12),
                child: SoftCard(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _SummaryRow(label: 'Sub-Total', value: cart.subtotal, mutedColor: ext.mutedTextColor, headingColor: ext.headingColor),
                      const SizedBox(height: 10),
                      _SummaryRow(label: 'Delivery Charge', value: cart.deliveryCharge, mutedColor: ext.mutedTextColor, headingColor: ext.headingColor),
                      const SizedBox(height: 10),
                      _SummaryRow(label: 'Discount', value: -cart.discount, mutedColor: ext.mutedTextColor, headingColor: ext.headingColor),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(height: 1)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total', style: AppTextStyles.bodyBold(ext.headingColor)),
                          Text('\$${cart.total.toStringAsFixed(2)}', style: AppTextStyles.price(AppColors.primaryGreenDark)),
                        ],
                      ),
                      const SizedBox(height: 18),
                      PrimaryButton(
                        label: 'Place My Order',
                        onPressed: cart.items.isEmpty ? null : () => Get.toNamed(Routes.payments),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
        child: Obx(
          () => AppBottomNavBar(
            current: MainTab.cart,
            cartCount: controller.cart.itemCount,
            onTap: (tab) {
              switch (tab) {
                case MainTab.home:
                  Get.offNamed(Routes.home);
                  break;
                case MainTab.profile:
                  Get.offNamed(Routes.profile);
                  break;
                case MainTab.cart:
                  break;
                case MainTab.chat:
                  Get.offNamed(Routes.message);
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.label, required this.value, required this.mutedColor, required this.headingColor});

  final String label;
  final double value;
  final Color mutedColor;
  final Color headingColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.bodyRegular(mutedColor)),
        Text(
          '${value < 0 ? '-' : ''}\$${value.abs().toStringAsFixed(2)}',
          style: AppTextStyles.bodyMedium(headingColor),
        ),
      ],
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart({required this.headingColor, required this.mutedColor});

  final Color headingColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 84,
            width: 84,
            decoration: BoxDecoration(
              color: AppColors.primaryGreenDark.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.shopping_bag_outlined, color: AppColors.primaryGreenDark, size: 36),
          ),
          const SizedBox(height: 18),
          Text('Your cart is empty', style: AppTextStyles.h4(headingColor)),
          const SizedBox(height: 6),
          Text('Add items from a restaurant to get started', style: AppTextStyles.bodySmall(mutedColor)),
        ],
      ),
    );
  }
}
