import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 96,
              width: 96,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(28),
                boxShadow: const [
                  BoxShadow(color: Color(0x4015BE77), offset: Offset(0, 12), blurRadius: 30),
                ],
              ),
              child: const Icon(Icons.restaurant_rounded, color: Colors.white, size: 44),
            ),
            const SizedBox(height: 20),
            Text('FoodNinja', style: AppTextStyles.logo(AppColors.primaryGreenDark)),
            const SizedBox(height: 6),
            Text(
              'Deliver Favorite Food',
              style: AppTextStyles.bodyMedium(isDark ? AppColors.textLightMuted : AppColors.textDark),
            ),
          ],
        ),
      ),
    );
  }
}
