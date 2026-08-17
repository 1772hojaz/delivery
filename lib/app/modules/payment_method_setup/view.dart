import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Payment Method" screen from Figma.
class PaymentMethodSetupView extends GetView<PaymentMethodSetupController> {
  const PaymentMethodSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Payment Method')),
      body: Center(
        child: Text('Payment Method', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
