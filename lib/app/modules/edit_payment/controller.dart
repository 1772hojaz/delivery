import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPaymentController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final cardNumberController = TextEditingController();
  final cardHolderController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();

  @override
  void onClose() {
    cardNumberController.dispose();
    cardHolderController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.onClose();
  }

  void save() {
    if (formKey.currentState?.validate() ?? false) {
      Get.back();
    }
  }
}
