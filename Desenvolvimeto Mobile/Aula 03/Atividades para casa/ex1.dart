import "dart:io";

void user(String nome, String curso, int idade) {
  print("Seu nome é $nome, tem $idade anos e cursa $curso");
}

void main() {
  String nome, curso;
  int idade;
  
  print("Digite seu nome: ");
  nome = stdin.readLineSync()!;

  print("Digite qual seu curso: ");
  curso = stdin.readLineSync()!;

  print("Digite sua idade: ");
  idade = int.parse(stdin.readLineSync()!);

  user(nome, curso, idade);
}
