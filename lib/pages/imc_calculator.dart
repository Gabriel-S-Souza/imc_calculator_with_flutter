import 'package:calculadora_de_imc/widgets/custom_alert_dialog.dart';
import 'package:calculadora_de_imc/widgets/custom_elevated_buttom.dart';
import 'package:calculadora_de_imc/widgets/custom_text_fields.dart';
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
    const List<String> category = [
      "Muito abaixo do peso",
      "Abaixo do peso",
      "Peso normal",
      "Acima do peso",
      "Obesidade I",
      "Obesidade II (severa)",
      "Obesidade III (mórbida)",
    ];
    const List<double> limitNumbers = [17, 18.49, 24.99, 29.99, 34.99, 39.99];
    double smallerLimitNumber = 0;

    for (var i = 0; i < category.length; i++) {
      if (imc >= smallerLimitNumber) {
        if (smallerLimitNumber == 39.99)  {
          _infoTextImc = category[i]; 
          break;
        } else if (imc < limitNumbers[i]) {
          _infoTextImc = category[i];
          break;
        }
        else {
        smallerLimitNumber = limitNumbers[i];
        }
      }
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 60,
                  bottom: MediaQuery.of(context).size.height / 12,
                ),
                child: Image.asset(
                  "assets/images/imc-men.png",
                  height: 80,
                ),
              ),
              CustomTextField(
                controller: _weightController,
                label: "Peso (Kg)",
              ),
              CustomTextField(
                controller: _heightController,
                label: "Altura (m)",
              ),
              CustomElevatedButtom(
                title: "Calcular",
                onPressed: () {
                  if (_weightController.text.isNotEmpty &&
                      _heightController.text.isNotEmpty) {
                    setState(() {
                      _imc = _calculateImc(
                          double.parse(
                              _weightController.text.replaceAll(',', '.')),
                          double.parse(
                              _heightController.text.replaceAll(',', '.')));
                      _getCategoryByImc(_imc!);
                    });
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return CustomAlertDialog(
                          title: "Seu Índice de Massa Corporal (IMC)",
                          imcResult: _imc!,
                          infoTextImc: _infoTextImc!,
                        );
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        tooltip: "Limpar campos",
        onPressed: () {
          _cleanFields();
        },
      ),
    );
  }
}
