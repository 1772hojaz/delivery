import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';

class CallController extends GetxController {
  late final String contactName;
  late final Color avatarColor;
  late final String avatarInitial;

  final seconds = 0.obs;
  final muted = false.obs;
  final speakerOn = false.obs;

  Timer? _ticker;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    final map = args is Map ? args : const {};
    contactName = (map['name'] as String?) ?? 'Sofia I. Turani';
    avatarColor = (map['avatarColor'] as Color?) ?? AppColors.primaryGreenDark;
    avatarInitial = (map['avatarInitial'] as String?) ?? contactName.substring(0, 1);

    _ticker = Timer.periodic(const Duration(seconds: 1), (_) => seconds.value++);
  }

  String get formattedDuration {
    final m = (seconds.value ~/ 60).toString().padLeft(2, '0');
    final s = (seconds.value % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  void toggleMute() => muted.value = !muted.value;

  void toggleSpeaker() => speakerOn.value = !speakerOn.value;

  void endCall() => Get.back();

  @override
  void onClose() {
    _ticker?.cancel();
    super.onClose();
  }
}
