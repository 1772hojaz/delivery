import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../routes/app_routes.dart';

class ChatMessage {
  ChatMessage({required this.text, required this.time, required this.isMe});

  final String text;
  final String time;
  final bool isMe;
}

class ChatDetailsController extends GetxController {
  late final String contactName;
  late final Color avatarColor;
  late final String avatarInitial;
  late final bool online;

  final textController = TextEditingController();
  final messages = <ChatMessage>[].obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    final map = args is Map ? args : const {};
    contactName = (map['name'] as String?) ?? 'Sofia I. Turani';
    avatarColor = (map['avatarColor'] as Color?) ?? AppColors.primaryGreenDark;
    avatarInitial = (map['avatarInitial'] as String?) ?? contactName.substring(0, 1);
    online = (map['online'] as bool?) ?? true;

    messages.addAll([
      ChatMessage(text: 'Hi! I just placed my order, is it on the way?', time: '10:02', isMe: false),
      ChatMessage(text: 'Yes! Your order has been picked up and is heading your way now.', time: '10:03', isMe: true),
      ChatMessage(text: 'Great, thank you so much!', time: '10:03', isMe: false),
      ChatMessage(text: 'Okay, I\'ll wait outside the gate.', time: '10:05', isMe: false),
    ]);
  }

  void send() {
    final text = textController.text.trim();
    if (text.isEmpty) return;
    messages.add(ChatMessage(text: text, time: 'Now', isMe: true));
    textController.clear();
  }

  void startCall() {
    Get.toNamed(
      Routes.callRinging,
      arguments: {
        'name': contactName,
        'avatarColor': avatarColor,
        'avatarInitial': avatarInitial,
      },
    );
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
