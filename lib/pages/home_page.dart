import 'package:flutter/material.dart';
import 'package:golden_test_implementation/pages/widgets/logo_widget.dart';
import 'package:golden_test_implementation/pages/widgets/my_textbox_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hide = true;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Golden Test Implementation'),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: 250,
              child: MyTextboxWidget(
                key: const Key('MyTextboxWidgetKey'),
                eyeOnTap: () => setState(() => hide = !hide),
                obscureText: hide,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const LogoWidget(color: LogoColor.flutter)
        ],
      ),
    );
  }
}
