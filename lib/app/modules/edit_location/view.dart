import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Edit Location" screen from Figma.
class EditLocationView extends GetView<EditLocationController> {
  const EditLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Edit Location')),
      body: Center(
        child: Text('Edit Location', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
