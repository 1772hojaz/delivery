import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/rating_chip.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/soft_card.dart';
import '../../routes/app_routes.dart';
import 'controller.dart';

/// Restaurant profile page ("1.39 Detail product" / "1.40 Detail product
/// Scrool Mode" in Figma — despite the node name, this is the restaurant's
/// page, not a single product). One screen, two scroll states: a
/// SliverAppBar collapses a full-bleed hero (with floating back/location/
/// favorite buttons) into a compact bar showing just the back button and the
/// restaurant name once the user scrolls the body up.
class DetailProductView extends GetView<DetailProductController> {
  const DetailProductView({super.key});

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
                controller.restaurantName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.h4(ext.headingColor),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(controller.heroAsset, fit: BoxFit.cover),
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
                        SoftIconButton(
                          icon: Icons.location_on_outlined,
                          onPressed: controller.showLocationInfo,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StatusPill(label: 'Popular'),
                  const SizedBox(height: 14),
                  Text(controller.restaurantName, style: AppTextStyles.h2(ext.headingColor)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      RatingChip(rating: controller.rating),
                      const SizedBox(width: 18),
                      const Icon(Icons.location_on_rounded, size: 18, color: AppColors.accentOrange),
                      const SizedBox(width: 6),
                      Text(
                        '${controller.distanceKm.toStringAsFixed(1)} km away',
                        style: AppTextStyles.bodySmall(ext.mutedTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text(controller.description, style: AppTextStyles.bodyRegular(ext.mutedTextColor)),
                  const SizedBox(height: 28),
                  SectionHeader(title: 'Popular Menu', actionLabel: 'View More', onActionTap: () {}),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 224,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.popularMenu.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 14),
                      itemBuilder: (context, index) => _PopularMenuCard(item: controller.popularMenu[index]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PopularMenuCard extends StatelessWidget {
  const _PopularMenuCard({required this.item});

  final PopularMenuItem item;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return SizedBox(
      width: 168,
      child: SoftCard(
        padding: EdgeInsets.zero,
        onTap: () => Get.toNamed(Routes.detailMenu),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
              child: Image.asset(item.imageAsset, height: 120, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyBold(ext.headingColor),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.caption(ext.mutedTextColor),
                  ),
                  const SizedBox(height: 8),
                  Text('\$${item.price.toStringAsFixed(2)}', style: AppTextStyles.bodyBold(AppColors.accentOrange)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
