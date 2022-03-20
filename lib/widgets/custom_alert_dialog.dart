import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final double imcResult;
  final String infoTextImc;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.imcResult, 
    required this.infoTextImc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      content: SizedBox(
        height: (MediaQuery.of(context).size.height) / 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "$imcResult",
              style: const TextStyle(
                // color: Color(0xFF1B998B),
                color: Colors.deepPurpleAccent,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "\u{24D8} $infoTextImc",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "OK",
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurpleAccent, //cor do fundo
            // onPrimary:
          ),
        ),
      ],
    );
  }
}
