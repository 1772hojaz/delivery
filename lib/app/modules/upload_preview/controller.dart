import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class UploadPreviewController extends GetxController {
  void onRetake() => Get.back();

  void onConfirm() => Get.offNamed(Routes.paymentMethodSetup);
}
