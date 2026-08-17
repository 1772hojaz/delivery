import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/soft_card.dart';
import '../../routes/app_routes.dart';
import 'controller.dart';

/// "1.8 Upload Photo" — avatar picker (camera / gallery) during onboarding.
class UploadPhotoView extends GetView<UploadPhotoController> {
  const UploadPhotoView({super.key});

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
              Text('Upload Your Photo', style: AppTextStyles.h1(ext.headingColor)),
              const SizedBox(height: 14),
              Text(
                'Add a profile photo so restaurants and riders can recognize you',
                style: AppTextStyles.bodySmall(ext.mutedTextColor),
              ),
              const SizedBox(height: 36),
              Center(
                child: Obx(
                  () => Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 168,
                        width: 168,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.hasPhoto.value
                              ? AppColors.primaryGreenLight.withValues(alpha: 0.15)
                              : ext.searchFieldColor,
                          border: Border.all(
                            color: controller.hasPhoto.value
                                ? AppColors.primaryGreenDark
                                : AppColors.accentOrangeSoft.withValues(alpha: 0.4),
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          controller.hasPhoto.value ? Icons.check_circle_rounded : Icons.person_rounded,
                          size: 72,
                          color: controller.hasPhoto.value ? AppColors.primaryGreenDark : AppColors.accentOrangeSoft,
                        ),
                      ),
                      Positioned(
                        right: 4,
                        bottom: 4,
                        child: Container(
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            shape: BoxShape.circle,
                            border: Border.all(color: ext.cardColor, width: 3),
                          ),
                          child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 36),
              SoftCard(
                onTap: controller.pickFromCamera,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                child: Row(
                  children: [
                    const Icon(Icons.camera_alt_outlined, color: AppColors.accentOrange, size: 22),
                    const SizedBox(width: 14),
                    Expanded(child: Text('Take a Photo', style: AppTextStyles.bodyMedium(ext.headingColor))),
                    Icon(Icons.chevron_right_rounded, color: ext.mutedTextColor),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              SoftCard(
                onTap: controller.pickFromGallery,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                child: Row(
                  children: [
                    const Icon(Icons.image_outlined, color: AppColors.accentOrange, size: 22),
                    const SizedBox(width: 14),
                    Expanded(child: Text('Choose from Gallery', style: AppTextStyles.bodyMedium(ext.headingColor))),
                    Icon(Icons.chevron_right_rounded, color: ext.mutedTextColor),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: TextButton(
                  onPressed: () => Get.offNamed(Routes.uploadPreview),
                  child: Text('Skip for now', style: AppTextStyles.bodyMedium(ext.mutedTextColor)),
                ),
              ),
              const SizedBox(height: 8),
              PrimaryButton(label: 'Next', onPressed: controller.onNext),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
