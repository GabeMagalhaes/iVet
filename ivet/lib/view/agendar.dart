import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Agendar extends StatelessWidget{

  final String selectedClinic;

  const Agendar({Key? key, required this.selectedClinic}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    FirebaseFirestore fdb = FirebaseFirestore.instance;
    CollectionReference clinics = fdb.collection('Clinics');
    DocumentReference<Map<String, dynamic>> clinicDocRef =fdb.collection('Clinics').doc(selectedClinic);
    Stream<DocumentSnapshot<Map<String, dynamic>>> _clinicStream = clinicDocRef.snapshots();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
        child: Container(
          child: StreamBuilder <DocumentSnapshot>(
            stream: _clinicStream,
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Text('Loading...'));
              }
              
              String clinicName = snapshot.data!['name'].toString();
              String clinicAdress = snapshot.data!['adress'].toString();
              String clinicCity = snapshot.data!['city'].toString();
              String clinicState = snapshot.data!['state'].toString();              
              String clinicTel = snapshot.data!['tel'].toString();
              String clinicEmail = snapshot.data!['email'].toString();
              String clinicDesc = snapshot.data!['description'].toString();
              String clinicRating = snapshot.data!['rating'].toString();

              return Container(
                child: Column(
                  children: <Widget>[
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
                    // CABECALHO
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 65),
                          // LOGO DA CLINICA
                          child : Container(
                            height: 125,
                            width: 125,
                            color: Colors.blue,
                          )
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(top: 65),
                          // INFOS DA CLINICA
                          child: Container(

                            height: 125,
                            width: 230,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top:16),
                                      child: Text(
                                        clinicName,
                                        style: TextStyle(
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 12),
                                      child: Icon(
                                        Icons.email,
                                        size: 20,
                                        ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 7,top: 12),
                                      child: Text(clinicEmail),
                                    ),                             
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 6),
                                      child: Icon(
                                        Icons.call,
                                        size: 20,
                                        ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 7,top: 9),
                                      child: Text(clinicTel),
                                    ),                             
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35, left: 15, right: 15),
                      child: Text(
                        clinicAdress,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 15, right: 15),
                      child: Text(
                        '${clinicCity} - ${clinicState}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 45),
                      child: Container(
                        height: 200,
                        width: 385,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'Descrição',
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 130,
                                  width: 375,
                                  child: Padding(
                                    padding: EdgeInsets.only(),
                                    child: Text(
                                      clinicDesc,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 12),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Text(
                              'Avaliação:',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              clinicRating,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 95),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () => _dialogBuilder(context),
                            child: Text(
                              'Agendar Consulta',
                              style: TextStyle(
                                fontSize: 20
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              );
            }
          )
        ),
      )
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  final _formKey = GlobalKey<FormState>();
  String userAuthUID = FirebaseAuth.instance.currentUser!.uid;
  String userID = userAuthUID.toString();
  FirebaseFirestore fdb = FirebaseFirestore.instance;
  CollectionReference pets = fdb.collection('Pets');
  CollectionReference vets = fdb.collection('Vets');
  CollectionReference visits = fdb.collection('Visits');

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Agende uma Consulta'),

        content: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: 300,
              child: Form(
                key: _formKey,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,                  
                  children: [

                  ],
                ),
              ),
            ),
          ],
        ),
        
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Enable'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],

      );
    },
  );
  }

        