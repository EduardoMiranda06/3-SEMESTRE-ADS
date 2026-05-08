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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Icon(Icons.star,color: Colors.yellow, size: 50,),
                Icon(Icons.favorite,color:  Colors.red,size:50),
                Icon(Icons.thumb_up,color: Colors.blue, size: 50,)

              ],
            ),

            SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.blueAccent,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                  child: Text('Stack',
                  style: TextStyle(fontSize: 20,
                  color: Colors.white),
                  textAlign: TextAlign.center,
                  
                  ),
                )
              ],
            ),

            SizedBox(
              height: 350,
            )
          ],
        ) ,
      ) ,
    );
  }
}