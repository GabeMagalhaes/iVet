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
          child: Padding(
            padding: EdgeInsets.only(left: 10.5, right: 10.5, top: 125.5),
            child: Image.asset(
            'images/welcomeimg.png',
            height: 255.19,
            width: 355.59,
            ), 
          ),
        ),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.all(Radius.circular(555)), <- ARRUMAR
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 35),
              Text(
                "iVet",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(height:30),
              Text("Assuma o controle de saúde do seu pet e\n encontre uma clinica ao seu alcance"),
              SizedBox(height: 22,),
              Divider(
                height: 8,
                thickness: 0.5,
                indent: 60,
                endIndent: 60,
                color: Color.fromARGB(255, 197, 196, 196),
              ),
              SizedBox(height: 35,),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: Text(
                  'Começe Já',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 40, 93, 216)),
                  fixedSize: MaterialStateProperty.all(Size(300.0 ,50.0)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(55.0)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
