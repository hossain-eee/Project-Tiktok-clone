import 'package:flutter/material.dart';
import 'package:tiktok_clone/constant.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObsecure;
  final IconData icon;
  const TextInputField({super.key, required this.controller, required this.labelText, required this.isObsecure, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObsecure,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: const TextStyle(
          fontSize: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: borderColor,
          ),
        ),
      ),
    );
  }
}
