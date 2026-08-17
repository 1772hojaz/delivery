import 'package:get/get.dart';

class CartItem {
  CartItem({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.imageAsset,
    int quantity = 1,
  }) : quantity = quantity.obs;

  final String id;
  final String name;
  final String subtitle;
  final double price;
  final String imageAsset;
  final RxInt quantity;

  double get total => price * quantity.value;
}

/// App-wide cart, shared by the Home/bottom-nav badge, the Order Cart screen,
/// Payments and Order Details so quantity changes reflect everywhere.
class CartController extends GetxController {
  static CartController get to => Get.find();

  final items = <CartItem>[].obs;

  int get itemCount => items.fold(0, (sum, i) => sum + i.quantity.value);
  double get subtotal => items.fold(0, (sum, i) => sum + i.total);
  double get deliveryCharge => items.isEmpty ? 0 : 10;
  double get discount => 0;
  double get total => subtotal + deliveryCharge - discount;

  void addItem(CartItem item) {
    final existing = items.firstWhereOrNull((i) => i.id == item.id);
    if (existing != null) {
      existing.quantity.value++;
      items.refresh();
    } else {
      items.add(item);
    }
  }

  void increment(String id) {
    items.firstWhereOrNull((i) => i.id == id)?.quantity.value++;
  }

  void decrement(String id) {
    final item = items.firstWhereOrNull((i) => i.id == id);
    if (item == null) return;
    if (item.quantity.value <= 1) {
      items.remove(item);
    } else {
      item.quantity.value--;
    }
  }

  void removeItem(String id) {
    items.removeWhere((i) => i.id == id);
  }

  void clear() => items.clear();
}
