import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/quantity_stepper.dart';
import '../../core/widgets/soft_card.dart';
import '../../routes/app_routes.dart';
import 'controller.dart';

/// "1.31 Order details" — read-only order summary (no delete affordance),
/// wired to the same shared [CartController] as Order Cart for consistency.
class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({super.key});

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
                children: [
                  AppBackButton(onPressed: () => Get.back()),
                  const SizedBox(width: 16),
                  Text('Order Details', style: AppTextStyles.h3(ext.headingColor)),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                final items = controller.cart.items;
                if (items.isEmpty) {
                  return Center(
                    child: Text('No items in your order yet', style: AppTextStyles.bodyMedium(ext.mutedTextColor)),
                  );
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              gradient: AppColors.primaryGradient,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(Icons.restaurant_rounded, color: Colors.white, size: 26),
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
                          Obx(
                            () => QuantityStepper(
                              quantity: item.quantity.value,
                              onIncrement: () => controller.cart.increment(item.id),
                              onDecrement: () => controller.cart.decrement(item.id),
                            ),
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
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: const [
                          BoxShadow(color: Color(0x4015BE77), offset: Offset(0, 14), blurRadius: 30),
                        ],
                      ),
                      child: Column(
                        children: [
                          _GreenSummaryRow(label: 'Sub-Total', value: cart.subtotal),
                          const SizedBox(height: 10),
                          _GreenSummaryRow(label: 'Delivery Charge', value: cart.deliveryCharge),
                          const SizedBox(height: 10),
                          _GreenSummaryRow(label: 'Discount', value: -cart.discount),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Divider(height: 1, color: Colors.white38),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total', style: AppTextStyles.bodyBold(Colors.white)),
                              Text('\$${cart.total.toStringAsFixed(2)}', style: AppTextStyles.h4(Colors.white)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    PrimaryButton(
                      label: 'Place My Order',
                      onPressed: cart.items.isEmpty ? null : () => Get.toNamed(Routes.payments),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _GreenSummaryRow extends StatelessWidget {
  const _GreenSummaryRow({required this.label, required this.value});

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.bodyRegular(Colors.white70)),
        Text(
          '${value < 0 ? '-' : ''}\$${value.abs().toStringAsFixed(2)}',
          style: AppTextStyles.bodyMedium(Colors.white),
        ),
      ],
    );
  }
}
