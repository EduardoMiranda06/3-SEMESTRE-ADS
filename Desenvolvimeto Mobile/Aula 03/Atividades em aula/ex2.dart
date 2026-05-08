// Exemplo 2
import 'dart:io';

void main() {
  print("Digite seu nome"); // Exibe mensagem na tela
  String nome = stdin
      .readLineSync()!; // Cria variável nome para armazenar o que o usuário digita e converte para String
  print(
    "Olá $nome !",
  ); // Exibe a mensagem na tela acessando o valor da variável
  print("Digite sua idade");
  // Variável do tipo inteira
  // stdin.readLineSync pega valores como String
  int idade = int.parse(stdin.readLineSync()!);
  if (idade >= 18) {
    print("Maior de idade");
  } else {
    print("Menor de idade");
  }
  print("Nome: $nome e idade $idade anos");
}
