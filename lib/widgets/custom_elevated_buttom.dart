import 'package:flutter/material.dart';

class CustomElevatedButtom extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomElevatedButtom({
    Key? key,
    required this.title, 
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurpleAccent,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        onPressed: onPressed
      ),
    );
  }
}
