import 'package:flutter/material.dart';

class CustomLeftBorderText extends StatelessWidget {
  final String text;

  const CustomLeftBorderText({
    Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14, bottom: 14),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
        color: Colors.deepPurple[200]!,
        width: 4,
      ))),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
          ),
        ),
      ),
    );
  }
}
