import 'package:get/get.dart';
import 'controller.dart';

class SuccessNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessNotificationController>(() => SuccessNotificationController());
  }
}
