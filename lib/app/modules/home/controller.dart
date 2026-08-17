import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/controllers/cart_controller.dart';
import '../../core/widgets/bottom_nav_bar.dart';
import '../../routes/app_routes.dart';

/// Lightweight card model shared by Home / Explore Restaurant screens.
/// Kept here (rather than duplicated per-module) since Home is the natural
/// "owner" of the dummy catalog used across this batch's screens.
class RestaurantSummary {
  const RestaurantSummary({
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.distanceKm,
    required this.deliveryMins,
    required this.icon,
    required this.gradientColors,
  });

  final String name;
  final String cuisine;
  final double rating;
  final double distanceKm;
  final int deliveryMins;
  final IconData icon;
  final List<Color> gradientColors;
}

/// Lightweight card model shared by Home / Explore Menu screens.
class FoodSummary {
  const FoodSummary({
    required this.name,
    required this.restaurant,
    required this.price,
    required this.rating,
    required this.icon,
    required this.gradientColors,
  });

  final String name;
  final String restaurant;
  final double price;
  final double rating;
  final IconData icon;
  final List<Color> gradientColors;
}

const kDummyRestaurants = <RestaurantSummary>[
  RestaurantSummary(
    name: 'Burger King',
    cuisine: 'Burger · Fast Food',
    rating: 4.8,
    distanceKm: 1.2,
    deliveryMins: 20,
    icon: Icons.lunch_dining_rounded,
    gradientColors: [Color(0xFFFFB199), Color(0xFFFF7C32)],
  ),
  RestaurantSummary(
    name: 'Pizza Hut',
    cuisine: 'Pizza · Italian',
    rating: 4.6,
    distanceKm: 2.4,
    deliveryMins: 25,
    icon: Icons.local_pizza_rounded,
    gradientColors: [Color(0xFFFFD86B), Color(0xFFFEAD1D)],
  ),
  RestaurantSummary(
    name: 'Sushi Master',
    cuisine: 'Japanese · Sushi',
    rating: 4.9,
    distanceKm: 3.1,
    deliveryMins: 30,
    icon: Icons.set_meal_rounded,
    gradientColors: [Color(0xFF53E88B), Color(0xFF15BE77)],
  ),
  RestaurantSummary(
    name: 'Green Bowl',
    cuisine: 'Healthy · Salad',
    rating: 4.5,
    distanceKm: 1.8,
    deliveryMins: 18,
    icon: Icons.eco_rounded,
    gradientColors: [Color(0xFF9BE8A4), Color(0xFF15BE77)],
  ),
  RestaurantSummary(
    name: 'Taco Fiesta',
    cuisine: 'Mexican · Tacos',
    rating: 4.4,
    distanceKm: 4.0,
    deliveryMins: 35,
    icon: Icons.tapas_rounded,
    gradientColors: [Color(0xFFFFB199), Color(0xFFFEAD1D)],
  ),
  RestaurantSummary(
    name: 'Brew Lab',
    cuisine: 'Coffee · Bakery',
    rating: 4.7,
    distanceKm: 0.9,
    deliveryMins: 15,
    icon: Icons.emoji_food_beverage_rounded,
    gradientColors: [Color(0xFF53E88B), Color(0xFFFEAD1D)],
  ),
];

const kDummyFoodItems = <FoodSummary>[
  FoodSummary(
    name: 'Cheese Burger',
    restaurant: 'Burger King',
    price: 8.5,
    rating: 4.8,
    icon: Icons.lunch_dining_rounded,
    gradientColors: [Color(0xFFFFB199), Color(0xFFFF7C32)],
  ),
  FoodSummary(
    name: 'Pepperoni Pizza',
    restaurant: 'Pizza Hut',
    price: 12.0,
    rating: 4.6,
    icon: Icons.local_pizza_rounded,
    gradientColors: [Color(0xFFFFD86B), Color(0xFFFEAD1D)],
  ),
  FoodSummary(
    name: 'Salmon Sushi Roll',
    restaurant: 'Sushi Master',
    price: 15.5,
    rating: 4.9,
    icon: Icons.set_meal_rounded,
    gradientColors: [Color(0xFF53E88B), Color(0xFF15BE77)],
  ),
  FoodSummary(
    name: 'Iced Matcha Latte',
    restaurant: 'Brew Lab',
    price: 5.0,
    rating: 4.7,
    icon: Icons.emoji_food_beverage_rounded,
    gradientColors: [Color(0xFF9BE8A4), Color(0xFF15BE77)],
  ),
  FoodSummary(
    name: 'Garden Salad Bowl',
    restaurant: 'Green Bowl',
    price: 7.0,
    rating: 4.5,
    icon: Icons.eco_rounded,
    gradientColors: [Color(0xFF9BE8A4), Color(0xFF15BE77)],
  ),
  FoodSummary(
    name: 'Beef Tacos',
    restaurant: 'Taco Fiesta',
    price: 9.5,
    rating: 4.4,
    icon: Icons.tapas_rounded,
    gradientColors: [Color(0xFFFFB199), Color(0xFFFEAD1D)],
  ),
];

class HomeController extends GetxController {
  final searchController = TextEditingController();

  final CartController cart = CartController.to;

  final nearestRestaurants = kDummyRestaurants;
  final popularMenu = kDummyFoodItems;

  void onTabTap(MainTab tab) {
    switch (tab) {
      case MainTab.home:
        break;
      case MainTab.profile:
        Get.offNamed(Routes.profile);
        break;
      case MainTab.cart:
        Get.offNamed(Routes.orderCart);
        break;
      case MainTab.chat:
        Get.offNamed(Routes.message);
        break;
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
