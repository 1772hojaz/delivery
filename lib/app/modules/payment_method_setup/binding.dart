import 'package:get/get.dart';
import 'controller.dart';

class PaymentMethodSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentMethodSetupController>(() => PaymentMethodSetupController());
  }
}
