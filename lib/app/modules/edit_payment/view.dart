import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/primary_button.dart';
import 'controller.dart';

/// "1.34 Edit Payments" — add/edit a payment card.
class EditPaymentView extends GetView<EditPaymentController> {
  const EditPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppBackButton(onPressed: () => Get.back()),
                    const SizedBox(width: 16),
                    Text('Edit Payment', style: AppTextStyles.h3(ext.headingColor)),
                  ],
                ),
                const SizedBox(height: 28),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: const [
                      BoxShadow(color: Color(0x4015BE77), offset: Offset(0, 12), blurRadius: 26),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.wifi_tethering_rounded, color: Colors.white70, size: 26),
                      const SizedBox(height: 28),
                      ValueListenableBuilder<TextEditingValue>(
                        valueListenable: controller.cardNumberController,
                        builder: (_, value, __) => Text(
                          value.text.isEmpty ? '•••• •••• •••• ••••' : value.text,
                          style: AppTextStyles.h4(Colors.white).copyWith(letterSpacing: 2),
                        ),
                      ),
                      const SizedBox(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('CARD HOLDER', style: AppTextStyles.overline(Colors.white70)),
                          Text('EXPIRES', style: AppTextStyles.overline(Colors.white70)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Expanded(
                  child: ListView(
                    children: [
                      _LabeledField(
                        label: 'Card Number',
                        controller: controller.cardNumberController,
                        hint: '1234 5678 9012 3456',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                        ],
                      ),
                      const SizedBox(height: 18),
                      _LabeledField(
                        label: 'Card Holder Name',
                        controller: controller.cardHolderController,
                        hint: 'Jane Doe',
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Expanded(
                            child: _LabeledField(
                              label: 'Expiry Date',
                              controller: controller.expiryController,
                              hint: 'MM/YY',
                              keyboardType: TextInputType.datetime,
                              inputFormatters: [LengthLimitingTextInputFormatter(5)],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _LabeledField(
                              label: 'CVV',
                              controller: controller.cvvController,
                              hint: '•••',
                              obscureText: true,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(3),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                PrimaryButton(label: 'Save Card', onPressed: controller.save),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({
    required this.label,
    required this.controller,
    required this.hint,
    this.keyboardType,
    this.obscureText = false,
    this.inputFormatters,
  });

  final String label;
  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.captionBold(ext.mutedTextColor)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: ext.searchFieldColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            inputFormatters: inputFormatters,
            style: AppTextStyles.bodyRegular(ext.headingColor),
            validator: (value) => (value == null || value.trim().isEmpty) ? 'Required' : null,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              border: InputBorder.none,
              hintText: hint,
              hintStyle: AppTextStyles.caption(AppColors.accentOrangeSoft),
            ),
          ),
        ),
      ],
    );
  }
}
