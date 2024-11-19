import 'package:golden_test_implementation/pages/widgets/my_textbox_widget.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('MyTextboxWidget - Password Input', (tester) async {
    //arrange
    await loadAppFonts();
    final builder = GoldenBuilder.grid(
      columns: 2,
      widthToHeightRatio: 1,
    )
      ..addScenario(
        "Password Empty",
        const MyTextboxWidget(),
      )
      ..addScenario(
        "Password Hided",
        const MyTextboxWidget(obscureText: true, initialValue: 'Teste'),
      )
      ..addScenario(
        "Password Showed",
        const MyTextboxWidget(obscureText: false, initialValue: 'Teste'),
      );

    //act
    await tester.pumpWidgetBuilder(builder.build());

    //assert
    await screenMatchesGolden(tester, 'my_textbox_widget_password_input_test');
  });
}
