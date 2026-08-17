import 'package:get/get.dart';
import 'controller.dart';

class SignupSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupSuccessController>(() => SignupSuccessController());
  }
}
