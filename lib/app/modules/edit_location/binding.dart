import 'package:get/get.dart';
import 'controller.dart';

class EditLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditLocationController>(() => EditLocationController());
  }
}
