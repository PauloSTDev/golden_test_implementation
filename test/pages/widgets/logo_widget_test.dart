import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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

  // Alchemist Golden Test
  group('ListTile Golden Tests', () {
    goldenTest(
      'renders correctly',
      fileName: 'list_tile',
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints(maxWidth: 600),
        children: [
          GoldenTestScenario(
            name: 'with title',
            child: const ListTile(title: Text('ListTile.title')),
          ),
          GoldenTestScenario(
            name: 'with title and subtitle',
            child: const ListTile(
              title: Text('ListTile.title'),
              subtitle: Text('ListTile.subtitle'),
            ),
          ),
          GoldenTestScenario(
            name: 'with trailing icon',
            child: const ListTile(
              title: Text('ListTile.title'),
              trailing: Icon(Icons.chevron_right_rounded),
            ),
          ),
        ],
      ),
    );

    goldenTest(
      'ElevatedButton renders tap indicator when pressed',
      fileName: 'elevated_button_pressed',
      whilePerforming: press(find.byType(ElevatedButton)),
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'pressed',
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Pressed'),
            ),
          ),
        ],
      ),
    );
  });
}
