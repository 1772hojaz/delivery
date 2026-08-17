import 'package:get/get.dart';
import 'controller.dart';

class PaymentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentsController>(() => PaymentsController());
  }
}
