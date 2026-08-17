import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Finish Order" screen from Figma.
class FinishOrderView extends GetView<FinishOrderController> {
  const FinishOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Finish Order')),
      body: Center(
        child: Text('Finish Order', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
