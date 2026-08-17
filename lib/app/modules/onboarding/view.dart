import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/primary_button.dart';
import 'controller.dart';

/// Single onboarding screen built from three PageView slides (Figma nodes
/// 169:18150 "1.1 Onboarding", 169:18001 "1.2 Onboarding",
/// 169:18546 "1.3 Onboarding"). Skip / dot-indicator / Next-Get Started
/// controls are layered on top, shared across slides.
class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      backgroundColor: ext.cardColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  PageView(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    children: const [
                      _LogoSlide(),
                      _IllustrationSlide(
                        imageAsset: 'assets/images/onboarding/slide2_illustration.png',
                        headline: 'Find your Comfort Food here',
                        body: 'Here You Can find a chef or dish for every taste and color. Enjoy!',
                      ),
                      _IllustrationSlide(
                        icons: [Icons.ramen_dining_rounded, Icons.lunch_dining_rounded, Icons.local_pizza_rounded],
                        headline: 'Food Ninja is Where Your Comfort Food Lives',
                        body: 'Enjoy a fast and smooth food delivery at your doorstep',
                      ),
                    ],
                  ),
                  Positioned(
                    top: 4,
                    right: 12,
                    child: Obx(
                      () => AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: controller.currentPage.value == OnboardingController.totalPages - 1 ? 0 : 1,
                        child: TextButton(
                          onPressed: controller.skip,
                          child: Text('Skip', style: AppTextStyles.bodyBold(ext.mutedTextColor)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        OnboardingController.totalPages,
                        (i) => AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: controller.currentPage.value == i ? 22 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            gradient: controller.currentPage.value == i ? AppColors.primaryGradient : null,
                            color: controller.currentPage.value == i ? null : ext.mutedTextColor.withValues(alpha: 0.3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => SizedBox(
                      width: 200,
                      child: PrimaryButton(
                        label: controller.currentPage.value == OnboardingController.totalPages - 1 ? 'Get Started' : 'Next',
                        onPressed: controller.next,
                        height: 57,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Slide 1 — brand intro (logo + wordmark). The Figma node's faint food-doodle
/// background pattern is simplified to a soft brand-tinted blob (the exact
/// pattern is a masked composite of dozens of vector paths that isn't
/// practical to reproduce 1:1 as Flutter widgets).
class _LogoSlide extends StatelessWidget {
  const _LogoSlide();

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: -60,
          child: Container(
            height: 320,
            width: 320,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [AppColors.primaryGreenLight.withValues(alpha: 0.12), Colors.transparent],
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/onboarding/logo_mark.png', height: 130),
            const SizedBox(height: 16),
            ShaderMask(
              shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
              child: Text(
                'FoodNinja',
                style: AppTextStyles.logo(Colors.white).copyWith(fontSize: 40),
              ),
            ),
            const SizedBox(height: 6),
            Text('Deliver Favorite Food', style: AppTextStyles.bodyMedium(ext.mutedTextColor)),
          ],
        ),
      ],
    );
  }
}

/// Slides 2 & 3 — hero image (or an icon cluster fallback when no exported
/// asset was available) + headline + body copy.
class _IllustrationSlide extends StatelessWidget {
  const _IllustrationSlide({this.imageAsset, this.icons, required this.headline, required this.body});

  final String? imageAsset;
  final List<IconData>? icons;
  final String headline;
  final String body;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Expanded(
            child: imageAsset != null
                ? Image.asset(imageAsset!, fit: BoxFit.contain)
                : _IconCluster(icons: icons!),
          ),
          Text(headline, textAlign: TextAlign.center, style: AppTextStyles.h2(ext.headingColor)),
          const SizedBox(height: 14),
          Text(
            body,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyRegular(ext.mutedTextColor).copyWith(height: 1.8),
          ),
        ],
      ),
    );
  }
}

/// Simplified stand-in for the slide-3 Figma illustration (a burger/taco/
/// noodle-box cluster built from 100+ individual vector paths that Figma's
/// MCP tool call limit was hit before a flattened export could be pulled).
class _IconCluster extends StatelessWidget {
  const _IconCluster({required this.icons});

  final List<IconData> icons;

  @override
  Widget build(BuildContext context) {
    final colors = [AppColors.accentOrange, AppColors.primaryGreenDark, AppColors.accentAmber];
    return Center(
      child: Container(
        height: 220,
        width: 220,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.accentAmber.withValues(alpha: 0.12),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: List.generate(icons.length, (i) {
            final angle = (i / icons.length) * 2 * math.pi - (math.pi / 2);
            final dx = 55 * math.cos(angle);
            final dy = 55 * math.sin(angle);
            return Transform.translate(
              offset: Offset(dx, dy),
              child: Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: const [BoxShadow(color: Color(0x1A000000), blurRadius: 12, offset: Offset(0, 6))],
                ),
                child: Icon(icons[i], color: colors[i % colors.length], size: 30),
              ),
            );
          }),
        ),
      ),
    );
  }
}
