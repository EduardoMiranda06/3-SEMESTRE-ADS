import "dart:io";

void areaTri(double b, double h) {
  double area;
  area = (b * h) / 2;
  print("Área do triângulo: $area");
}

void main() {
  double b, h;

  print("Digite a base do triangulo: ");
  b = double.parse(stdin.readLineSync()!);

  print("Digite a altura do triangulo");
  h = double.parse(stdin.readLineSync()!);

  areaTri(b, h);
}