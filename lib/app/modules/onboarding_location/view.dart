import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/primary_button.dart';
import 'controller.dart';

/// "1.10 Set Location" — location permission + address picker during
/// onboarding, so nearby restaurants and delivery estimates are accurate.
class OnboardingLocationView extends GetView<OnboardingLocationController> {
  const OnboardingLocationView({super.key});

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
              Text('Set Your Location', style: AppTextStyles.h1(ext.headingColor)),
              const SizedBox(height: 14),
              Text(
                'We use this to show nearby restaurants and accurate delivery times',
                style: AppTextStyles.bodySmall(ext.mutedTextColor),
              ),
              const SizedBox(height: 28),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ext.searchFieldColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(Icons.map_rounded, size: 64, color: AppColors.accentOrangeSoft.withValues(alpha: 0.35)),
                    Container(
                      height: 52,
                      width: 52,
                      decoration: const BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.location_on_rounded, color: Colors.white, size: 26),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: controller.useCurrentLocation,
                  child: Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreenDark.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.my_location_rounded, color: AppColors.primaryGreenDark, size: 20),
                        const SizedBox(width: 12),
                        Text('Use Current Location', style: AppTextStyles.bodyMedium(AppColors.primaryGreenDark)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text('Or enter manually', style: AppTextStyles.captionBold(ext.mutedTextColor)),
              const SizedBox(height: 10),
              Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(color: ext.searchFieldColor, borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.centerLeft,
                child: TextField(
                  controller: controller.addressController,
                  style: AppTextStyles.bodyRegular(ext.headingColor),
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Street, city, postal code',
                    hintStyle: AppTextStyles.bodyRegular(ext.mutedTextColor),
                  ),
                ),
              ),
              const Spacer(),
              PrimaryButton(label: 'Continue', onPressed: controller.onContinue),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
