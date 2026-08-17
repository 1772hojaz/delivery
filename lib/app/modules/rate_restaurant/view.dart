import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/primary_button.dart';
import '../finish_order/widgets/star_rating_row.dart';
import 'controller.dart';

class RateRestaurantView extends GetView<RateRestaurantController> {
  const RateRestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(
                height: 130,
                width: 130,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreenDark.withValues(alpha: 0.14),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.storefront_rounded, color: AppColors.primaryGreenDark, size: 58),
              ),
              const SizedBox(height: 28),
              Text('Rate the Restaurant', style: AppTextStyles.h2(ext.headingColor)),
              const SizedBox(height: 10),
              Text(
                'How was your overall experience with\nthis restaurant?',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyRegular(ext.mutedTextColor),
              ),
              const SizedBox(height: 32),
              Obx(
                () => StarRatingRow(rating: controller.rating.value, onChanged: controller.setRating),
              ),
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                decoration: BoxDecoration(
                  color: ext.searchFieldColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: TextField(
                  controller: controller.feedbackController,
                  maxLines: 4,
                  style: AppTextStyles.bodyRegular(ext.headingColor),
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Tell us more about the restaurant...',
                    hintStyle: AppTextStyles.caption(AppColors.accentOrangeSoft),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              PrimaryButton(label: 'Submit', onPressed: controller.submit),
              const SizedBox(height: 14),
              TextButton(
                onPressed: controller.skip,
                child: Text('Skip', style: AppTextStyles.bodyMedium(ext.mutedTextColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
