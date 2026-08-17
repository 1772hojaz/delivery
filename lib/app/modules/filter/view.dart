import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/primary_button.dart';
import 'controller.dart';

class FilterView extends GetView<FilterController> {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBackButton(onPressed: () => Get.back()),
                  Text('Filter', style: AppTextStyles.h3(ext.headingColor)),
                  GestureDetector(
                    onTap: controller.reset,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text('Reset', style: AppTextStyles.captionBold(AppColors.accentOrange)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Categories', style: AppTextStyles.bodyBold(ext.headingColor)),
                    const SizedBox(height: 14),
                    Obx(
                      () => Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: controller.categories.map((category) {
                          final selected = controller.selectedCategories.contains(category);
                          return GestureDetector(
                            onTap: () => controller.toggleCategory(category),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                              decoration: BoxDecoration(
                                gradient: selected ? AppColors.primaryGradient : null,
                                color: selected ? null : ext.searchFieldColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                category,
                                style: AppTextStyles.bodySmall(
                                  selected ? Colors.white : ext.mutedTextColor,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text('Price Range', style: AppTextStyles.bodyBold(ext.headingColor)),
                    Obx(() {
                      final range = controller.priceRange.value;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: AppColors.primaryGreenDark,
                              inactiveTrackColor: ext.searchFieldColor,
                              thumbColor: AppColors.primaryGreenDark,
                              overlayColor: AppColors.primaryGreenDark.withValues(alpha: 0.12),
                              rangeThumbShape: const RoundRangeSliderThumbShape(enabledThumbRadius: 9),
                            ),
                            child: RangeSlider(
                              values: range,
                              min: 0,
                              max: 100,
                              divisions: 20,
                              labels: RangeLabels(
                                '\$${range.start.round()}',
                                '\$${range.end.round()}',
                              ),
                              onChanged: (v) => controller.priceRange.value = v,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('\$${range.start.round()}', style: AppTextStyles.caption(ext.mutedTextColor)),
                              Text('\$${range.end.round()}', style: AppTextStyles.caption(ext.mutedTextColor)),
                            ],
                          ),
                        ],
                      );
                    }),
                    const SizedBox(height: 18),
                    Text('Minimum Rating', style: AppTextStyles.bodyBold(ext.headingColor)),
                    Obx(
                      () => Row(
                        children: [
                          Expanded(
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: AppColors.star,
                                inactiveTrackColor: ext.searchFieldColor,
                                thumbColor: AppColors.star,
                                overlayColor: AppColors.star.withValues(alpha: 0.12),
                              ),
                              child: Slider(
                                value: controller.minRating.value,
                                min: 1,
                                max: 5,
                                divisions: 8,
                                onChanged: (v) => controller.minRating.value = v,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.star_rounded, color: AppColors.star, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            controller.minRating.value.toStringAsFixed(1),
                            style: AppTextStyles.bodyMedium(ext.headingColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text('Distance', style: AppTextStyles.bodyBold(ext.headingColor)),
                    Obx(
                      () => Row(
                        children: [
                          Expanded(
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: AppColors.accentOrange,
                                inactiveTrackColor: ext.searchFieldColor,
                                thumbColor: AppColors.accentOrange,
                                overlayColor: AppColors.accentOrange.withValues(alpha: 0.12),
                              ),
                              child: Slider(
                                value: controller.maxDistanceKm.value,
                                min: 1,
                                max: 20,
                                divisions: 19,
                                onChanged: (v) => controller.maxDistanceKm.value = v,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${controller.maxDistanceKm.value.round()} km',
                            style: AppTextStyles.bodyMedium(ext.headingColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: PrimaryButton(label: 'Apply Filter', onPressed: controller.apply),
            ),
          ],
        ),
      ),
    );
  }
}
