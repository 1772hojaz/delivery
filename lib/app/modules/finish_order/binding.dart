import 'package:get/get.dart';
import 'controller.dart';

class FinishOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinishOrderController>(() => FinishOrderController());
  }
}
