import 'package:get/get.dart';
import 'controller.dart';

class TrackOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackOrderController>(() => TrackOrderController());
  }
}
