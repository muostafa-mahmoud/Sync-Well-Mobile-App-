// lib/widgets/common/app_input.dart
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscure;
  const AppInput({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(labelText: label, hintText: hint),
      ),
    );
  }
}
