import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child: Column(
          children: <Widget>[
            Image.asset(
              'images/welcomeimg.png',
              height: 255.19,
              width: 355.59,
            ),
            Text(
              'iVet',
              style: TextStyle(fontSize: 24)
            ),
            Text(
              'Assuma o controle de saúde do seu pet e encontre uma clinica ao seu alcance'
            ),
            Divider(
              height: 3,
              indent: 50,
              endIndent: 50,
              color: Colors.black,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: Text('Começe Já')
              ),
          ],
        ),
      ),
    );
  }
}