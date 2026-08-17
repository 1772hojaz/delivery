import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Upload Photo" screen from Figma.
class UploadPhotoView extends GetView<UploadPhotoController> {
  const UploadPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Upload Photo')),
      body: Center(
        child: Text('Upload Photo', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
