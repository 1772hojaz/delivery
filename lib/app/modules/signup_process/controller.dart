import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class SignupProcessController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileController = TextEditingController();

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    mobileController.dispose();
    super.onClose();
  }

  void onNext() {
    if (firstNameController.text.trim().isEmpty ||
        lastNameController.text.trim().isEmpty ||
        mobileController.text.trim().isEmpty) {
      Get.snackbar('Almost there', 'Please fill in all fields to continue.');
      return;
    }
    Get.offNamed(Routes.uploadPhoto);
  }
}
