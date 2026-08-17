import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/primary_button.dart';
import 'controller.dart';

/// "1.14 Password" — Figma node context could not be fetched (the Figma
/// MCP server's tool-call quota was exhausted during this batch). Built
/// from the shared design tokens/widgets and the auth-flow conventions
/// used elsewhere in this batch instead of a pixel-matched reference.
class CreatePasswordView extends GetView<CreatePasswordController> {
  const CreatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      backgroundColor: ext.cardColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBackButton(onPressed: () => Get.back()),
                const SizedBox(height: 28),
                Text('Create New Password', style: AppTextStyles.h1(ext.headingColor)),
                const SizedBox(height: 8),
                Text(
                  'Your new password must be different from previously used passwords',
                  style: AppTextStyles.bodyRegular(ext.mutedTextColor),
                ),
                const SizedBox(height: 32),
                Obx(
                  () => _PasswordField(
                    controller: controller.passwordController,
                    hint: 'New password',
                    obscureText: controller.obscurePassword.value,
                    validator: controller.validatePassword,
                    onToggle: controller.toggleObscurePassword,
                  ),
                ),
                const SizedBox(height: 16),
                Obx(
                  () => _PasswordField(
                    controller: controller.confirmPasswordController,
                    hint: 'Confirm new password',
                    obscureText: controller.obscureConfirmPassword.value,
                    validator: controller.validateConfirmPassword,
                    onToggle: controller.toggleObscureConfirmPassword,
                  ),
                ),
                const SizedBox(height: 32),
                PrimaryButton(label: 'Reset Password', onPressed: controller.submit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.controller,
    required this.hint,
    required this.obscureText,
    required this.onToggle,
    this.validator,
  });

  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final VoidCallback onToggle;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: AppTextStyles.bodyMedium(ext.headingColor),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.bodyRegular(ext.mutedTextColor),
        prefixIcon: const Icon(Icons.lock_outline_rounded, color: AppColors.accentOrange, size: 20),
        suffixIcon: IconButton(
          onPressed: onToggle,
          icon: Icon(
            obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: ext.mutedTextColor,
            size: 20,
          ),
        ),
        filled: true,
        fillColor: ext.searchFieldColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.error),
        ),
      ),
    );
  }
}
