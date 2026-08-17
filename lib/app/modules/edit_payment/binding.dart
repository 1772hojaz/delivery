import 'package:get/get.dart';
import 'controller.dart';

class EditPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPaymentController>(() => EditPaymentController());
  }
}
