/*
Programação orientada a objeto conceito de erança
26/02/2026
*/

// classe mae
class Animal {
  String? nome;
  int? idade;

  void dormir() {
    print('O animal ${nome} está dormindo');
  }
}

// Cria a classe filha
class Cachorro extends Animal {
  void latir() {
    print('O animal ${nome} está latindo');
  }
}

// Cria classe filha
class Tigre extends Animal {
  String? cor;
  void atacar() {
    print('O animal $nome atacou');
  }
}

void main() {
  //Cria objeto Rocky a partir da classe cachorro
  Cachorro Rocky = Cachorro();
  Rocky.nome = "Rocky";
  Rocky.idade = 3;
  Rocky.latir();
  Rocky.dormir();

  Tigre TaiLung = Tigre();
  TaiLung.nome = "TaiLung";
  TaiLung.cor = "Cinza";
  TaiLung.idade = 30;
  TaiLung.atacar();
}
