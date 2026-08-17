import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Detail Menu" screen from Figma.
class DetailMenuView extends GetView<DetailMenuController> {
  const DetailMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Detail Menu')),
      body: Center(
        child: Text('Detail Menu', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
