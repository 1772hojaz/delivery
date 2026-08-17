import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class OnboardingLocationController extends GetxController {
  final addressController = TextEditingController();
  final usingCurrentLocation = false.obs;

  void useCurrentLocation() {
    usingCurrentLocation.value = true;
    addressController.text = 'Current Location';
    Get.snackbar('Location found', 'Using your current location for delivery.');
  }

  @override
  void onClose() {
    addressController.dispose();
    super.onClose();
  }

  void onContinue() => Get.offNamed(Routes.signupSuccess);
}
