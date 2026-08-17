import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Signup Process" screen from Figma.
class SignupProcessView extends GetView<SignupProcessController> {
  const SignupProcessView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Signup Process')),
      body: Center(
        child: Text('Signup Process', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
