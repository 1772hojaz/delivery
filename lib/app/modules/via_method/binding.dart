import 'package:get/get.dart';
import 'controller.dart';

class ViaMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViaMethodController>(() => ViaMethodController());
  }
}
