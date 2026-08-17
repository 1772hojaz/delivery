import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:food_delivery/app/core/theme/theme_controller.dart';
import 'package:food_delivery/main.dart';

void main() {
  testWidgets('App boots to the splash screen', (WidgetTester tester) async {
    // Explicit path avoids path_provider platform channels, which aren't
    // available in the widget-test VM environment.
    await GetStorage('GetStorage', Directory.systemTemp.path).initStorage;
    Get.put(ThemeController(), permanent: true);

    await tester.pumpWidget(const FoodNinjaApp());
    await tester.pump();

    expect(find.text('FoodNinja'), findsOneWidget);
  });
}
