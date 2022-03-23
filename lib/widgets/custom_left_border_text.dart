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
      decoration: const BoxDecoration(
        border: Border(
              left: BorderSide(
        color: Color.fromRGBO(83, 109, 254, 100),
        width: 4,
      ))),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyText2,
          // style: const TextStyle(
          //   fontSize: 16,
          //   color: Color.fromRGBO(0, 0, 0, 86),
          // ),
        ),
      ),
    );
  }
}
