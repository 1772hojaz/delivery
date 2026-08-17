import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/primary_button.dart';
import 'controller.dart';

/// "1.12 Verification Code" — Figma node context could not be fetched (the
/// Figma MCP server's tool-call quota was exhausted during this batch).
/// Built from the shared design tokens/widgets and standard OTP-entry
/// conventions instead of a pixel-matched reference.
class VerificationCodeView extends GetView<VerificationCodeController> {
  const VerificationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      backgroundColor: ext.cardColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBackButton(onPressed: () => Get.back()),
              const SizedBox(height: 28),
              Text('Verification Code', style: AppTextStyles.h1(ext.headingColor)),
              const SizedBox(height: 8),
              Text(
                'Enter the code we just sent you to complete verification',
                style: AppTextStyles.bodyRegular(ext.mutedTextColor),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  VerificationCodeController.codeLength,
                  (i) => _DigitBox(
                    controller: controller.digitControllers[i],
                    focusNode: controller.focusNodes[i],
                    onChanged: (value) => controller.onDigitChanged(i, value),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              PrimaryButton(label: 'Verify', onPressed: controller.verify),
              const SizedBox(height: 24),
              Center(
                child: Obx(
                  () => GestureDetector(
                    onTap: controller.secondsRemaining.value == 0 ? controller.resendCode : null,
                    child: RichText(
                      text: TextSpan(
                        style: AppTextStyles.bodyRegular(ext.mutedTextColor),
                        children: [
                          const TextSpan(text: "Didn't receive the code?  "),
                          TextSpan(
                            text: controller.secondsRemaining.value > 0
                                ? 'Resend in 0:${controller.secondsRemaining.value.toString().padLeft(2, '0')}'
                                : 'Resend code',
                            style: AppTextStyles.bodyBold(
                              controller.secondsRemaining.value > 0 ? ext.mutedTextColor : AppColors.primaryGreenDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DigitBox extends StatelessWidget {
  const _DigitBox({required this.controller, required this.focusNode, required this.onChanged});

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return SizedBox(
      height: 62,
      width: 62,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: AppTextStyles.h3(ext.headingColor),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: ext.searchFieldColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.primaryGreenDark, width: 1.5),
          ),
        ),
      ),
    );
  }
}
