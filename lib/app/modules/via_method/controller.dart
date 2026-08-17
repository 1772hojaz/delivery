import 'package:get/get.dart';
import '../../routes/app_routes.dart';

enum VerificationMethod { sms, email }

class ViaMethodController extends GetxController {
  final Rx<VerificationMethod> selectedMethod = VerificationMethod.email.obs;

  void select(VerificationMethod method) => selectedMethod.value = method;

  void continueTapped() {
    Get.toNamed(Routes.verificationCode, arguments: Routes.createPassword);
  }
}
