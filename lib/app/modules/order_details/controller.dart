import 'package:get/get.dart';
import '../../core/controllers/cart_controller.dart';

class OrderDetailsController extends GetxController {
  /// Read-only summary view over the same shared cart used by Order Cart,
  /// so quantities/totals stay consistent across both screens.
  CartController get cart => CartController.to;
}
