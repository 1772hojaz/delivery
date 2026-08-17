import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/rating_chip.dart';
import '../../core/widgets/search_field.dart';
import '../../core/widgets/soft_card.dart';
import '../../routes/app_routes.dart';
import '../home/controller.dart' show RestaurantSummary;
import 'controller.dart';

class ExploreRestaurantView extends GetView<ExploreRestaurantController> {
  const ExploreRestaurantView({super.key});

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
                        Text('Explore Restaurant', style: AppTextStyles.h3(ext.headingColor)),
                        const SizedBox(height: 2),
                        Text(
                          '${controller.restaurants.length} restaurants found',
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
                onFilterTap: () =>
                    Get.toNamed(Routes.filter, arguments: Routes.exploreRestaurantFiltered),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 24),
                  itemCount: controller.restaurants.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    final restaurant = controller.restaurants[index];
                    return RestaurantGridCard(
                      restaurant: restaurant,
                      onTap: () => Get.toNamed(Routes.detailProduct),
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

/// Vertical restaurant tile used by both the plain and filtered Explore
/// Restaurant grids.
class RestaurantGridCard extends StatelessWidget {
  const RestaurantGridCard({super.key, required this.restaurant, required this.onTap});

  final RestaurantSummary restaurant;
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
                gradient: LinearGradient(colors: restaurant.gradientColors),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: Icon(restaurant.icon, color: Colors.white, size: 34),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            restaurant.name,
            style: AppTextStyles.bodyBold(ext.headingColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            restaurant.cuisine,
            style: AppTextStyles.bodySmall(ext.mutedTextColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              RatingChip(rating: restaurant.rating, label: ''),
              const Spacer(),
              Text('${restaurant.distanceKm}km', style: AppTextStyles.caption(ext.mutedTextColor)),
            ],
          ),
        ],
      ),
    );
  }
}
