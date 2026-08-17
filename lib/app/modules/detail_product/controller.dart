import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A single card in the restaurant's "Popular Menu" horizontal list.
class PopularMenuItem {
  const PopularMenuItem({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.imageAsset,
  });

  final String id;
  final String name;
  final String subtitle;
  final double price;
  final String imageAsset;
}

/// Controls the restaurant detail screen ("Detail product" in Figma).
/// Hosts the [scrollController] driving the SliverAppBar collapsing hero.
class DetailProductController extends GetxController {
  final scrollController = ScrollController();
  final isFavorite = false.obs;

  final restaurantName = 'Fresh Cabbage Store';
  final heroAsset = 'assets/images/detail/restaurant_hero.png';
  final rating = 4.8;
  final distanceKm = 1.2;
  final description =
      'A cozy neighborhood spot serving fresh, locally sourced produce and '
      'hearty comfort food, prepared daily with a focus on quality '
      'ingredients and warm hospitality. Open every day for lunch and dinner.';

  final popularMenu = const <PopularMenuItem>[
    PopularMenuItem(
      id: 'menu_grilled_veggie_bowl',
      name: 'Grilled Veggie Bowl',
      subtitle: 'Fresh & healthy',
      price: 12.50,
      imageAsset: 'assets/images/detail/menu_item_1.png',
    ),
    PopularMenuItem(
      id: 'menu_double_cheese_burger',
      name: 'Double Cheese Burger',
      subtitle: 'Beef · Cheddar',
      price: 9.90,
      imageAsset: 'assets/images/detail/menu_item_2.png',
    ),
    PopularMenuItem(
      id: 'menu_citrus_glazed_salmon',
      name: 'Citrus Glazed Salmon',
      subtitle: 'Chef special',
      price: 15.00,
      imageAsset: 'assets/images/detail/menu_item_3.png',
    ),
    PopularMenuItem(
      id: 'menu_avocado_toast',
      name: 'Avocado Toast',
      subtitle: 'Breakfast favorite',
      price: 7.20,
      imageAsset: 'assets/images/detail/menu_item_4.png',
    ),
  ];

  void toggleFavorite() => isFavorite.value = !isFavorite.value;

  void showLocationInfo() {
    Get.snackbar(
      'Restaurant location',
      '${distanceKm.toStringAsFixed(1)} km away from you',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
