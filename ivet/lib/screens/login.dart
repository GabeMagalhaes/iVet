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
       SizedBox(height: 20),
      Padding(
        padding:EdgeInsets.only(right: 38,left: 38),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Email',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 5),
            TextFormField(
              style: TextStyle(fontSize: 13),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Color.fromARGB(255, 238, 238, 238))
                ),
                fillColor: Color.fromARGB(255, 238, 238, 238),
                filled: true,
              ),
            ),
            SizedBox(height: 25),
            Row(
              children: <Widget>[
                Text(
                  'Senha',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 5),
            TextFormField(
              style: TextStyle(fontSize: 13),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 238, 238, 238))
                ),
                fillColor: Color.fromARGB(255, 238, 238, 238),
                filled: true,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Text('Não tenho Login'),
                Text('Esqueceu a senha?'),
              ],
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/home'),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 21,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 40, 93, 216)),
                fixedSize: MaterialStateProperty.all(Size(300.0 ,50.0)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Ou entre com'),
              ],
            ),
            SizedBox(height: 18),
            ElevatedButton(
              onPressed: (){},
              child: Text(
                'Login com Apple',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
                fixedSize: MaterialStateProperty.all(Size(300.0 ,50.0)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: (){},
              icon: Image.asset(
                "images/googleIcon.png",
                width: 28,
                height: 28,
              ),
              label: Text(
                "Login com Google",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)),
                fixedSize: MaterialStateProperty.all(Size(300.0 ,50.0)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                ),   
              ),
              ),
          ],
        ),
      ),
    ],
  );
}