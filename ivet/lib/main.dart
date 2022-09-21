import 'package:flutter/material.dart';
import 'package:ivet/screens/login.dart';
import 'package:ivet/screens/welcome.dart';
import 'package:ivet/screens/carteirinha.dart';
import 'package:ivet/view/home.dart';
import 'package:ivet/screens/cadastroUser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => WelcomeScreen(),
        '/login':(context) => LoginScreen(),
        '/home' :(context) => Home(),
        '/cadastroUser' :(context) => CadastroUser(),
        '/carteirinha' :(context) => Carteirinha(),
        },
      );
  }
}
