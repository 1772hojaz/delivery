import 'package:get/get.dart';
import 'controller.dart';

class VerificationCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationCodeController>(() => VerificationCodeController());
  }
}
