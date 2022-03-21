import 'package:calculadora_de_imc/contents/text_contents.dart';
import 'package:calculadora_de_imc/widgets/custom_image.dart';
import 'package:calculadora_de_imc/widgets/custom_left_border_text.dart';
import 'package:calculadora_de_imc/widgets/custom_paragraph.dart';
import 'package:calculadora_de_imc/widgets/custom_title.dart';
import 'package:flutter/material.dart';

final textContents = TextContents();

class ImcInfoPage extends StatefulWidget {
  const ImcInfoPage({Key? key}) : super(key: key);

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
              CustomLeftBorderText(text: textContents.subtitle),
              const CustomImage(path: "assets/images/exercicio-fisico.jpg"),
              CustomParagraph(text: textContents.firstFragment),
              CustomLeftBorderText(text: textContents.secondFragment),
              CustomParagraph(text: textContents.thirdFragment),
              const CustomImage(path: "assets/images/tabela-imc.jpg"),
              CustomParagraph(text: textContents.fourthFragment),
            ],
          ),
        ),
      ),
    );
  }
}
