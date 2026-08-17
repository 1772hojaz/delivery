import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/controllers/cart_controller.dart';
import '../../routes/app_routes.dart';

/// Controls the single food-item screen ("1.41 Detail menu" / "1.42 Detail
/// menu Scrool Mode" in Figma — despite the node name this is one dish's
/// page, not a menu listing).
class DetailMenuController extends GetxController {
  final scrollController = ScrollController();
  final isFavorite = false.obs;
  final quantity = 1.obs;

  static const _id = 'menu_grilled_veggie_bowl';
  final name = 'Grilled Veggie Bowl';
  final subtitle = 'Fresh & healthy';
  final price = 12.50;
  final heroAsset = 'assets/images/detail/food_hero.png';
  final rating = 4.9;
  final orderCount = 214;
  final description =
      'A vibrant bowl of seasonal grilled vegetables tossed with fresh herbs '
      'and a light citrus vinaigrette, served over fluffy quinoa. Light, '
      'wholesome and packed with flavor.';
  final ingredients = const <String>[
    'Grilled zucchini & bell peppers',
    'Cherry tomatoes',
    'Fluffy quinoa',
    'Herb vinaigrette',
    'Toasted almonds',
  ];

  void increment() => quantity.value++;

  void decrement() {
    if (quantity.value > 1) quantity.value--;
  }

  void toggleFavorite() => isFavorite.value = !isFavorite.value;

  void showLocationInfo() {
    Get.snackbar('Restaurant', 'Fresh Cabbage Store · 1.2 km away', snackPosition: SnackPosition.BOTTOM);
  }

  void addToCart() {
    for (var i = 0; i < quantity.value; i++) {
      CartController.to.addItem(
        CartItem(id: _id, name: name, subtitle: subtitle, price: price, imageAsset: heroAsset),
      );
    }
    Get.snackbar(
      'Added to cart',
      '$name ×${quantity.value} added to your cart',
      snackPosition: SnackPosition.BOTTOM,
    );
    Get.toNamed(Routes.orderCart);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
