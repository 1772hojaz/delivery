import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Explore Restaurant" screen from Figma.
class ExploreRestaurantFilteredView extends GetView<ExploreRestaurantFilteredController> {
  const ExploreRestaurantFilteredView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Explore Restaurant')),
      body: Center(
        child: Text('Explore Restaurant', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
