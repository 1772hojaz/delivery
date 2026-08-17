import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/quantity_stepper.dart';
import '../../core/widgets/rating_chip.dart';
import 'controller.dart';

/// Single food-item detail screen. Same collapsing-hero treatment as
/// [DetailProductView]: a SliverAppBar collapses the full-bleed dish photo
/// (with floating favorite/location buttons) into a compact bar with just
/// the back button and the dish name.
class DetailMenuView extends GetView<DetailMenuController> {
  const DetailMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final pageBg = isDark ? AppColors.darkBackground : AppColors.lightBackground;

    return Scaffold(
      backgroundColor: pageBg,
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            backgroundColor: pageBg,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 66,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20, top: 8),
              child: AppBackButton(onPressed: () => Get.back()),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: const EdgeInsets.only(left: 74, bottom: 18),
              title: Text(
                controller.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.h4(ext.headingColor),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(controller.heroAsset, fit: BoxFit.cover),
                  Positioned(top: 50, left: 20, child: StatusPill(label: 'Popular')),
                  Positioned(
                    top: 50,
                    right: 20,
                    child: Row(
                      children: [
                        Obx(
                          () => SoftIconButton(
                            icon: controller.isFavorite.value
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: controller.isFavorite.value ? AppColors.error : AppColors.textDark,
                            onPressed: controller.toggleFavorite,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SoftIconButton(icon: Icons.location_on_outlined, onPressed: controller.showLocationInfo),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 140),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.name, style: AppTextStyles.h2(ext.headingColor)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      RatingChip(rating: controller.rating),
                      const SizedBox(width: 18),
                      Text('${controller.orderCount} orders', style: AppTextStyles.bodySmall(ext.mutedTextColor)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text('Description', style: AppTextStyles.bodyBold(ext.headingColor)),
                  const SizedBox(height: 8),
                  Text(controller.description, style: AppTextStyles.bodyRegular(ext.mutedTextColor)),
                  const SizedBox(height: 22),
                  Text('Ingredients', style: AppTextStyles.bodyBold(ext.headingColor)),
                  const SizedBox(height: 10),
                  ...controller.ingredients.map(
                    (ingredient) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle_rounded, size: 16, color: AppColors.primaryGreenDark),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(ingredient, style: AppTextStyles.bodyRegular(ext.mutedTextColor)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          decoration: BoxDecoration(color: ext.cardColor, boxShadow: ext.cardShadow),
          child: Row(
            children: [
              Obx(
                () => QuantityStepper(
                  quantity: controller.quantity.value,
                  onIncrement: controller.increment,
                  onDecrement: controller.decrement,
                ),
              ),
              const SizedBox(width: 18),
              Expanded(child: PrimaryButton(label: 'Add To Chart', onPressed: controller.addToCart)),
            ],
          ),
        ),
      ),
    );
  }
}
