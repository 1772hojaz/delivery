import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Rate Food" screen from Figma.
class RateFoodView extends GetView<RateFoodController> {
  const RateFoodView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Rate Food')),
      body: Center(
        child: Text('Rate Food', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
