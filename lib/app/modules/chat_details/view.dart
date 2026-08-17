import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Chat Details" screen from Figma.
class ChatDetailsView extends GetView<ChatDetailsController> {
  const ChatDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Chat Details')),
      body: Center(
        child: Text('Chat Details', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
