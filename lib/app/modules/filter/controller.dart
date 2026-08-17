import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  final categories = const <String>[
    'Fast Food',
    'Bakery',
    'Beverage',
    'Dessert',
    'Healthy',
    'Seafood',
    'Vegan',
    'Asian',
  ];

  final selectedCategories = <String>{'Fast Food'}.obs;
  final priceRange = const RangeValues(5, 40).obs;
  final minRating = 3.5.obs;
  final maxDistanceKm = 5.0.obs;

  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
  }

  void reset() {
    selectedCategories
      ..clear()
      ..add('Fast Food');
    priceRange.value = const RangeValues(5, 40);
    minRating.value = 3.5;
    maxDistanceKm.value = 5.0;
  }

  void apply() {
    final target = Get.arguments as String?;
    if (target != null) {
      Get.offNamed(target);
    } else {
      Get.back();
    }
  }
}
