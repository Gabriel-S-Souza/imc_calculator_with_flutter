import 'package:calculadora_de_imc/pages/imc_calculator.dart';
import 'package:calculadora_de_imc/pages/imc_info.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  //PageControler: class do controlador da PageView
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: currentPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const <Widget>[
          ImcCalculator(),
          ImcInfoPage(),
        ],
      ),
    );
  }
}
