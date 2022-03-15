import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora de IMC",
      home: Column(
        children: [
          _getText("Calculadora de IMC", 30, Colors.white),
          _getText("Calculadora de IMC", 25, Colors.white),
          _getText("Calculadora de IMC", 20, Colors.white),
          _getText("Calculadora de IMC", 15, Colors.white),
          _getText("Calculadora de IMC", 10, Colors.white),
        ],
      ),
    );
  }
}

//Função que retorna o widget de texto que se repete
Widget _getText(String _text, double _size, Color _color) {
  return Text(
    _text,
    style: TextStyle(
      color: _color,
      fontSize: _size,
    )
  );
}
