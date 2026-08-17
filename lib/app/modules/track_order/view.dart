import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Track Order" screen from Figma.
class TrackOrderView extends GetView<TrackOrderController> {
  const TrackOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Track Order')),
      body: Center(
        child: Text('Track Order', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
