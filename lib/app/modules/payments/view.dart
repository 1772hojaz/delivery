import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Payments" screen from Figma.
class PaymentsView extends GetView<PaymentsController> {
  const PaymentsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Payments')),
      body: Center(
        child: Text('Payments', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
