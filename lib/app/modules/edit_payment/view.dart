import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Edit Payment" screen from Figma.
class EditPaymentView extends GetView<EditPaymentController> {
  const EditPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Edit Payment')),
      body: Center(
        child: Text('Edit Payment', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
