import 'package:flutter/material.dart';

class ImcCalculator extends StatefulWidget {
  const ImcCalculator({Key? key}) : super(key: key);

  @override
  State<ImcCalculator> createState() => ImcCalculatorState();
}

class ImcCalculatorState extends State<ImcCalculator> {
  //Definindo abaixo os controladores para os inputs
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

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
      body: Padding(
        //Adiciona um Widget com o padding especificado e insere o Column como filho
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        child: SizedBox(
          height: (MediaQuery.of(context).size.height) / 1.5,
          child: Column(
            //Essa configuração abaixo faz com que todos os filhos sejam
            //esticados até os limites do pai no eixo cruzado:
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  const Icon(
                    Icons.sports_gymnastics,
                    size: 120,
                    color: Colors.black54,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                        iconSize: 32,
                        icon: const Icon(Icons.refresh),
                        color: Colors.black26,
                        tooltip: "Limpar campos",
                        onPressed: () {
                          _cleanFields();
                        }),
                  ),
                ],
              ),
              TextField(
                controller: _weightController,
                decoration: const InputDecoration(
                    labelText: "Peso (Kg)",
                    labelStyle: TextStyle(
                      color: Colors.deepPurple,
                    )),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _heightController,
                decoration: const InputDecoration(
                    labelText: "Altura (m)",
                    labelStyle: TextStyle(
                      color: Colors.deepPurple,
                    )),
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
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
                    onPressed: () {
                      if (_weightController.text.isNotEmpty &&
                          _heightController.text.isNotEmpty) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                "Seu índice de massa corporal:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              content: SizedBox(
                                height:
                                    (MediaQuery.of(context).size.height) / 8,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "$_imc",
                                      style: const TextStyle(
                                        // color: Color(0xFF1B998B),
                                        color: Colors.deepPurpleAccent,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "\u{24D8} $_infoTextImc",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "OK",
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        Colors.deepPurpleAccent, //cor do fundo
                                    // onPrimary:
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                        setState(() {
                          _imc = _calculateImc(
                              double.parse(
                                  _weightController.text.replaceAll(',', '.')),
                              double.parse(
                                  _heightController.text.replaceAll(',', '.')));
                          _getCategoryByImc(_imc!);
                        });
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
