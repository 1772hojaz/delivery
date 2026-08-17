import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class VerificationCodeController extends GetxController {
  static const codeLength = 4;

  late final String targetRoute;
  final List<TextEditingController> digitControllers = List.generate(codeLength, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(codeLength, (_) => FocusNode());

  final RxInt secondsRemaining = 30.obs;
  Timer? _resendTimer;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    targetRoute = (arguments is String && arguments.isNotEmpty) ? arguments : Routes.signupProcess;
    _startResendTimer();
  }

  void _startResendTimer() {
    secondsRemaining.value = 30;
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value <= 1) {
        secondsRemaining.value = 0;
        timer.cancel();
      } else {
        secondsRemaining.value--;
      }
    });
  }

  void onDigitChanged(int index, String value) {
    if (value.isNotEmpty && index < codeLength - 1) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  void resendCode() {
    if (secondsRemaining.value > 0) return;
    for (final c in digitControllers) {
      c.clear();
    }
    _startResendTimer();
    Get.snackbar('Code sent', 'A new verification code has been sent.');
  }

  String get _enteredCode => digitControllers.map((c) => c.text).join();

  void verify() {
    if (_enteredCode.length < codeLength) {
      Get.snackbar('Invalid code', 'Please enter the full verification code.');
      return;
    }
    Get.offNamed(targetRoute);
  }

  @override
  void onClose() {
    _resendTimer?.cancel();
    for (final c in digitControllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.onClose();
  }
}
