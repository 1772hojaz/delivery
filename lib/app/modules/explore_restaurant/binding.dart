import 'package:get/get.dart';
import 'controller.dart';

class ExploreRestaurantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreRestaurantController>(() => ExploreRestaurantController());
  }
}
