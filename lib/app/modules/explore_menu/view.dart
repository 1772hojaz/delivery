import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/rating_chip.dart';
import '../../core/widgets/search_field.dart';
import '../../core/widgets/soft_card.dart';
import '../../routes/app_routes.dart';
import '../home/controller.dart' show FoodSummary;
import 'controller.dart';

class ExploreMenuView extends GetView<ExploreMenuController> {
  const ExploreMenuView({super.key});

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
                    child: Column(
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
                ],
              ),
              const SizedBox(height: 20),
              AppSearchField(
                controller: controller.searchController,
                onFilterTap: () => Get.toNamed(Routes.filter, arguments: Routes.exploreMenuFiltered),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 24),
                  itemCount: controller.foodItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    final food = controller.foodItems[index];
                    return FoodGridCard(food: food, onTap: () => Get.toNamed(Routes.detailMenu));
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

/// Vertical food-item tile used by both the plain and filtered Explore Menu
/// grids.
class FoodGridCard extends StatelessWidget {
  const FoodGridCard({super.key, required this.food, required this.onTap});

  final FoodSummary food;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return SoftCard(
      onTap: onTap,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: food.gradientColors),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: Icon(food.icon, color: Colors.white, size: 34),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            food.name,
            style: AppTextStyles.bodyBold(ext.headingColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            food.restaurant,
            style: AppTextStyles.bodySmall(ext.mutedTextColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              RatingChip(rating: food.rating, label: ''),
              const Spacer(),
              Text('\$${food.price.toStringAsFixed(2)}', style: AppTextStyles.bodyBold(AppColors.primaryGreenDark)),
            ],
          ),
        ],
      ),
    );
  }
}
