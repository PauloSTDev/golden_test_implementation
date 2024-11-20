import 'package:flutter/material.dart';

class MyTextboxWidget extends StatelessWidget {
  const MyTextboxWidget({
    super.key,
    this.eyeOnTap,
    this.obscureText = true,
    this.initialValue = '',
  });

  final VoidCallback? eyeOnTap;
  final bool obscureText;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      initialValue: initialValue,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: Colors.yellow,
        // labelText: 'Custom Text2',
        labelText: 'Custom Text',
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: eyeOnTap,
        ),
      ),
    );
  }
}
