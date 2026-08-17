import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/primary_button.dart';
import 'controller.dart';

/// "1.7 Payment Method" — add a card / choose a payment method during
/// onboarding so first checkout is friction-free.
class PaymentMethodSetupView extends GetView<PaymentMethodSetupController> {
  const PaymentMethodSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              AppBackButton(onPressed: () => Get.back()),
              const SizedBox(height: 28),
              Text('Set Up Payment Method', style: AppTextStyles.h1(ext.headingColor)),
              const SizedBox(height: 14),
              Text(
                'Add a card so paying for your orders is quick and secure',
                style: AppTextStyles.bodySmall(ext.mutedTextColor),
              ),
              const SizedBox(height: 28),
              _CardPreview(controller: controller),
              const SizedBox(height: 28),
              Row(
                children: [
                  _OptionChip(
                    label: 'Card',
                    icon: Icons.credit_card_rounded,
                    option: PaymentOption.card,
                    controller: controller,
                  ),
                  const SizedBox(width: 12),
                  _OptionChip(
                    label: 'Wallet',
                    icon: Icons.account_balance_wallet_rounded,
                    option: PaymentOption.wallet,
                    controller: controller,
                  ),
                  const SizedBox(width: 12),
                  _OptionChip(
                    label: 'Cash',
                    icon: Icons.payments_rounded,
                    option: PaymentOption.cash,
                    controller: controller,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Obx(
                () => controller.selectedOption.value == PaymentOption.card
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _FieldLabel('Card Number'),
                          _Field(controller: controller.cardNumberController, hint: '1234 5678 9012 3456', keyboardType: TextInputType.number),
                          const SizedBox(height: 16),
                          _FieldLabel('Card Holder Name'),
                          _Field(controller: controller.cardHolderController, hint: 'Full name on card'),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _FieldLabel('Expiry'),
                                    _Field(controller: controller.expiryController, hint: 'MM/YY'),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _FieldLabel('CVV'),
                                    _Field(
                                      controller: controller.cvvController,
                                      hint: '•••',
                                      keyboardType: TextInputType.number,
                                      obscure: true,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          controller.selectedOption.value == PaymentOption.wallet
                              ? 'You\'ll link a digital wallet from your profile later.'
                              : 'You\'ll pay the rider directly with cash on delivery.',
                          style: AppTextStyles.bodySmall(ext.mutedTextColor),
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: controller.onSkip,
                  child: Text('Skip for now', style: AppTextStyles.bodyMedium(ext.mutedTextColor)),
                ),
              ),
              const SizedBox(height: 8),
              PrimaryButton(label: 'Continue', onPressed: controller.onContinue),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardPreview extends StatelessWidget {
  const _CardPreview({required this.controller});

  final PaymentMethodSetupController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(color: Color(0x4015BE77), offset: Offset(6, 14), blurRadius: 26),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const Icon(Icons.wifi_rounded, color: Colors.white, size: 22),
            ],
          ),
          const Spacer(),
          Obx(() => Text(controller.cardNumberPreview.value, style: AppTextStyles.bodyBold(Colors.white).copyWith(letterSpacing: 2))),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  controller.cardHolderPreview.value.toUpperCase(),
                  style: AppTextStyles.caption(Colors.white.withValues(alpha: 0.9)),
                ),
              ),
              Obx(() => Text(controller.expiryPreview.value, style: AppTextStyles.caption(Colors.white.withValues(alpha: 0.9)))),
            ],
          ),
        ],
      ),
    );
  }
}

class _OptionChip extends StatelessWidget {
  const _OptionChip({required this.label, required this.icon, required this.option, required this.controller});

  final String label;
  final IconData icon;
  final PaymentOption option;
  final PaymentMethodSetupController controller;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Expanded(
      child: Obx(() {
        final selected = controller.selectedOption.value == option;
        return Material(
          color: selected ? AppColors.primaryGreenDark.withValues(alpha: 0.12) : ext.searchFieldColor,
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => controller.selectOption(option),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: selected ? AppColors.primaryGreenDark : Colors.transparent,
                  width: 1.4,
                ),
              ),
              child: Column(
                children: [
                  Icon(icon, size: 20, color: selected ? AppColors.primaryGreenDark : AppColors.accentOrange),
                  const SizedBox(height: 6),
                  Text(
                    label,
                    style: AppTextStyles.captionBold(selected ? AppColors.primaryGreenDark : ext.headingColor),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(label, style: AppTextStyles.captionBold(context.appColors.mutedTextColor)),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({required this.controller, required this.hint, this.keyboardType, this.obscure = false});

  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(color: ext.searchFieldColor, borderRadius: BorderRadius.circular(15)),
      alignment: Alignment.centerLeft,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscure,
        style: AppTextStyles.bodyRegular(ext.headingColor),
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          hintText: hint,
          hintStyle: AppTextStyles.bodyRegular(ext.mutedTextColor),
        ),
      ),
    );
  }
}
