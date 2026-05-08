// importa biblioteca para criar o design do app
import 'package:flutter/material.dart';

// Função principal do aplicativo
void main() {
  // runApp é a função responsável por chamar as telas do aplicativo
  runApp(TelaApp());
}

// Cria classe do tipo Stateless
class TelaApp extends StatelessWidget {
  const TelaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text("App Aula 06 - Multi child layout"),
        ),
        body: Column(
          children: [
            // Cria a linha
            Row(
              children: [

                Icon(Icons.star,color: Colors.yellow, size: 50,),
                Icon(Icons.favorite,color:  Colors.red,size:50),
                Icon(Icons.thumb_up,color: Colors.blue, size: 50,)

              ],
            )
          ],
        ) ,
      ) ,
    );
  }
}