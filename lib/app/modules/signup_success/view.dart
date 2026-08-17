import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/primary_button.dart';
import 'controller.dart';

/// "1.11 Signup Success Notification" — terminal success state at the end
/// of the onboarding wizard. No back button: this screen is a dead end that
/// only moves forward into the app.
class SignupSuccessView extends GetView<SignupSuccessController> {
  const SignupSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(color: Color(0x4015BE77), offset: Offset(0, 16), blurRadius: 40),
                  ],
                ),
                child: const Icon(Icons.check_rounded, color: Colors.white, size: 72),
              ),
              const SizedBox(height: 36),
              Text(
                'You\'re All Set!',
                textAlign: TextAlign.center,
                style: AppTextStyles.h1(ext.headingColor),
              ),
              const SizedBox(height: 14),
              Text(
                'Your account has been created successfully. Start exploring restaurants near you.',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmall(ext.mutedTextColor),
              ),
              const Spacer(),
              PrimaryButton(label: 'Start Ordering', onPressed: controller.onStartOrdering),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
