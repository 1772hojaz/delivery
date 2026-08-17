import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/primary_button.dart';
import '../../routes/app_routes.dart';
import 'controller.dart';

/// Reusable, generic full-screen success/confirmation overlay. Not wired
/// from any other screen yet — callers navigate here with
/// `Get.toNamed(Routes.successNotification, arguments: {'title': ..., 'message': ..., 'ctaLabel': ...})`,
/// all of which are optional.
class SuccessNotificationView extends GetView<SuccessNotificationController> {
  const SuccessNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    final args = Get.arguments is Map ? Get.arguments as Map : const {};
    final title = (args['title'] as String?) ?? 'Success!';
    final message = (args['message'] as String?) ??
        'Your request has been completed successfully. Thank you for using FoodNinja.';
    final ctaLabel = (args['ctaLabel'] as String?) ?? 'Continue';

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(color: Color(0x4015BE77), offset: Offset(0, 16), blurRadius: 40),
                  ],
                ),
                child: const Icon(Icons.check_rounded, color: Colors.white, size: 72),
              ),
              const SizedBox(height: 32),
              Text(title, textAlign: TextAlign.center, style: AppTextStyles.h2(ext.headingColor)),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyRegular(ext.mutedTextColor),
              ),
              const SizedBox(height: 40),
              PrimaryButton(
                label: ctaLabel,
                onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    Get.back();
                  } else {
                    Get.offNamed(Routes.home);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
