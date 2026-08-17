import 'package:get/get.dart';
import 'controller.dart';

class YourOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YourOrdersController>(() => YourOrdersController());
  }
}
