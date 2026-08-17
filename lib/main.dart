import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/theme/app_theme.dart';
import 'app/core/theme/theme_controller.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(ThemeController(), permanent: true);
  runApp(const FoodNinjaApp());
}

class FoodNinjaApp extends StatelessWidget {
  const FoodNinjaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        title: 'FoodNinja',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeController.to.themeMode.value,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
      ),
    );
  }
}
