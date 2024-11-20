import 'package:golden_test_implementation/pages/widgets/logo_widget.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('Logo Widget - Golden Test', (tester) async {
    // arrange
    await loadAppFonts();

    final builder = GoldenBuilder.column()
      ..addScenario(
        'Logo Widget - Parameter LogoColor.flutter',
        const LogoWidget(color: LogoColor.flutter),
      )
      ..addScenario(
        'Logo Widget - Parameter LogoColor.csharp',
        const LogoWidget(color: LogoColor.csharp),
      );

    // act
    await tester.pumpWidgetBuilder(builder.build());

    // assert
    await screenMatchesGolden(tester, 'logo_widget');
  });
}
