import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/primary_button.dart';
import 'controller.dart';

/// "1.5 Sign in" — Figma node context could not be fetched: the Figma MCP
/// server's tool-call quota was exhausted before this node could be read
/// (same rate limit noted on the sign-up screen). Built from the shared
/// design tokens/widgets and the auth-flow conventions already established
/// elsewhere in this batch instead of a pixel-matched reference.
class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      backgroundColor: ext.cardColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 48, 24, 32),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: AppTextStyles.h1(ext.headingColor)),
                const SizedBox(height: 8),
                Text(
                  'Sign in to continue ordering your favorite food',
                  style: AppTextStyles.bodyRegular(ext.mutedTextColor),
                ),
                const SizedBox(height: 36),
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
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: controller.forgotPassword,
                    child: Text('Forgot Password?', style: AppTextStyles.bodyBold(AppColors.primaryGreenDark)),
                  ),
                ),
                const SizedBox(height: 28),
                PrimaryButton(label: 'Sign in', onPressed: controller.signIn),
                const SizedBox(height: 24),
                Center(
                  child: GestureDetector(
                    onTap: controller.goToSignUp,
                    child: RichText(
                      text: TextSpan(
                        style: AppTextStyles.bodyRegular(ext.mutedTextColor),
                        children: [
                          const TextSpan(text: "Don't have an account?  "),
                          TextSpan(
                            text: 'Sign up',
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
