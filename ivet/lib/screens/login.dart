import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: build_Content(context));
  }
}

Widget build_Content(BuildContext context){
  return Column(
    //crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 80),
        child: Image.asset(
          'images/registerimg.png',
          height: 137.42,
          width: 132.22,
        ),
      ),
      Text(
        'Bem Vindo',
        style: TextStyle(
          fontSize: 32,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top:8),
        child: Text(
          'Por favor, faça login para \n continuar'
        ),
      ),
      
      Row(
        children: <Widget>[
          Text('Email'),
        ],
      ),

      TextFormField(
        decoration: const InputDecoration(
          hintText: 'Email',
        ),
      ),


      Row(
        children: <Widget>[
          Text('Senha'),
        ],
      ),

      TextFormField(
        decoration: const InputDecoration(
          hintText: 'Senha',
        ),
      ),

      Row(
        children: <Widget>[
          Text('Não tenho login'),
          Text('Esqueceu a senha?'),
        ],
      ),
      


      ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/home'),
        child: Text('Login')),
      

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Ou entre com'),
        ],
      ),
      
      ElevatedButton(
        onPressed: (){},
        child: Text('Login com Apple')),

      ElevatedButton(
        onPressed: (){},
        child: Text('Login com Google')),    
    
    ],
  );
}