import 'package:get/get.dart';
import 'controller.dart';

class UploadPreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadPreviewController>(() => UploadPreviewController());
  }
}
