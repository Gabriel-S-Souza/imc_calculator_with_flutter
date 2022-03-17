import 'package:flutter/material.dart';

class ImcInfoPage extends StatefulWidget {
  const ImcInfoPage({ Key? key }) : super(key: key);

  @override
  State<ImcInfoPage> createState() => _ImcInfoPageState();
}

class _ImcInfoPageState extends State<ImcInfoPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Imc Info"
        ),
      ),
    );
  }
}