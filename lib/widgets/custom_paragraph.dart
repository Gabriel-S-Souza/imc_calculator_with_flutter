import 'package:flutter/material.dart';

class CustomParagraph extends StatelessWidget {
  final String text;

  const CustomParagraph({
    Key? key, 
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 14),
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}
