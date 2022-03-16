import 'dart:math';

import 'package:calculadora_de_imc/methods.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Definindo abaixo os controladores para os inputs
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  double? imc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        //Adiciona um Widget com o padding especificado e insere a Column como filho
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          //Essa configuração abaixo faz com que todos os filhos sejam
          //esticados até os limites do pai no eixo cruzado:
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(
              Icons.sports_gymnastics,
              size: 120,
              color: Colors.grey,
            ),
            TextField(
              controller: _pesoController,
              decoration: const InputDecoration(
                  labelText: "Peso (Kg)",
                  labelStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                  )),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _alturaController,
              decoration: const InputDecoration(
                  labelText: "Altura (m)",
                  labelStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                  )),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if(_pesoController.text.isNotEmpty && _alturaController.text.isNotEmpty) {
                        imc = calculaImc(double.parse(_pesoController.text), double.parse(_alturaController.text));
                        print("setState");
                      } else {
                        print("estring Vazia");
                      }

                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurpleAccent, //cor do fundo
                    // onPrimary:
                  ),
                  child: const Text(
                    "Calcular",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              imc != null ? "$imc" : "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 07, 0, 77),
                fontSize: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
