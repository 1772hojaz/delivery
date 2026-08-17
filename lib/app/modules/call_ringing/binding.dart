import 'package:get/get.dart';
import 'controller.dart';

class CallRingingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CallRingingController>(() => CallRingingController());
  }
}
