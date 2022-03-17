import 'package:calculadora_de_imc/my_app.dart';
import 'package:flutter/material.dart';

class MyAppState extends State<MyApp> {
  //Definindo abaixo os controladores para os inputs
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  final String _infoTextLabel = "Seu índice de massa corporal:";
  String? _infoTextImc;
  double? _imc;

  double _calculateImc(double weight, double height) {
    final double imc;
    imc = weight / (height * height);
    return double.parse((imc).toStringAsFixed(2));
  }

  void _getCategoryByImc(double imc) {
    if (imc < 17) {
      _infoTextImc = "Muito abaixo do peso";
    } else if (imc >= 17 && imc < 18.49) {
      _infoTextImc = "Abiaxo do peso";
    } else if (imc >= 18.49 && imc < 24.99) {
      _infoTextImc = "Peso normal";
    } else if (imc >= 24.99 && imc < 29.99) {
      _infoTextImc = "Acima do peso";
    } else if (imc >= 29.99 && imc < 34.99) {
      _infoTextImc = "Obesidade I";
    } else if (imc >= 34.99 && imc < 39.99) {
      _infoTextImc = "Obesidade II (severa)";
    } else if (imc > 39.99) {
      _infoTextImc = "Obesidade III (mórbida)";
    }
  }

  void _cleanFields() {
    _weightController.text = "";
    _heightController.text = "";
    setState(() {
      _imc = null;
      _infoTextImc = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            color: const Color.fromARGB(130, 255, 255, 255),
            tooltip: 'Limpar campos',
            onPressed: _cleanFields,
          ),
        ],
      ),
      body: Padding(
        //Adiciona um Widget com o padding especificado e insere o Column como filho
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
              controller: _weightController,
              decoration: const InputDecoration(
                  labelText: "Peso (Kg)",
                  labelStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                  )),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _heightController,
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
                      if (_weightController.text.isNotEmpty &&
                          _heightController.text.isNotEmpty) {
                        _imc = _calculateImc(
                            double.parse(
                                _weightController.text.replaceAll(',', '.')),
                            double.parse(
                                _heightController.text.replaceAll(',', '.')));
                        _getCategoryByImc(_imc!);
                      } else {
                        _imc = null;
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
              _imc != null ? _infoTextLabel : "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            Text(
              _imc != null ? "$_imc" : "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.deepPurple,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _imc != null ? "\u{24D8} $_infoTextImc" : "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
