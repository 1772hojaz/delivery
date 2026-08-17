import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Explore Menu" screen from Figma.
class ExploreMenuView extends GetView<ExploreMenuController> {
  const ExploreMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Explore Menu')),
      body: Center(
        child: Text('Explore Menu', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
