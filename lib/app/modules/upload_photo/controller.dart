import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class UploadPhotoController extends GetxController {
  final hasPhoto = false.obs;

  void pickFromCamera() {
    hasPhoto.value = true;
    Get.snackbar('Photo captured', 'Looking good! Tap Next to continue.');
  }

  void pickFromGallery() {
    hasPhoto.value = true;
    Get.snackbar('Photo selected', 'Looking good! Tap Next to continue.');
  }

  void onNext() => Get.offNamed(Routes.uploadPreview);
}
