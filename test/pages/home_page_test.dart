import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_test_implementation/pages/home_page.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('Home Page Test', (tester) async {
    // arrange
    await loadAppFonts();
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletLandscape,
        Device.tabletPortrait,
      ])
      ..addScenario(
        name: 'No Text',
        widget: const HomePage(),
      )
      ..addScenario(
        name: 'Password Hided',
        widget: const HomePage(),
        onCreate: (scenarioWidgetKey) async {
          final txt =
              find.descendant(of: find.byKey(scenarioWidgetKey), matching: find.byKey(const Key('MyTextboxWidgetKey')));
          expect(txt, findsWidgets);
          await tester.enterText(txt.first, '123');
        },
      )
      ..addScenario(
        name: 'Password Showed',
        widget: const HomePage(),
        onCreate: (scenarioWidgetKey) async {
          final txt =
              find.descendant(of: find.byKey(scenarioWidgetKey), matching: find.byKey(const Key('MyTextboxWidgetKey')));
          expect(txt, findsWidgets);
          final icon = find.descendant(of: txt, matching: find.byType(IconButton));

          expect(icon, findsOneWidget);
          await tester.enterText(txt.first, '123');
          await tester.tap(icon);
        },
      );

    // act
    await tester.pumpDeviceBuilder(builder);

    // assert
    await screenMatchesGolden(tester, 'home_page_test');
  });
}
