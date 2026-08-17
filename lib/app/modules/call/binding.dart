import 'package:get/get.dart';
import 'controller.dart';

class CallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CallController>(() => CallController());
  }
}
