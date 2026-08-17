import 'package:get/get.dart';
import 'controller.dart';

class DetailMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMenuController>(() => DetailMenuController());
  }
}
