import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditLocationController extends GetxController {
  final orderLocationController = TextEditingController(text: '4517 Washington Ave, Manchester, Kentucky');
  final deliverLocationController = TextEditingController(text: '3891 Ranchview Dr, Richardson, California');

  @override
  void onClose() {
    orderLocationController.dispose();
    deliverLocationController.dispose();
    super.onClose();
  }

  void save() => Get.back();
}
