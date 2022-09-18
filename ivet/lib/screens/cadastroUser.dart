import 'package:flutter/material.dart';

class CadastroUser extends StatelessWidget {
  const CadastroUser();
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
        padding: EdgeInsets.only(top: 90),
        child: Text(
          'Cadastre-se',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.only(top:8),
        child: Text(
          'Por favor, preencha o campo abaixo \npara fazer o cadastro',
          style: TextStyle(
            fontSize: 18,
          ),
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
                  'Nome',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 5),
            TextFormField(
              style: TextStyle(fontSize: 11),
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
                  'Email',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 5),
            TextFormField(
              style: TextStyle(fontSize: 11),
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
              style: TextStyle(fontSize: 11),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 238, 238, 238))
                ),
                fillColor: Color.fromARGB(255, 238, 238, 238),
                filled: true,
              ),
            ),
           SizedBox(height: 25),
            Row(
              children: <Widget>[
                Text(
                  'Confirme a senha',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 5),
            TextFormField(
              style: TextStyle(fontSize: 11),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Color.fromARGB(255, 238, 238, 238))
                ),
                fillColor: Color.fromARGB(255, 238, 238, 238),
                filled: true,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, ''),
              child: Text(
                'Cadastrar',
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Ou entre com'),
              ],
            ),
            SizedBox(height: 22),
            ElevatedButton.icon(
              onPressed: (){},
              icon: Image.asset(
                "images/appleIcon.png",
                width: 29,
                height: 29,
              ),
              label: Text(
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