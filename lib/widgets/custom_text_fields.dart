import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const CustomTextField({
    Key? key, 
    required this.controller, 
    required this.label,
  }) 
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: TextField(
        style: const TextStyle(height: 0.6),
        cursorHeight: 16,
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label,
            labelStyle: const TextStyle(
            )),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
