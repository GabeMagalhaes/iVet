import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('LOGIN'),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/home'),
              child: Text('Login')
            )
          ],
        )
      )
    );
  }
}