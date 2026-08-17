import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Success" screen from Figma.
class SuccessNotificationView extends GetView<SuccessNotificationController> {
  const SuccessNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Success')),
      body: Center(
        child: Text('Success', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
