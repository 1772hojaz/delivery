import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../routes/app_routes.dart';

class CallRingingController extends GetxController {
  late final String contactName;
  late final Color avatarColor;
  late final String avatarInitial;

  Timer? _connectTimer;
  bool _resolved = false;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    final map = args is Map ? args : const {};
    contactName = (map['name'] as String?) ?? 'Sofia I. Turani';
    avatarColor = (map['avatarColor'] as Color?) ?? AppColors.primaryGreenDark;
    avatarInitial = (map['avatarInitial'] as String?) ?? contactName.substring(0, 1);

    _connectTimer = Timer(const Duration(seconds: 2), _connect);
  }

  void _connect() {
    if (_resolved) return;
    _resolved = true;
    Get.offNamed(Routes.call, arguments: {
      'name': contactName,
      'avatarColor': avatarColor,
      'avatarInitial': avatarInitial,
    });
  }

  void accept() {
    _connectTimer?.cancel();
    _connect();
  }

  void decline() {
    if (_resolved) return;
    _resolved = true;
    _connectTimer?.cancel();
    Get.back();
  }

  @override
  void onClose() {
    _connectTimer?.cancel();
    super.onClose();
  }
}
