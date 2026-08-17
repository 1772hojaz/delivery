import 'package:get/get.dart';
import 'controller.dart';

class ExploreRestaurantFilteredBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreRestaurantFilteredController>(() => ExploreRestaurantFilteredController());
  }
}
