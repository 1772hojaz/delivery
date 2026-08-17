import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/primary_button.dart';
import 'controller.dart';
import 'widgets/star_rating_row.dart';

class FinishOrderView extends GetView<FinishOrderController> {
  const FinishOrderView({super.key});

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
                height: 140,
                width: 140,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(color: Color(0x4015BE77), offset: Offset(0, 14), blurRadius: 34),
                  ],
                ),
                child: const Icon(Icons.check_rounded, color: Colors.white, size: 70),
              ),
              const SizedBox(height: 28),
              Text('Order Delivered!', style: AppTextStyles.h2(ext.headingColor)),
              const SizedBox(height: 10),
              Text(
                'Your order has arrived. Enjoy your meal and let us\nknow how everything went.',
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
                    hintText: 'Share your feedback about the order...',
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
