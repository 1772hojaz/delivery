import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/bottom_nav_bar.dart';
import '../../core/widgets/rating_chip.dart';
import '../../core/widgets/search_field.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/soft_card.dart';
import '../../core/widgets/primary_button.dart';
import '../../routes/app_routes.dart';
import 'controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello, welcome 👋', style: AppTextStyles.caption(ext.mutedTextColor)),
                        const SizedBox(height: 4),
                        Text('Find Your Favorite Food', style: AppTextStyles.h2(ext.headingColor)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  SoftIconButton(
                    icon: Icons.notifications_none_rounded,
                    onPressed: () => Get.toNamed(Routes.notifications),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Get.toNamed(Routes.exploreRestaurant),
                child: AbsorbPointer(
                  child: AppSearchField(
                    controller: controller.searchController,
                    onFilterTap: () => Get.toNamed(Routes.filter),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              _PromoBanner(onBuyNow: () => Get.toNamed(Routes.exploreMenu)),
              const SizedBox(height: 28),
              SectionHeader(
                title: 'Nearest Restaurant',
                actionLabel: 'View More',
                onActionTap: () => Get.toNamed(Routes.exploreRestaurant),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 214,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.nearestRestaurants.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 14),
                  itemBuilder: (context, index) {
                    final restaurant = controller.nearestRestaurants[index];
                    return _RestaurantCard(
                      restaurant: restaurant,
                      onTap: () => Get.toNamed(Routes.detailProduct),
                    );
                  },
                ),
              ),
              const SizedBox(height: 28),
              SectionHeader(
                title: 'Popular Menu',
                actionLabel: 'View More',
                onActionTap: () => Get.toNamed(Routes.exploreMenu),
              ),
              const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.popularMenu.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final food = controller.popularMenu[index];
                  return _FoodRow(food: food, onTap: () => Get.toNamed(Routes.detailMenu));
                },
              ),
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Obx(
            () => AppBottomNavBar(
              current: MainTab.home,
              onTap: controller.onTabTap,
              cartCount: controller.cart.itemCount,
            ),
          ),
        ),
      ),
    );
  }
}

class _PromoBanner extends StatelessWidget {
  const _PromoBanner({required this.onBuyNow});

  final VoidCallback onBuyNow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(color: Color(0x4015BE77), offset: Offset(6, 14), blurRadius: 30),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -12,
            bottom: -18,
            child: Icon(Icons.fastfood_rounded, size: 96, color: Colors.white.withValues(alpha: 0.18)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Get Discount 20%', style: AppTextStyles.h3(Colors.white)),
              const SizedBox(height: 6),
              SizedBox(
                width: 190,
                child: Text(
                  'On your first order from any nearby restaurant',
                  style: AppTextStyles.bodySmall(Colors.white.withValues(alpha: 0.9)),
                ),
              ),
              const SizedBox(height: 16),
              GhostPillButton(label: 'Buy Now', onPressed: onBuyNow),
            ],
          ),
        ],
      ),
    );
  }
}

class _RestaurantCard extends StatelessWidget {
  const _RestaurantCard({required this.restaurant, required this.onTap});

  final RestaurantSummary restaurant;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return SizedBox(
      width: 168,
      child: SoftCard(
        onTap: onTap,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 96,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: restaurant.gradientColors),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: Icon(restaurant.icon, color: Colors.white, size: 36),
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
                Icon(Icons.access_time_rounded, size: 14, color: ext.mutedTextColor),
                const SizedBox(width: 4),
                Text('${restaurant.deliveryMins}m', style: AppTextStyles.caption(ext.mutedTextColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FoodRow extends StatelessWidget {
  const _FoodRow({required this.food, required this.onTap});

  final FoodSummary food;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return SoftCard(
      onTap: onTap,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: food.gradientColors),
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: Icon(food.icon, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(food.name, style: AppTextStyles.bodyBold(ext.headingColor)),
                const SizedBox(height: 4),
                Text(
                  food.restaurant,
                  style: AppTextStyles.bodySmall(ext.mutedTextColor),
                ),
                const SizedBox(height: 6),
                RatingChip(rating: food.rating, label: ''),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text('\$${food.price.toStringAsFixed(2)}', style: AppTextStyles.price(AppColors.primaryGreenDark)),
        ],
      ),
    );
  }
}
