import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Via Method" screen from Figma.
class ViaMethodView extends GetView<ViaMethodController> {
  const ViaMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Via Method')),
      body: Center(
        child: Text('Via Method', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
