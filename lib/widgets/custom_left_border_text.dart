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
        gradient: LinearGradient(
          stops: const [0.015, 0.015],
          colors: [
            Theme.of(context).colorScheme.outline, 
            Theme.of(context).canvasColor
          ]
      ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          bottomLeft: Radius.circular(4)
        )
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
