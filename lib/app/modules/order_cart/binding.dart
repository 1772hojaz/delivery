import 'package:get/get.dart';
import 'controller.dart';

class OrderCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderCartController>(() => OrderCartController());
  }
}
