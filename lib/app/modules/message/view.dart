import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Message" screen from Figma.
class MessageView extends GetView<MessageController> {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Message')),
      body: Center(
        child: Text('Message', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
