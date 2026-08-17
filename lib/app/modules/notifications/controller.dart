import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';

enum NotificationKind { success, topup, cancel }

class NotificationItem {
  NotificationItem({
    required this.kind,
    required this.title,
    required this.message,
    required this.time,
  });

  final NotificationKind kind;
  final String title;
  final String message;
  final String time;

  IconData get icon {
    switch (kind) {
      case NotificationKind.success:
        return Icons.check_circle_rounded;
      case NotificationKind.topup:
        return Icons.account_balance_wallet_rounded;
      case NotificationKind.cancel:
        return Icons.cancel_rounded;
    }
  }

  Color get color {
    switch (kind) {
      case NotificationKind.success:
        return AppColors.primaryGreenDark;
      case NotificationKind.topup:
        return AppColors.accentOrange;
      case NotificationKind.cancel:
        return AppColors.error;
    }
  }
}

class NotificationsController extends GetxController {
  final today = <NotificationItem>[
    NotificationItem(
      kind: NotificationKind.success,
      title: 'Order Delivered',
      message: 'Your order #FN2381 has been delivered successfully.',
      time: '10 min ago',
    ),
    NotificationItem(
      kind: NotificationKind.topup,
      title: 'Wallet Top Up',
      message: 'You\'ve successfully added \$50.00 to your wallet.',
      time: '1 hr ago',
    ),
    NotificationItem(
      kind: NotificationKind.cancel,
      title: 'Order Cancelled',
      message: 'Your order #FN2377 was cancelled by the restaurant.',
      time: '3 hr ago',
    ),
  ].obs;

  final earlier = <NotificationItem>[
    NotificationItem(
      kind: NotificationKind.success,
      title: 'Payment Successful',
      message: 'Payment for order #FN2350 was processed successfully.',
      time: 'Yesterday',
    ),
    NotificationItem(
      kind: NotificationKind.topup,
      title: 'Wallet Top Up',
      message: 'You\'ve successfully added \$20.00 to your wallet.',
      time: '2 days ago',
    ),
  ].obs;
}
