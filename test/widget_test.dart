import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:food_delivery/app/core/theme/theme_controller.dart';
import 'package:food_delivery/main.dart';

void main() {
  testWidgets('App boots to the splash screen', (WidgetTester tester) async {
    await GetStorage.init();
    Get.put(ThemeController(), permanent: true);

    await tester.pumpWidget(const FoodNinjaApp());
    await tester.pump();

    expect(find.text('FoodNinja'), findsOneWidget);
  });
}
