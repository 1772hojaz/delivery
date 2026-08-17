import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../routes/app_routes.dart';

/// A single row in the conversation list on the "Message" tab.
class ConversationItem {
  ConversationItem({
    required this.id,
    required this.name,
    required this.avatarColor,
    required this.avatarInitial,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
    this.online = false,
  });

  final String id;
  final String name;
  final Color avatarColor;
  final String avatarInitial;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final bool online;
}

class MessageController extends GetxController {
  final conversations = <ConversationItem>[
    ConversationItem(
      id: '1',
      name: 'Sofia I. Turani',
      avatarColor: AppColors.primaryGreenDark,
      avatarInitial: 'S',
      lastMessage: 'Okay, I\'ll wait outside the gate.',
      time: '2 min ago',
      unreadCount: 2,
      online: true,
    ),
    ConversationItem(
      id: '2',
      name: 'Robert Downing',
      avatarColor: AppColors.accentOrange,
      avatarInitial: 'R',
      lastMessage: 'Thank you for the fast delivery!',
      time: '18 min ago',
      online: true,
    ),
    ConversationItem(
      id: '3',
      name: 'Amara Cole',
      avatarColor: AppColors.accentAmber,
      avatarInitial: 'A',
      lastMessage: 'Is the order on its way?',
      time: '1 hr ago',
      unreadCount: 1,
    ),
    ConversationItem(
      id: '4',
      name: 'Daniel Kim',
      avatarColor: AppColors.primaryGreenLight,
      avatarInitial: 'D',
      lastMessage: 'Perfect, see you soon.',
      time: 'Yesterday',
    ),
    ConversationItem(
      id: '5',
      name: 'Priya Nair',
      avatarColor: AppColors.accentOrangeSoft,
      avatarInitial: 'P',
      lastMessage: 'Can you add extra napkins?',
      time: 'Yesterday',
    ),
    ConversationItem(
      id: '6',
      name: 'FoodNinja Support',
      avatarColor: AppColors.primaryGreenDark,
      avatarInitial: 'F',
      lastMessage: 'Your refund has been processed.',
      time: '2 days ago',
    ),
  ].obs;

  bool get hasUnread => conversations.any((c) => c.unreadCount > 0);

  void openChat(ConversationItem item) {
    Get.toNamed(
      Routes.chatDetails,
      arguments: {
        'name': item.name,
        'avatarColor': item.avatarColor,
        'avatarInitial': item.avatarInitial,
        'online': item.online,
      },
    );
  }
}
