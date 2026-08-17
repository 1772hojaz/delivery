import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Filter" screen from Figma.
class FilterView extends GetView<FilterController> {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Filter')),
      body: Center(
        child: Text('Filter', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
