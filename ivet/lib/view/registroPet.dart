import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'pets.dart';

class registroPets extends StatefulWidget{
  const registroPets({Key? key}) : super(key: key);

  @override
  State<registroPets> createState() => _registroPetsState();
}

class _registroPetsState extends State<registroPets> {
  
  DateTime date = DateTime(2021,01,01);
  TextEditingController _nameField =TextEditingController();
  TextEditingController _speciesField =TextEditingController();
  TextEditingController _breedField =TextEditingController();
  TextEditingController _genreField =TextEditingController();

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    String userAuthUID = FirebaseAuth.instance.currentUser!.uid;
    String userID = userAuthUID.toString();


    Future<bool> petRegister (String name, String species, String breed, String genre, Timestamp birthDate, String userID, /* String userName */) async{
    
      final petRegister = <String, dynamic>{
      "name": name,
      "species": species,
      "breed": breed,
      "genre": genre,
      "birthDate" : birthDate,
      "userID" : userID,
      // "userName" : userName

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

  Future pickDate(BuildContext context) async {

    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025)
      );

    if(newDate == null) return;

    setState(() => date = newDate);

  }

  String getDateText(){
    if (date == DateTime(2021,01,01)){
      return 'Escolha uma data';
    } else{
      return '${date.day}/${date.month}/${date.year}';
    }

  }

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 50),
          Row(
            children: <Widget>[
              new InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/home');
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
          Padding(
            padding: EdgeInsets.only(top: 45),
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
                      Padding(
                        padding: EdgeInsets.only(top:20, left: 35, right: 15),
                        child: ElevatedButton(
                          onPressed: () => pickDate(context),
                          child: Text(getDateText(),style: TextStyle(fontSize: 16),),
                        ),
                      ),
                    ],
                  ),                
                  SizedBox(height: 65),
                  ElevatedButton(
                  onPressed:
                  () async {
                    if (_formKey.currentState!.validate()) {
                      bool shouldNavigate = await petRegister(_nameField.text, _speciesField.text, _breedField.text, _genreField.text, dateConverter(date), userID,);
                      if(shouldNavigate){
                        Navigator.pushNamed(context, '/home');
                      }
                    }                    
                  },
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

Timestamp dateConverter(DateTime datetime){
  Timestamp tStamp = Timestamp.fromDate(datetime);
  return tStamp;
}
