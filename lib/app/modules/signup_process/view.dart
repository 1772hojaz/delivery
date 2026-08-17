import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/primary_button.dart';
import 'controller.dart';

/// "1.6 Signup Process" — short bio step right after account verification.
class SignupProcessView extends GetView<SignupProcessController> {
  const SignupProcessView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -40,
            right: -120,
            child: Opacity(
              opacity: 0.06,
              child: Transform.rotate(
                angle: -1.18,
                child: SvgPicture.asset(
                  'assets/images/auth/signup_bg_pattern.svg',
                  width: 480,
                  colorFilter: ColorFilter.mode(AppColors.primaryGreenDark, BlendMode.srcIn),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  AppBackButton(onPressed: () => Get.back()),
                  const SizedBox(height: 28),
                  Text('Fill in your bio to get started', style: AppTextStyles.h1(ext.headingColor)),
                  const SizedBox(height: 14),
                  Text(
                    'This data will be displayed in your account profile for security',
                    style: AppTextStyles.bodySmall(ext.mutedTextColor),
                  ),
                  const SizedBox(height: 32),
                  _StepField(hint: 'First Name', controller: controller.firstNameController),
                  const SizedBox(height: 16),
                  _StepField(hint: 'Last Name', controller: controller.lastNameController),
                  const SizedBox(height: 16),
                  _StepField(
                    hint: 'Mobile Number',
                    controller: controller.mobileController,
                    keyboardType: TextInputType.phone,
                  ),
                  const Spacer(),
                  PrimaryButton(label: 'Next', onPressed: controller.onNext),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepField extends StatelessWidget {
  const _StepField({required this.hint, required this.controller, this.keyboardType});

  final String hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Container(
      height: 61,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: ext.cardColor,
        borderRadius: BorderRadius.circular(22),
        boxShadow: ext.cardShadow,
      ),
      alignment: Alignment.centerLeft,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
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
