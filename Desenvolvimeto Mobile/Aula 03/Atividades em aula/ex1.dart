// Exemplo 1 linguagem Dart
// Biblioteca que permite que o usuário digite valores utilizando o tecladi

import "dart:io";
// Função principal do código

void main() {

  print("Digite seu nome");   // Exibe mensagem na tela
  String nome = stdin.readLineSync()!;   // Cria variável nome para armazenar o que o usuário digita e converte para String
  print("Olá $nome !");   // Exibe a mensagem na tela acessando o valor da variável 

}


