import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'pets.dart';

class registroPets extends StatefulWidget{
  const registroPets({Key? key}) : super(key: key);

  @override
  State<registroPets> createState() => _registroPetsState();
}

class _registroPetsState extends State<registroPets> {
  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    TextEditingController _nameField =TextEditingController();
    // VERIFICAR
    TextEditingController _speciesField =TextEditingController();
    TextEditingController _breedField =TextEditingController();
    TextEditingController _genreField =TextEditingController();
    // VERIFICAR
    //TextEditingController _birthDateField =TextEditingController();

    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseFirestore fdb = FirebaseFirestore.instance;
    String userAuthUID = FirebaseAuth.instance.currentUser!.uid;
    String userID = userAuthUID.toString();
    CollectionReference pets = fdb.collection('Pets');

    DateTime _dateTime;

    Future<bool> petRegister (String name, String species, String breed, String genre, Timestamp birthDate, String userID, String userName) async{
    
      final petRegister = <String, dynamic>{
      "name": name,
      "species": species,
      "breed": breed,
      "genre": genre,
      "birthDate" : birthDate,
      "userID" : userID,
      "userName" : userName
    };

    try{
      FirebaseFirestore.instance.collection("Pets").doc().set(petRegister);
      return true;
    } on FirebaseException catch(e){
      return false;
    } catch(e){
      print(e.toString());
      return false;
    }
    
  };

    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 95),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(),
                        child: Text(
                          'Cadastre um novo Pet!',
                          style: TextStyle(
                            fontSize: 28
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 12, left: 5),
                        child: Text(
                          'Por favor insira os dados necessários\npara cadastrar seu Pet',
                          style: TextStyle(
                            fontSize: 15
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 25),
                        child: Text(
                          'Nome',
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),
                      ),
                    ],
                  ),     
                  Padding(
                    padding: EdgeInsets.only(top: 5,left: 30, right: 30),
                      child: TextFormField(
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
                          return 'Please enter your pet name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 25),
                        child: Text(
                          'Espécie',
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),
                      ),
                    ],
                  ),     
                  Padding(
                    padding: EdgeInsets.only(top: 5,left: 30, right: 30),
                      child: TextFormField(
                      controller: _speciesField,
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
                          return 'Please enter your pet species';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 25),
                        child: Text(
                          'Raça',
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),
                      ),
                    ],
                  ),     
                  Padding(
                    padding: EdgeInsets.only(top: 5,left: 30, right: 30),
                      child: TextFormField(
                      controller: _breedField,
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
                          return 'Please enter the breed of your pet';
                        }
                        return null;
                      },
                    ),
                  ),
                                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 25),
                        child: Text(
                          'Gênero',
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),
                      ),
                    ],
                  ),     
                  Padding(
                    padding: EdgeInsets.only(top: 5,left: 30, right: 30),
                      child: TextFormField(
                      controller: _genreField,
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
                          return 'Please enter the genre of your pet';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 25),
                        child: Text(
                          'Data do Nascimento',
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),
                      ),
                    ],
                  ),     
                  Padding(
                    padding: EdgeInsets.only(top: 10,left: 30, right: 30),
                    child: ElevatedButton(
                      child: Text('Escolha uma Data'),
                      onPressed: (){
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2025),
                          ).then((date){
                            setState((){
                              _dateTime = date!;
                            });
                          });
                      },
                    ),
                    //   child: 
                    //  TextFormField(
                    //   controller: _nameField,
                    //   style: TextStyle(fontSize: 11),
                    //   decoration: const InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(color:Color.fromARGB(255, 238, 238, 238))
                    //     ),
                    //     fillColor: Color.fromARGB(255, 238, 238, 238),
                    //     filled: true,
                    //   ),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please enter the birthdate of your pet';
                    //     }
                    //     return null;
                    //   },
                    // ),

                  ),
                  SizedBox(height: 35),
                  ElevatedButton(
                  onPressed:(){},
                  //() async {
                  //   if (_formKey.currentState!.validate()) {
                  //     bool shouldNavigate = await petRegister();
                  //     if(shouldNavigate){
                  //       Navigator.pushNamed(context, '/home');
                  //     }
                  //   }                    
                  // },
                  child: Text(
                    'Registrar',
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
      ),
    );
  }
}