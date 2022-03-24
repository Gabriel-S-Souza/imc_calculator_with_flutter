import 'dart:io';

import 'package:calculadora_de_imc/pages/imc_calculator.dart';
import 'package:calculadora_de_imc/pages/imc_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  //PageControler: class do controlador da PageView
  late PageController pageController;

  //Configurando a cor do statusBar e navigation bar do android
  void changeStatusBar() {
    //Para evitar procecamento desenecessário, verificar se o código em execução está no android
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.deepPurpleAccent,
        systemNavigationBarColor: Colors.deepPurpleAccent,
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: currentPage,
    );
    changeStatusBar();
  }

  void setCurrentPage(page) {
    setState(() => currentPage = page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
      ),
      body: PageView(
        controller: pageController,
        children: const <Widget>[
          ImcCalculator(),
          ImcInfoPage(),
        ],
        onPageChanged: setCurrentPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        // backgroundColor: Colors.deepPurple[50],
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: "Calcular IMC",
              tooltip: "Calculadora de IMC"),
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "Sobre o IMC",
              tooltip: "Mais sobre o IMC"),
        ],
        onTap: (page) {
          pageController.animateToPage(page,
              duration: const Duration(milliseconds: 450), curve: Curves.ease);
        },
      ),
    );
  }
}
