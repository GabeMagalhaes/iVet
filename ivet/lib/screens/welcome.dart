import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildContent(context));
  }
}

Widget _buildContent(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[

        Container(
          height: 570,
          color: Color.fromARGB(255, 234, 237, 239),
          child: Image.asset(
            'images/welcomeimg.png',
            height: 255.19,
            width: 355.59,
          ),
        ),

      Expanded(
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: <Widget>[
              SizedBox(height: 35),
              Text(
                "iVet",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(height:25),
              Text("Assuma o controle de saúde do seu pet e\n encontre uma clinica ao seu alcance"),
              SizedBox(height: 22,),
              Divider(
                height: 10,
                thickness: 0.5,
                indent: 40,
                endIndent: 40,
                color: Color.fromARGB(255, 210, 209, 209),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: Text(
                  'Começe Já',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style:ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 40, 93, 216),
                  fixedSize: Size(295.0, 50.0),
                ),
              ),
            ],
          ),
        ),
      ),

 

    ],
  );
}
