import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/controller.dart' show RestaurantSummary, kDummyRestaurants;

class ExploreRestaurantFilteredController extends GetxController {
  final searchController = TextEditingController();

  /// Filters applied on the Filter screen aren't threaded through
  /// navigation arguments today (Apply just does `Get.offNamed(target)`),
  /// so this screen seeds a representative active-filter set locally and
  /// narrows the dummy catalog to demonstrate the filtered state.
  final activeFilters = <String>['Fast Food', 'Rating 4.5+', 'Nearby'].obs;

  List<RestaurantSummary> get restaurants {
    if (activeFilters.isEmpty) return kDummyRestaurants;
    return kDummyRestaurants.where((r) => r.rating >= 4.5).toList();
  }

  void removeFilter(String filter) => activeFilters.remove(filter);

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
