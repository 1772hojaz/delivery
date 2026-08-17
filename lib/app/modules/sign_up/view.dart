import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/primary_button.dart';
import 'controller.dart';

/// "1.4 Sign up" — Figma node context could not be fetched: the Figma MCP
/// server's tool-call quota was exhausted mid-batch (rate limit on the
/// Starter plan) before this node could be read. Built from the shared
/// design tokens/widgets and the auth-flow conventions already established
/// by the onboarding/splash screens instead of a pixel-matched reference.
class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

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
                Text('Create Account', style: AppTextStyles.h1(ext.headingColor)),
                const SizedBox(height: 8),
                Text(
                  'Sign up to start ordering your comfort food',
                  style: AppTextStyles.bodyRegular(ext.mutedTextColor),
                ),
                const SizedBox(height: 32),
                _AuthField(
                  controller: controller.nameController,
                  hint: 'Full name',
                  icon: Icons.person_outline_rounded,
                  validator: controller.validateName,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                _AuthField(
                  controller: controller.emailController,
                  hint: 'Email address',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: controller.validateEmail,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                Obx(
                  () => _AuthField(
                    controller: controller.passwordController,
                    hint: 'Password',
                    icon: Icons.lock_outline_rounded,
                    obscureText: controller.obscurePassword.value,
                    validator: controller.validatePassword,
                    textInputAction: TextInputAction.done,
                    suffix: IconButton(
                      onPressed: controller.toggleObscurePassword,
                      icon: Icon(
                        controller.obscurePassword.value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: ext.mutedTextColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => _AuthCheckboxRow(
                    value: controller.keepMeSignedIn.value,
                    label: 'Keep Me Signed In',
                    onChanged: controller.toggleKeepMeSignedIn,
                  ),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => _AuthCheckboxRow(
                    value: controller.emailSpecialPricing.value,
                    label: 'Email Me About Special Pricing',
                    onChanged: controller.toggleEmailSpecialPricing,
                  ),
                ),
                const SizedBox(height: 28),
                PrimaryButton(label: 'Create Account', onPressed: controller.createAccount),
                const SizedBox(height: 24),
                Center(
                  child: GestureDetector(
                    onTap: controller.goToSignIn,
                    child: RichText(
                      text: TextSpan(
                        style: AppTextStyles.bodyRegular(ext.mutedTextColor),
                        children: [
                          const TextSpan(text: 'Already have an account?  '),
                          TextSpan(
                            text: 'Sign in',
                            style: AppTextStyles.bodyBold(AppColors.primaryGreenDark),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Rounded, filled text field matching the kit's search/input styling.
class _AuthField extends StatelessWidget {
  const _AuthField({
    required this.controller,
    required this.hint,
    required this.icon,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.suffix,
    this.textInputAction,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      textInputAction: textInputAction,
      style: AppTextStyles.bodyMedium(ext.headingColor),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.bodyRegular(ext.mutedTextColor),
        prefixIcon: Icon(icon, color: AppColors.accentOrange, size: 20),
        suffixIcon: suffix,
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

class _AuthCheckboxRow extends StatelessWidget {
  const _AuthCheckboxRow({required this.value, required this.label, required this.onChanged});

  final bool value;
  final String label;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          SizedBox(
            height: 22,
            width: 22,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: AppColors.primaryGreenDark,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(label, style: AppTextStyles.bodySmall(ext.mutedTextColor))),
        ],
      ),
    );
  }
}
