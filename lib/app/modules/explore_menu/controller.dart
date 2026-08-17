import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/controller.dart' show kDummyFoodItems;

class ExploreMenuController extends GetxController {
  final searchController = TextEditingController();

  final foodItems = kDummyFoodItems;

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
