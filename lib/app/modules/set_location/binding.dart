import 'package:get/get.dart';
import 'controller.dart';

class SetLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetLocationController>(() => SetLocationController());
  }
}
