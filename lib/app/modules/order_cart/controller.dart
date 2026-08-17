import 'package:get/get.dart';
import '../../core/controllers/cart_controller.dart';

class OrderCartController extends GetxController {
  /// Single shared cart instance — see [CartController] docs. Exposed here so
  /// the view only ever talks to `controller.cart`, keeping the GetX MVC
  /// pattern consistent with the rest of the app.
  CartController get cart => CartController.to;
}
