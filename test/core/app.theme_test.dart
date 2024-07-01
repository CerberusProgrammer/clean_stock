import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clean_stock/core/theme/app.theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Theme Provider Tests', () {
    test('colorProvider returns default color', () {
      final container = ProviderContainer();
      expect(container.read(colorProvider), equals(Colors.indigo));
    });

    test('brighnessProvider returns default brightness', () {
      final container = ProviderContainer();
      expect(container.read(brighnessProvider), equals(Brightness.light));
    });

    test('themeProvider generates expected ThemeData', () {
      final container = ProviderContainer();
      final themeData = container.read(themeProvider);
      expect(themeData.colorScheme.primary, equals(const Color(0xff515b92)));

      expect(themeData.brightness, equals(Brightness.light));

      final expectedTextTheme = GoogleFonts.manropeTextTheme(
        ThemeData(brightness: Brightness.light).textTheme,
      );
      expect(themeData.textTheme, equals(expectedTextTheme));
    });
  });
}
