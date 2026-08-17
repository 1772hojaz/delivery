import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

enum PaymentOption { card, cash, wallet }

class PaymentMethodSetupController extends GetxController {
  final selectedOption = PaymentOption.card.obs;

  final cardNumberController = TextEditingController();
  final cardHolderController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();

  final cardNumberPreview = '•••• •••• •••• ••••'.obs;
  final cardHolderPreview = 'Your Name'.obs;
  final expiryPreview = 'MM/YY'.obs;

  PaymentMethodSetupController() {
    cardNumberController.addListener(() {
      final digits = cardNumberController.text.replaceAll(RegExp(r'\D'), '');
      final groups = <String>[];
      for (var i = 0; i < digits.length; i += 4) {
        groups.add(digits.substring(i, i + 4 > digits.length ? digits.length : i + 4));
      }
      cardNumberPreview.value = groups.isEmpty ? '•••• •••• •••• ••••' : groups.join(' ').padRight(19, '•');
    });
    cardHolderController.addListener(() {
      cardHolderPreview.value = cardHolderController.text.trim().isEmpty ? 'Your Name' : cardHolderController.text;
    });
    expiryController.addListener(() {
      expiryPreview.value = expiryController.text.trim().isEmpty ? 'MM/YY' : expiryController.text;
    });
  }

  void selectOption(PaymentOption option) => selectedOption.value = option;

  @override
  void onClose() {
    cardNumberController.dispose();
    cardHolderController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.onClose();
  }

  void onSkip() => Get.offNamed(Routes.onboardingLocation);

  void onContinue() => Get.offNamed(Routes.onboardingLocation);
}
