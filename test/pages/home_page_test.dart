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
        name: 'First Test',
        widget: const HomePage(),
      );

    // act
    await tester.pumpDeviceBuilder(builder);

    // assert
    await screenMatchesGolden(tester, 'home_page_test');
  });
}
