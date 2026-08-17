import 'package:get/get.dart';
import 'controller.dart';

class OnboardingLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingLocationController>(() => OnboardingLocationController());
  }
}
