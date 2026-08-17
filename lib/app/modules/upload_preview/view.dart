import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Upload Preview" screen from Figma.
class UploadPreviewView extends GetView<UploadPreviewController> {
  const UploadPreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Upload Preview')),
      body: Center(
        child: Text('Upload Preview', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
