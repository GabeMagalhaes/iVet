import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: build_Content(context));
  }
}

Widget build_Content(BuildContext context){

  final _formKey = GlobalKey<FormState>();
  FirebaseAuth fbAuth = FirebaseAuth.instance;
  TextEditingController _emailCon = TextEditingController();
  TextEditingController _passwordCon = TextEditingController();

  Future<bool> signIn(String email, String password) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }

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
          'Por favor, faça login para \ncontinuar',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      SizedBox(height: 20),


      Form(
        key: _formKey,
        child: Padding(
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
                controller: _emailCon,
                style: TextStyle(fontSize: 13),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Color.fromARGB(255, 238, 238, 238))
                  ),
                  fillColor: Color.fromARGB(255, 238, 238, 238),
                  filled: true,
                ),
                validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Email is invalid, must contain @';
                    }
                    return null;
                  },
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
                controller: _passwordCon,
                obscureText: true,
                style: TextStyle(fontSize: 13),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 238, 238, 238))
                  ),
                  fillColor: Color.fromARGB(255, 238, 238, 238),
                  filled: true,
                ),
                validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  new InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/cadastroUser');
                    },
                    child: new Text('Não tenho Login'),
                  ),
                  Spacer(),
                  new InkWell(
                    onTap: (){},
                    child: new Text('esqueceu a senha?'),
                  ),
                ],
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed:() async {
                  if (_formKey.currentState!.validate()) {
                    bool shouldNavigate = await signIn(_emailCon.text, _passwordCon.text);
                    if(shouldNavigate){
                      Navigator.pushNamed(context, '/home');
                    }
                  }                    
                },
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
      ),
    ],
  );
}