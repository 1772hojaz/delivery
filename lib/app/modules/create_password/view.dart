import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Create Password" screen from Figma.
class CreatePasswordView extends GetView<CreatePasswordController> {
  const CreatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Create Password')),
      body: Center(
        child: Text('Create Password', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
