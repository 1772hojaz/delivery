import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/soft_card.dart';
import 'controller.dart';

/// "1.13 Via Method" — Figma node context could not be fetched (the Figma
/// MCP server's tool-call quota was exhausted during this batch). Built
/// from the shared design tokens/widgets and standard "choose a channel"
/// conventions instead of a pixel-matched reference.
class ViaMethodView extends GetView<ViaMethodController> {
  const ViaMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      backgroundColor: ext.cardColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBackButton(onPressed: () => Get.back()),
              const SizedBox(height: 28),
              Text('Verify Your Identity', style: AppTextStyles.h1(ext.headingColor)),
              const SizedBox(height: 8),
              Text(
                "Choose how you'd like to receive your verification code",
                style: AppTextStyles.bodyRegular(ext.mutedTextColor),
              ),
              const SizedBox(height: 32),
              Obx(
                () => _MethodOption(
                  icon: Icons.sms_outlined,
                  title: 'Via SMS',
                  subtitle: 'Send a code to your registered phone number',
                  selected: controller.selectedMethod.value == VerificationMethod.sms,
                  onTap: () => controller.select(VerificationMethod.sms),
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => _MethodOption(
                  icon: Icons.email_outlined,
                  title: 'Via Email',
                  subtitle: 'Send a code to your registered email address',
                  selected: controller.selectedMethod.value == VerificationMethod.email,
                  onTap: () => controller.select(VerificationMethod.email),
                ),
              ),
              const Spacer(),
              PrimaryButton(label: 'Continue', onPressed: controller.continueTapped),
            ],
          ),
        ),
      ),
    );
  }
}

class _MethodOption extends StatelessWidget {
  const _MethodOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return SoftCard(
      onTap: onTap,
      borderRadius: 18,
      color: selected ? AppColors.primaryGreenDark.withValues(alpha: 0.08) : ext.cardColor,
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.accentOrangeSoft.withValues(alpha: 0.15),
            ),
            child: Icon(icon, color: AppColors.accentOrange, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.bodyBold(ext.headingColor)),
                const SizedBox(height: 4),
                Text(subtitle, style: AppTextStyles.bodySmall(ext.mutedTextColor)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            selected ? Icons.check_circle_rounded : Icons.circle_outlined,
            color: selected ? AppColors.primaryGreenDark : ext.mutedTextColor,
            size: 24,
          ),
        ],
      ),
    );
  }
}
