import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: const <Widget>[
          Icon(
            Icons.sports_gymnastics,
            size: 120,
            color: Colors.grey,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Peso (Kg)",
              labelStyle: TextStyle(
                color: Colors.deepPurpleAccent,
              )
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}