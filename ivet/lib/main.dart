import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ivet/screens/login.dart';
import 'package:ivet/screens/welcome.dart';
import 'package:ivet/view/home.dart';
import 'package:ivet/screens/cadastroUser.dart';
import 'package:ivet/view/registroPet.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
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
        '/cadastroComUser' :(context) => CadastroComUser(),
        '/registrosPet' :(context) => registroPets(),
        },
      );
  }
}
