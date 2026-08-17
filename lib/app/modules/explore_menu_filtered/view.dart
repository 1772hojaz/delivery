import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/search_field.dart';
import '../../routes/app_routes.dart';
import '../explore_menu/view.dart' show FoodGridCard;
import 'controller.dart';

class ExploreMenuFilteredView extends GetView<ExploreMenuFilteredController> {
  const ExploreMenuFilteredView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppBackButton(onPressed: () => Get.back()),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Explore Menu', style: AppTextStyles.h3(ext.headingColor)),
                          const SizedBox(height: 2),
                          Text(
                            '${controller.foodItems.length} menu items found',
                            style: AppTextStyles.caption(ext.mutedTextColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              AppSearchField(
                controller: controller.searchController,
                onFilterTap: () => Get.toNamed(Routes.filter, arguments: Routes.exploreMenuFiltered),
              ),
              const SizedBox(height: 16),
              Obx(
                () => controller.activeFilters.isEmpty
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: controller.activeFilters
                              .map(
                                (filter) => _ActiveFilterChip(
                                  label: filter,
                                  onDismiss: () => controller.removeFilter(filter),
                                ),
                              )
                              .toList(),
                        ),
                      ),
              ),
              Expanded(
                child: Obx(
                  () {
                    final foodItems = controller.foodItems;
                    return GridView.builder(
                      padding: const EdgeInsets.only(bottom: 24),
                      itemCount: foodItems.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.72,
                      ),
                      itemBuilder: (context, index) {
                        final food = foodItems[index];
                        return FoodGridCard(food: food, onTap: () => Get.toNamed(Routes.detailMenu));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActiveFilterChip extends StatelessWidget {
  const _ActiveFilterChip({required this.label, required this.onDismiss});

  final String label;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 8, top: 6, bottom: 6),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: AppTextStyles.bodySmall(Colors.white)),
          const SizedBox(width: 4),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onDismiss,
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(Icons.close_rounded, size: 14, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
