import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Notifications" screen from Figma.
class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Center(
        child: Text('Notifications', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
