String getTextContents(String key) {
  const Map<String, String> contents = {
    "subtitle":
        "O Índice de Massa Corporal é um cálculo que serve para avaliar se a pessoa está dentro do seu peso ideal em relação à altura.",
    "firstFragment":
        "Estar dentro do peso ideal é importante porque estar acima ou abaixo desse peso pode influenciar bastante a saúde, aumentando o risco de problemas como desnutrição quando se está abaixo do peso, e AVC ou infarto, quando se está acima do peso. Dessa forma, é comum nas consultas os médicos, nutricionistas e enfermeiros avaliarem o IMC das pessoas para verificar a possibilidade de pre-disposição à determinadas doenças.",
    "secondFragment":
        "O cálculo do IMC é feito usando a seguinte formula: Peso ÷ (altura x altura). Confira a tabela abaixo:",
  };

  return contents[key] ?? "getTextContent falhou";
}
