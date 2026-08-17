import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/controller.dart' show kDummyRestaurants;

class ExploreRestaurantController extends GetxController {
  final searchController = TextEditingController();

  final restaurants = kDummyRestaurants;

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
