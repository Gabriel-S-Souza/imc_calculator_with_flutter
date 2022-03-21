import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String path;

  const CustomImage({
    Key? key, 
    required this.path
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 14),
      child: Image.asset(
        path,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
