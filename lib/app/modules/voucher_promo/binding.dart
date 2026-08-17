import 'package:get/get.dart';
import 'controller.dart';

class VoucherPromoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoucherPromoController>(() => VoucherPromoController());
  }
}
