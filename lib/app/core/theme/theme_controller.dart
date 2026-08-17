import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// Persists the user's light/dark preference (defaults to system) so the
/// theme toggle survives app restarts. Screens read `Get.isDarkMode` /
/// `context.appColors` rather than branching on this controller directly.
class ThemeController extends GetxController {
  static ThemeController get to => Get.find();

  final _box = GetStorage();
  static const _key = 'theme_mode';

  final themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    final saved = _box.read<String>(_key);
    themeMode.value = switch (saved) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  void toggle() {
    final isDark = Get.isDarkMode;
    setMode(isDark ? ThemeMode.light : ThemeMode.dark);
  }

  void setMode(ThemeMode mode) {
    themeMode.value = mode;
    Get.changeThemeMode(mode);
    _box.write(_key, mode.name);
  }
}
