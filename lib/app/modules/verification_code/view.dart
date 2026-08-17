import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Verification Code" screen from Figma.
class VerificationCodeView extends GetView<VerificationCodeController> {
  const VerificationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Verification Code')),
      body: Center(
        child: Text('Verification Code', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
