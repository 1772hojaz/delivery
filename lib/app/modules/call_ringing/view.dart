import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';
import 'package:get/get.dart';

class CallRingingView extends GetView<CallRingingController> {
  const CallRingingView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Container(
                height: 140,
                width: 140,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: controller.avatarColor.withValues(alpha: 0.16),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  controller.avatarInitial,
                  style: AppTextStyles.h1(controller.avatarColor).copyWith(fontSize: 48),
                ),
              ),
              const SizedBox(height: 28),
              Text(controller.contactName, style: AppTextStyles.h2(ext.headingColor)),
              const SizedBox(height: 10),
              Text('Calling...', style: AppTextStyles.bodyMedium(ext.mutedTextColor)),
              const Spacer(flex: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _CallActionButton(
                    icon: Icons.call_end_rounded,
                    color: AppColors.error,
                    onTap: controller.decline,
                  ),
                  _CallActionButton(
                    icon: Icons.call_rounded,
                    color: AppColors.primaryGreenDark,
                    onTap: controller.accept,
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class _CallActionButton extends StatelessWidget {
  const _CallActionButton({required this.icon, required this.color, required this.onTap});

  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      shape: const CircleBorder(),
      elevation: 6,
      shadowColor: color.withValues(alpha: 0.5),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          height: 72,
          width: 72,
          child: Icon(icon, color: Colors.white, size: 30),
        ),
      ),
    );
  }
}
