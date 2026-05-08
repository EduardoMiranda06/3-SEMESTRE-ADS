import 'package:flutter/material.dart';

void main() {
  runApp(Login());
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  // Cria variaveis para armazenar o usuario e senha
  TextEditingController user = TextEditingController();
  TextEditingController senha = TextEditingController();

  // Cria função para realizar Login
  _verificaLogin(){
    if(user.text=='Senai' && senha.text =='2026'){
     // Navigator.push(context, MaterialPageRoute(
       // builder: (context)=> ));// Chama a tela criada));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login incorreto"),
        duration: Duration(seconds: 5),)
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.grey,
              child: Image.asset('images/senai.png',fit: BoxFit.cover,),
            )
          ],
        ),
      ),
    );
  }
}