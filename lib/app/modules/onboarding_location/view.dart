import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Set Location" screen from Figma.
class OnboardingLocationView extends GetView<OnboardingLocationController> {
  const OnboardingLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Set Location')),
      body: Center(
        child: Text('Set Location', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
