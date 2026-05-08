// Exemplo 3 | Digitar dois números e calcular sua média

import 'dart:io';

void main() {
  double n1, n2, res; // declara 3 variaveis do tipo double
  print("Digite o n1");
  n1 = double.parse(
    stdin.readLineSync()!,
  ); // double.parse realiza a conversao do valor de string para double
  print("Digite o n2");
  n2 = double.parse(stdin.readLineSync()!);
  res = (n1 + n2) / 2;
  print("Nota 1: $n1");
  print("Nota 2: $n2");
  print("Média:  $res");
  if (res > 6) {
    print("Parabéns ! APROVADO");
  } else {
    print("Reprovado");
  }
}
