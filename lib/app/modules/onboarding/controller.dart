import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/app_routes.dart';

class OnboardingController extends GetxController {
  static const onboardingSeenKey = 'onboarding_seen';
  static const totalPages = 3;

  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  void onPageChanged(int index) => currentPage.value = index;

  void next() {
    if (currentPage.value < totalPages - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeInOut,
      );
    } else {
      finish();
    }
  }

  void skip() => finish();

  void finish() {
    GetStorage().write(onboardingSeenKey, true);
    Get.offAllNamed(Routes.signUp);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
