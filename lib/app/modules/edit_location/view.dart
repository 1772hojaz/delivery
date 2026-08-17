import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/soft_card.dart';
import 'controller.dart';

/// "1.35 Edit Location" — saved delivery address editor with an order
/// location and a deliver-to location row.
class EditLocationView extends GetView<EditLocationController> {
  const EditLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppBackButton(onPressed: () => Get.back()),
                  const SizedBox(width: 16),
                  Text('Edit Location', style: AppTextStyles.h3(ext.headingColor)),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView(
                  children: [
                    _LocationRow(
                      icon: Icons.storefront_rounded,
                      label: 'Order Location',
                      controller: controller.orderLocationController,
                    ),
                    const SizedBox(height: 18),
                    _LocationRow(
                      icon: Icons.location_on_rounded,
                      label: 'Deliver Location',
                      controller: controller.deliverLocationController,
                      accent: AppColors.accentOrange,
                    ),
                    const SizedBox(height: 18),
                    SoftCard(
                      padding: const EdgeInsets.all(0),
                      borderRadius: 22,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: Container(
                          height: 160,
                          width: double.infinity,
                          color: ext.searchFieldColor,
                          alignment: Alignment.center,
                          child: Icon(Icons.map_rounded, color: ext.mutedTextColor, size: 40),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              PrimaryButton(label: 'Save Location', onPressed: controller.save),
            ],
          ),
        ),
      ),
    );
  }
}

class _LocationRow extends StatelessWidget {
  const _LocationRow({
    required this.icon,
    required this.label,
    required this.controller,
    this.accent = AppColors.primaryGreenDark,
  });

  final IconData icon;
  final String label;
  final TextEditingController controller;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return SoftCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: accent, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.captionBold(ext.mutedTextColor)),
                const SizedBox(height: 6),
                TextField(
                  controller: controller,
                  maxLines: 2,
                  style: AppTextStyles.bodyMedium(ext.headingColor),
                  decoration: const InputDecoration(isDense: true, border: InputBorder.none),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
