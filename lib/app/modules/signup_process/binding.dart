import 'package:get/get.dart';
import 'controller.dart';

class SignupProcessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupProcessController>(() => SignupProcessController());
  }
}
