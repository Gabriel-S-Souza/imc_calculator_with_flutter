import 'package:calculadora_de_imc/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora de IMC",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
        ).copyWith(
          secondary: Colors.deepPurple,
          outline: const Color.fromRGBO(124, 77, 255, 120),
        ),
        textTheme: TextTheme(
          headline5: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
          bodyText1: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
          button: const TextStyle(
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: const TextStyle(
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.bold,
          ),          
        )
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
