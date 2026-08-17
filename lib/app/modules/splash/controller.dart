import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/app_routes.dart';

class SplashController extends GetxController {
  static const onboardingSeenKey = 'onboarding_seen';

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 1400), _navigateNext);
  }

  void _navigateNext() {
    final seenOnboarding = GetStorage().read<bool>(onboardingSeenKey) ?? false;
    Get.offAllNamed(seenOnboarding ? Routes.signIn : Routes.onboarding);
  }
}
