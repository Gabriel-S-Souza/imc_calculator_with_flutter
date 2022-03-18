String getTextContents(String key) {
  const Map<String, String> contents = {
    "subtitle":
        "O Índice de Massa Corporal é um cálculo que serve para avaliar se a pessoa está dentro do seu peso ideal em relação à altura.",
    "firstFragment":
        "Estar dentro do peso certo é importante porque estar acima ou abaixo desse peso pode influenciar bastante a saúde, aumentando o risco de doenças como desnutrição quando se está abaixo do peso, e AVC ou infarto, quando se está acima do peso. Assim, é comum os médicos, enfermeiros e nutricionistas avaliem o IMC da pessoa nas consultas de rotina para verificar a possibilidade de doenças que a pessoa pode estar pre-disposta.",
    "secondFragment":
        "O cálculo do IMC é feito usando a seguinte formula: Peso ÷ (altura x altura). Confira o que reprenta os valores do IMC na imagem abaixo:",
  };

  return contents[key] ?? "getTextContent falhou";
}
