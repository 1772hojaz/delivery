import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/search_field.dart';
import 'controller.dart';

/// Delivery-address picker used mid-checkout. Same styled map-placeholder
/// approach as Track Order — no real maps SDK, this is a UI-kit clone.
class SetLocationView extends GetView<SetLocationController> {
  const SetLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final pageBg = isDark ? AppColors.darkBackground : AppColors.lightBackground;

    return Scaffold(
      backgroundColor: pageBg,
      body: SafeArea(
        top: false,
        child: Stack(
        children: [
          Column(
            children: [
              const Expanded(flex: 5, child: _PinMapPlaceholder()),
              Container(
                decoration: BoxDecoration(
                  color: ext.cardColor,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
                  boxShadow: ext.cardShadow,
                ),
                padding: const EdgeInsets.fromLTRB(24, 26, 24, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Set Delivery Location', style: AppTextStyles.h3(ext.headingColor)),
                    const SizedBox(height: 16),
                    AppSearchField(
                      hintText: 'Search your address',
                      controller: controller.searchController,
                      showFilter: false,
                    ),
                    const SizedBox(height: 16),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: controller.useCurrentLocation,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              const Icon(Icons.near_me_rounded, size: 20, color: AppColors.accentOrange),
                              const SizedBox(width: 12),
                              Text('Use Current Location', style: AppTextStyles.bodyMedium(AppColors.accentOrange)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_on_rounded, size: 20, color: AppColors.primaryGreenDark),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Obx(
                            () => Text(
                              controller.selectedAddress.value,
                              style: AppTextStyles.bodyRegular(ext.mutedTextColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    PrimaryButton(label: 'Confirm Location', onPressed: controller.confirm),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 20,
            child: AppBackButton(onPressed: () => Get.back()),
          ),
        ],
        ),
      ),
    );
  }
}

/// Decorative stand-in for a live map: a soft diagonal gradient with a
/// pulsing pin marker at the selected point. No map SDK.
class _PinMapPlaceholder extends StatelessWidget {
  const _PinMapPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryGreenLight.withValues(alpha: 0.35),
            const Color(0xFFF3E7D0),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.6),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.location_on_rounded, color: AppColors.accentOrange, size: 22),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Container(
              height: 6,
              width: 22,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
