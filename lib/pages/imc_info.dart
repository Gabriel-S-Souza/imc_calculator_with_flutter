import 'package:calculadora_de_imc/contents/text_contents.dart';
import 'package:calculadora_de_imc/widgets/custom_left_border_text.dart';
import 'package:calculadora_de_imc/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class ImcInfoPage extends StatefulWidget {
  const ImcInfoPage({ Key? key }) : super(key: key);

  @override
  State<ImcInfoPage> createState() => _ImcInfoPageState();
}

class _ImcInfoPageState extends State<ImcInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CustomTitle(text: "O Índice de Massa Corporal (IMC)"),
              CustomLeftBorderText(text: getTextContents("subtitle")),
              Padding(
                padding: const EdgeInsets.only(top: 28, bottom: 28),
                child: Image.asset(
                  "assets/images/exercicio-fisico.jpg",
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: Text(
                  getTextContents("firstFragment"),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              CustomLeftBorderText(text: getTextContents("secondFragment")),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 28),
                child: Text(
                  getTextContents("thirdFragment"),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28, bottom: 28),
                child: Image.asset(
                  "assets/images/tabela-imc.jpg",
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: Text(
                  getTextContents("fourthFragment"),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[800],
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