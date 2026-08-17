import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Order Details" screen from Figma.
class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Order Details')),
      body: Center(
        child: Text('Order Details', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
