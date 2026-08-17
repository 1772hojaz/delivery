import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Mid-checkout delivery-address picker ("1.37 Set Location"). Distinct from
/// the onboarding location screen (owned by another module/batch).
class SetLocationController extends GetxController {
  final searchController = TextEditingController();
  final selectedAddress = 'Jl. Kemang Raya No. 12, Jakarta Selatan'.obs;

  void useCurrentLocation() {
    selectedAddress.value = 'Current Location — Jl. Sudirman No. 45, Jakarta Pusat';
    Get.snackbar('Location updated', 'Using your current location', snackPosition: SnackPosition.BOTTOM);
  }

  void confirm() => Get.back();

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
