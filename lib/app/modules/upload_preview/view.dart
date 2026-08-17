import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/primary_button.dart';
import 'controller.dart';

/// "1.9 Upload Preview" — crop/confirm step for the photo chosen on the
/// previous screen.
class UploadPreviewView extends GetView<UploadPreviewController> {
  const UploadPreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              AppBackButton(onPressed: () => Get.back()),
              const SizedBox(height: 28),
              Text('Preview Your Photo', style: AppTextStyles.h1(ext.headingColor)),
              const SizedBox(height: 14),
              Text(
                'Make sure your face is clear and well-lit before you continue',
                style: AppTextStyles.bodySmall(ext.mutedTextColor),
              ),
              const SizedBox(height: 32),
              Center(
                child: Container(
                  height: 260,
                  width: 260,
                  decoration: BoxDecoration(
                    color: ext.searchFieldColor,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: ext.cardShadow,
                    border: Border.all(color: AppColors.primaryGreenDark.withValues(alpha: 0.35), width: 2),
                  ),
                  child: const Icon(Icons.person_rounded, size: 110, color: AppColors.accentOrangeSoft),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton.icon(
                  onPressed: controller.onRetake,
                  icon: const Icon(Icons.refresh_rounded, color: AppColors.accentOrange, size: 18),
                  label: Text('Retake photo', style: AppTextStyles.bodyMedium(AppColors.accentOrange)),
                ),
              ),
              const Spacer(),
              PrimaryButton(label: 'Confirm & Continue', onPressed: controller.onConfirm),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
