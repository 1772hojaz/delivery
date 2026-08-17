import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/soft_card.dart';
import '../../routes/app_routes.dart';
import 'controller.dart';

/// "1.33 Payments" — saved payment methods with a selectable active state.
class PaymentsView extends GetView<PaymentsController> {
  const PaymentsView({super.key});

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
                  Text('Payments', style: AppTextStyles.h3(ext.headingColor)),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                children: [
                  for (final method in controller.methods) ...[
                    Obx(
                      () => _PaymentTile(
                        method: method,
                        selected: controller.selectedId.value == method.id,
                        onTap: () => controller.select(method.id),
                      ),
                    ),
                    const SizedBox(height: 14),
                  ],
                  const SizedBox(height: 4),
                  _AddNewButton(onTap: () => Get.toNamed(Routes.editPayment)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 4, 24, 12),
              child: PrimaryButton(
                label: 'Continue',
                onPressed: () => Get.toNamed(Routes.finishOrder),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentTile extends StatelessWidget {
  const _PaymentTile({required this.method, required this.selected, required this.onTap});

  final PaymentMethod method;
  final bool selected;
  final VoidCallback onTap;

  IconData get _icon => switch (method.icon) {
        IconIdentifier.visa => Icons.credit_card_rounded,
        IconIdentifier.mastercard => Icons.credit_card_rounded,
        IconIdentifier.paypal => Icons.account_balance_wallet_rounded,
        IconIdentifier.cash => Icons.payments_rounded,
      };

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return SoftCard(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      color: selected ? AppColors.primaryGreenDark.withValues(alpha: 0.08) : null,
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: AppColors.primaryGreenDark.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(_icon, color: AppColors.primaryGreenDark, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(method.label, style: AppTextStyles.bodyBold(ext.headingColor)),
                const SizedBox(height: 4),
                Text(method.subtitle, style: AppTextStyles.caption(ext.mutedTextColor)),
              ],
            ),
          ),
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? AppColors.primaryGreenDark : ext.mutedTextColor,
                width: 2,
              ),
              color: selected ? AppColors.primaryGreenDark : Colors.transparent,
            ),
            child: selected ? const Icon(Icons.check_rounded, color: Colors.white, size: 16) : null,
          ),
        ],
      ),
    );
  }
}

class _AddNewButton extends StatelessWidget {
  const _AddNewButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: DottedBorderBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add_rounded, color: AppColors.accentOrange, size: 20),
                const SizedBox(width: 8),
                Text('Add New Payment Method', style: AppTextStyles.bodyMedium(ext.headingColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Simple dashed-look container (real dashed painting is unnecessary here —
/// a translucent bordered box reads the same at this size) used for the
/// "Add New" affordance.
class DottedBorderBox extends StatelessWidget {
  const DottedBorderBox({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.accentOrange.withValues(alpha: 0.4), width: 1.4),
      ),
      child: child,
    );
  }
}
