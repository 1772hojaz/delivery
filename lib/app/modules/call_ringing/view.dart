import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Call Ringing" screen from Figma.
class CallRingingView extends GetView<CallRingingController> {
  const CallRingingView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Call Ringing')),
      body: Center(
        child: Text('Call Ringing', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
