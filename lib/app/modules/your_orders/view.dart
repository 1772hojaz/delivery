import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Your Orders" screen from Figma.
class YourOrdersView extends GetView<YourOrdersController> {
  const YourOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders')),
      body: Center(
        child: Text('Your Orders', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
