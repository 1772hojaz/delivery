import 'package:get/get.dart';
import 'controller.dart';

class RateFoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RateFoodController>(() => RateFoodController());
  }
}
