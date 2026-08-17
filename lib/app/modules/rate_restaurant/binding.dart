import 'package:get/get.dart';
import 'controller.dart';

class RateRestaurantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RateRestaurantController>(() => RateRestaurantController());
  }
}
