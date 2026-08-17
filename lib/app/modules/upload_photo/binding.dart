import 'package:get/get.dart';
import 'controller.dart';

class UploadPhotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadPhotoController>(() => UploadPhotoController());
  }
}
