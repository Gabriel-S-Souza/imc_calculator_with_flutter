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
        style: Theme.of(context).textTheme.titleMedium
      ),
      content: SizedBox(
        height: (MediaQuery.of(context).size.height) / 8,
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$imcResult",
                style: Theme.of(context).textTheme.headlineLarge
              ),
              Text(
                "\u{24D8} $infoTextImc",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "OK",
          ),
          style: Theme.of(context).outlinedButtonTheme.style,
        ),
      ],
    );
  }
}
