import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/controller.dart' show FoodSummary, kDummyFoodItems;

class ExploreMenuFilteredController extends GetxController {
  final searchController = TextEditingController();

  /// See explore_restaurant_filtered/controller.dart: filter selections
  /// aren't threaded through navigation arguments, so this screen seeds a
  /// representative active-filter set locally and narrows the dummy catalog
  /// to demonstrate the filtered state.
  final activeFilters = <String>['Healthy', 'Rating 4.5+', 'Under \$10'].obs;

  List<FoodSummary> get foodItems {
    if (activeFilters.isEmpty) return kDummyFoodItems;
    return kDummyFoodItems.where((f) => f.rating >= 4.5).toList();
  }

  void removeFilter(String filter) => activeFilters.remove(filter);

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
