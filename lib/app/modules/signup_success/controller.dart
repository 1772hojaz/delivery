import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/app_routes.dart';

class SignupSuccessController extends GetxController {
  void onStartOrdering() {
    GetStorage().write('onboarding_seen', true);
    Get.offAllNamed(Routes.home);
  }
}
