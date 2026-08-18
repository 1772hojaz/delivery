import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/controllers/cart_controller.dart';
import 'app/core/theme/app_theme.dart';
import 'app/core/theme/theme_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/modules/onboarding/controller.dart' show OnboardingController;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(ThemeController(), permanent: true);
  Get.put(CartController(), permanent: true);
  final seenOnboarding = GetStorage().read<bool>(OnboardingController.onboardingSeenKey) ?? false;
  runApp(FoodNinjaApp(initialRoute: seenOnboarding ? Routes.signIn : Routes.onboarding));
}

class FoodNinjaApp extends StatelessWidget {
  const FoodNinjaApp({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FoodNinja',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeController.to.themeMode.value,
      initialRoute: initialRoute,
      getPages: AppPages.routes,
    );
  }
}
