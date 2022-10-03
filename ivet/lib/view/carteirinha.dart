import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Carteirinha extends StatelessWidget{

  final String selectedPet;
  const Carteirinha({Key? key,required this.selectedPet}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    FirebaseFirestore fdb = FirebaseFirestore.instance;
    String userAuthUID = FirebaseAuth.instance.currentUser!.uid;
    String userID = userAuthUID.toString();
    CollectionReference pets = fdb.collection('Pets');
    CollectionReference vaccineRegisters = fdb.collection('VaccineRegisters');
    DocumentReference<Map<String, dynamic>> petDocRef =fdb.collection('Pets').doc(selectedPet);
    Stream<DocumentSnapshot<Map<String, dynamic>>> _petStream = petDocRef.snapshots();
    Stream<QuerySnapshot<Object?>> _petVaccinesStream = vaccineRegisters.where('petID', isEqualTo: selectedPet).snapshots();

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 55),
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
            padding: EdgeInsets.only(top: 15),
            child: Container(
              height: 320,
              width: 400,
              child: StreamBuilder <DocumentSnapshot>(
                stream: _petStream,
                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Text('Loading...'));
                  }

                  String petName = snapshot.data!['name'].toString();
                  String petSpecies = snapshot.data!['species'].toString();
                  String petBreed = snapshot.data!['breed'].toString();
                  String petGenre = snapshot.data!['genre'].toString();                                
                  Timestamp birthTimestamp = snapshot.data!['birthDate'];
                  DateTime birthDatetime = birthTimestamp.toDate();
                  DateFormat formatterDate = DateFormat('dd/MM/yyyy');
                  String birthDay = formatterDate.format(birthDatetime);

                  return Column(
                    children: <Widget>[
                      //linha para o nome
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              petName,
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                      // linha para especie
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              petSpecies,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // linha para raca e genero
                      Padding(
                        padding: EdgeInsets.only(top: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(),
                              child: Text(
                                petBreed,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 75),
                              child: Text(
                                petGenre,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // linha para data nascimento
                      Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 25),
                              child: Text(
                                'Data do Nascimento',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),                        
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(),
                              child: Text(
                                birthDay,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),                        
                          ],
                        ),
                      ),                  
                    ],
                  );
                },
              )
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Carteira de Vacinação',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Expanded(
            child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: _petVaccinesStream,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  if(!snapshot.hasData) {
                    return Center(child: Text('Loading...'));
                  }
                  return ListView(
                    scrollDirection: Axis.vertical,
                    children: snapshot.data!.docs.map((document) {
                                               
                  Timestamp applicationTimestamp = document['applicationDate'];
                  Timestamp nextApplicationTimestamp = document['nextApplicationDate'];
                  DateTime applicationDatetime = applicationTimestamp.toDate();
                  DateTime nextApplicationDatetime = nextApplicationTimestamp.toDate();
                  DateFormat formatterDate = DateFormat('dd/MM/yyyy');
                  String applicationDate = formatterDate.format(applicationDatetime);
                  String nextApplicationDate = formatterDate.format(nextApplicationDatetime);


                  return Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Vacina',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Container(
                                    child: Text(
                                      document['name'],
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  // Vacina assinatura
                                  Text(
                                    'Assinatura',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Container(
                                    child: Text(
                                      document['vetName'],
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Data da Aplicação',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Container(
                                    child: Text(
                                      applicationDate,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Próxima Aplicação',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Container(
                                    child: Text(
                                      nextApplicationDate,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  );
                },
              )
            ),
          ),

        ],
      ),
    );
  }
}

