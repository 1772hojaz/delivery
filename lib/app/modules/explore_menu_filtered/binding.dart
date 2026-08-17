import 'package:get/get.dart';
import 'controller.dart';

class ExploreMenuFilteredBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreMenuFilteredController>(() => ExploreMenuFilteredController());
  }
}
