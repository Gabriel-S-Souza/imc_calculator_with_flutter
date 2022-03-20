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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  //TODO: Substituir e reposicionar icone
                  Padding(
                    padding: EdgeInsets.only(
                      top: 60, 
                      bottom: MediaQuery.of(context).size.height/12,
                      ),
                    child: Image.asset(
                      "assets/images/imc-men.png",
                      width: 80,
                    ),
                  ),
                ],
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
                          double.parse(_weightController.text.replaceAll(',', '.')),
                          double.parse(_heightController.text.replaceAll(',', '.')));
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
