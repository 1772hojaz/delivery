import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:food_delivery/app/core/theme/app_theme.dart';

void main() {
  test('Light and dark themes are distinct and well-formed', () {
    expect(AppTheme.light.brightness, Brightness.light);
    expect(AppTheme.dark.brightness, Brightness.dark);
    expect(AppTheme.light.colorScheme.primary, isNot(AppTheme.dark.colorScheme.primary));
  });
}
