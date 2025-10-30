// lib/widgets/common/app_button.dart
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  const AppButton({super.key, required this.text, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: color != null ? ElevatedButton.styleFrom(backgroundColor: color) : null,
      child: Text(text),
    );
  }
}
