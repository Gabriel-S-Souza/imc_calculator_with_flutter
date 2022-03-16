import 'package:flutter/material.dart';

//Função que retorna o widget de texto que se repete
Widget _getText(String _text, double _size, Color _color) {
  return Text(_text,
      style: TextStyle(
        color: _color,
        fontSize: _size,
      ));
}

double calculaImc(double peso, double altura) {
  final double imc;
  imc = peso / (altura * altura);
  return imc;
}