import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _buildContent(context)
    );
  }
}


Widget _buildContent(BuildContext context){
  return Container(
    // padding: EdgeInsets.all(5),
    color: Color.fromARGB(255, 221, 228, 235),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Image.asset(
          'images/welcomeimg.png',
          height: 255.19,
          width: 355.59,
        ),
        Container(
          color: Colors.purple,
          child: SizedBox(
          height: 100,
          ),
        ),
        Container(
          color: Colors.orange,
          child: SizedBox(
          height: 100,
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/login'),
          child: Text('Começe Já'),
        ),
      ],
    ),
  );
}