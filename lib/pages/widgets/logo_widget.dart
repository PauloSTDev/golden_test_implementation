import 'package:flutter/cupertino.dart';

class LogoWidget extends StatelessWidget {
  final LogoColor color;

  const LogoWidget({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Container(
        decoration: BoxDecoration(
          color: color == LogoColor.flutter ? _Color.flutter : _Color.csharp,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            'assets/pubdev.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class _Color {
  static const Color flutter = Color.fromARGB(255, 36, 109, 255);
  static const Color csharp = Color.fromARGB(255, 146, 30, 255);
}

enum LogoColor {
  flutter,
  csharp,
}
