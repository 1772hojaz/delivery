import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class RateRestaurantController extends GetxController {
  final rating = 5.obs;
  final feedbackController = TextEditingController();

  void setRating(int value) => rating.value = value;

  void submit() {
    Get.offAllNamed(
      Routes.successNotification,
      arguments: {
        'title': 'Thank You!',
        'message': 'Your feedback helps other food lovers make great choices.',
        'ctaLabel': 'Back to Home',
      },
    );
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
