import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class FinishOrderController extends GetxController {
  final rating = 5.obs;
  final feedbackController = TextEditingController();

  void setRating(int value) => rating.value = value;

  void submit() {
    Get.toNamed(Routes.rateFood);
  }

  void skip() {
    Get.offAllNamed(Routes.home);
  }

  @override
  void onClose() {
    feedbackController.dispose();
    super.onClose();
  }
}
