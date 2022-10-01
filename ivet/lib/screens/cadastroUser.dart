import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CadastroUser extends StatelessWidget {
  const CadastroUser();
  @override
  Widget build(BuildContext context) {

    return Scaffold(body: build_Content(context));

  }
}

Widget build_Content(BuildContext context){

  final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore vetDb = FirebaseFirestore.instance;
  // TextEditingController _nameField =TextEditingController();
  TextEditingController _emailField =TextEditingController();
  TextEditingController _passwordField =TextEditingController();  

  Future <bool> registerUser(String email, String password) async{
  try{

    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return true;

  } on FirebaseAuthException catch(e){
    if (e.code == 'weak-password'){
      print('The password provided is too weak. ');
    } else if(e.code == 'email-already-in-use'){
      print('The account already exists for that email. ');
    }
    return false;
  } catch(e){
    print(e.toString());
    return false;
  }
};

  return Column(
    //crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 55, left: 22),
        child: Row(
          children: <Widget>[
            new InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/login');
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.chevron_left_outlined),
                  new Text(
                    'Voltar',
                    style: TextStyle(
                    fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(height:35),
      Text(
        'Cadastre-se',
        style: TextStyle(
        fontSize: 32,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top:15),
        child: Text(
          'Por favor, preencha os campo abaixos \npara fazer o cadastro',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      SizedBox(height: 35),
      Padding(
        padding:EdgeInsets.only(right: 38,left: 38),
        child: Form(
          key: _formKey,
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
              controller: _emailField,
              style: TextStyle(fontSize: 15),
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
              controller: _passwordField,
              obscureText: true,
              style: TextStyle(fontSize: 15),
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
            SizedBox(height: 55),
            ElevatedButton(
              onPressed:() async {
                if (_formKey.currentState!.validate()) {
                  bool shouldNavigate = await registerUser(_emailField.text, _passwordField.text);
                  if(shouldNavigate){
                    Navigator.pushNamed(context, '/cadastroComUser');
                  }
                }                    
              },
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

            //Login com Google
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

            //Login com Apple
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

class CadastroComUser extends StatelessWidget {
  const CadastroComUser();
  @override
  Widget build(BuildContext context) {

    return Scaffold(body: comBuild_Content(context));

  }
}

Widget comBuild_Content(BuildContext context){

  final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore vetDb = FirebaseFirestore.instance;
  TextEditingController _nameField =TextEditingController();
  TextEditingController _telField =TextEditingController();
  TextEditingController _adressField =TextEditingController();
  TextEditingController _zipcodeField =TextEditingController();
  TextEditingController _cityField =TextEditingController();
  TextEditingController _stateField =TextEditingController();

    Future  <bool> fullRegister (String name, String tel, String adress, String city, String state, String zipcode) async{

    final user = <String, dynamic>{
    "name": name,
    "adress": adress,
    "city": city,
    "state": state,
    "zipcode" : zipcode,
    "tel" : tel 

  };
    try{
      FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).set(user);
      return true;
    } on FirebaseException catch(e){
      return false;
    } catch(e){
      print(e.toString());
      return false;
    }
      
  };


  return Column(
    //crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 55, left: 22),
        child: Row(
          children: <Widget>[
            new InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/login');
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.chevron_left_outlined),
                  new Text(
                    'Voltar',
                    style: TextStyle(
                    fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(height:30),

      Padding(
        padding: EdgeInsets.only(top:15, left: 40),
        child: Text(
          'Por favor, continue preenchendo os campos abaixo para continuar o seu cadastro',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      SizedBox(height: 28),
      Padding(
        padding:EdgeInsets.only(right: 38,left: 38),
        child: Form(
          key: _formKey,
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
              controller: _nameField,
              style: TextStyle(fontSize: 11),
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
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            
            SizedBox(height: 15),

            Row(
              children: <Widget>[
                Text(
                  'Telefone',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: _telField,
              style: TextStyle(fontSize: 11),
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
                  return 'Please enter your telefone';
                }
                //VERIFICAR NUMERO VALIDO DE TELEFONE
                // if (!value.contains('@')) {
                //   return 'Email is invalid, must contain @';
                // }
                return null;
              },
            ),
            
            SizedBox(height: 15),

            Row(
              children: <Widget>[
                Text(
                  'Endereço',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: _adressField,
              style: TextStyle(fontSize: 11),
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
                  return 'Please enter your adress';
                }
                return null;
              },
            ),
            
            SizedBox(height: 15),
            
            Row(
              children: <Widget>[
                Text(
                  'CEP',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: _zipcodeField,
              style: TextStyle(fontSize: 11),
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
                  return 'Please enter your zipcode';
                }
                return null;
              },
            ),

            SizedBox(height: 15),

            Row(
              children: <Widget>[
                Text(
                  'Cidade',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: _cityField,
              style: TextStyle(fontSize: 11),
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
                  return 'Please enter your city';
                }
                return null;
              },
            ),

            SizedBox(height: 15),

            Row(
              children: <Widget>[
                Text(
                  'Estado',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: _stateField,
              style: TextStyle(fontSize: 11),
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
                  return 'Please enter your state';
                }
                return null;
              },
            ),

            SizedBox(height: 35),
            ElevatedButton(
              onPressed:() async {
                if (_formKey.currentState!.validate()) {
                  bool shouldNavigate = await fullRegister(_nameField.text,_telField.text,_adressField.text,_cityField.text,_stateField.text,_zipcodeField.text);
                  if(shouldNavigate){
                    Navigator.pushNamed(context, '/home');
                  }
                }                    
              },
              child: Text(
                'Continuar',
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
          ],
        ),
        ),
      ),
    ],
  );
}