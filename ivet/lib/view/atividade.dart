import 'dart:ffi';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Atividade extends StatelessWidget {
  const Atividade({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {

  FirebaseFirestore fdb = FirebaseFirestore.instance;
  String userAuthUID = FirebaseAuth.instance.currentUser!.uid;
  String userID = userAuthUID.toString();
  CollectionReference users = fdb.collection('Users');
  CollectionReference visits = fdb.collection('Visits');
  CollectionReference pets = fdb.collection('Pets');
  CollectionReference vets = fdb.collection('Vets');
  CollectionReference clinics = fdb.collection('Clinics');
  Stream<QuerySnapshot<Object?>> _visitsStream = visits.where('userID', isEqualTo: userID).snapshots();
  
  
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Próximas consultas :',
            style: TextStyle(fontSize: 20),
            ),
          SizedBox(height: 12),
          SizedBox(
            height: 155,
            child: StreamBuilder<QuerySnapshot>(
              stream: _visitsStream,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
                if(!snapshot.hasData) {
                  return Center(child: Text('Você ainda não possui consultas marcadas'));
                }
                
                return ListView(
                  padding: EdgeInsets.only(),
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data!.docs.map((document) {

                    Timestamp visitTimestamp = document['visitDate'];
                    DateTime visitDatetime = visitTimestamp.toDate();
                    DateFormat formatterDate = DateFormat('dd/MM/yyyy');
                    DateFormat formatterHour = DateFormat('HH:mm');
                    String visitDay = formatterDate.format(visitDatetime);
                    String visitHour = formatterHour.format(visitDatetime);

                    return Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Pet: ${document['petName']}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 2),
                            Row(
                              children: [
                                Text(
                                  'Clinica: ${document['clinicName']}',
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                            SizedBox(height: 2),
                            Row(
                              children: [
                                Text(
                                  'Vet: ${document['vetName']}',
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Data:',
                                          style: TextStyle(
                                              fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 2),
                                    Row(
                                      children: [
                                        Text(
                                          visitDay,
                                          style: TextStyle(
                                              fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3),
                                    Row(
                                      children: [
                                        Text(
                                          'as ${visitHour}',
                                          style: TextStyle(
                                              fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );                
              }
            )
          ),
          SizedBox(
            height: 50,
          ),

          Text(
            'Novidades',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),

          Column(
            children: [
              Card(
                  child: ListTile(
                leading: Image.asset(
                  'images/noticia1.png',
                  width: 60,
                  height: 60,
                ),
                title: Text(
                  'Campanha de vacinação',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pretium.',
                  style: TextStyle(fontSize: 11),
                ),
                trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios), onPressed: () {}),
                )
              ),
              Card(
                child: ListTile(
                leading: Image.asset(
                  'images/noticia2.png',
                  width: 55,
                  height: 60,
                ),
                title: Text(
                  'Campanha de castração',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pretium.',
                  style: TextStyle(fontSize: 11),
                ),
                trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios), onPressed: () {}),
                )
              ),
              Card(
                child: ListTile(
                leading: Image.asset(
                  'images/noticia3.png',
                  width: 55,
                  height: 60,
                ),
                title: Text(
                  'Campanha de adoção',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pretium.',
                  style: TextStyle(fontSize: 11),
                ),
                trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios), onPressed: () {}),
                )
              ),
            ],
          )
          
        ],
      ),
    );
  }
}
