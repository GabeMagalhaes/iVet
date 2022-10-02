import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Adocao extends StatelessWidget{
  const Adocao({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore fdb = FirebaseFirestore.instance;
    CollectionReference fosterPets = fdb.collection('FosterPets');
    Stream<QuerySnapshot<Object?>> _fosterStream = fosterPets.where('adopted',isEqualTo: false).snapshots();


    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Adoções :',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 400,
            child: StreamBuilder<QuerySnapshot>(
              stream: _fosterStream,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
                if(!snapshot.hasData) {
                  return Center(child: Text('Loading...'));
                }
                return ListView(
                  padding: EdgeInsets.only(),
                  scrollDirection: Axis.vertical,   
                  children: snapshot.data!.docs.map((document) {

                    Timestamp pubTimestamp = document['pubDate'];
                    DateTime pubDatetime = pubTimestamp.toDate();
                    DateFormat formatterDate = DateFormat('dd/MM/yyyy');
                    DateFormat formatterHour = DateFormat('HH:mm');
                    String pubDay = formatterDate.format(pubDatetime);
                    String pubHour = formatterHour.format(pubDatetime);

                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.00),
                        child: Column(
                          children: <Widget>[
                            Card(
                              child: ListTile(
                              // leading: Image.asset(
                              //   'images/clinica2.png',
                              //   width: 55,
                              //   height: 60,
                              // ),
                              title: Text(
                               document['fosterName'],
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '${document['species']} - ${document['genre']} - ${document['age']}',
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              trailing: IconButton(
                                  icon: Icon(Icons.arrow_forward_ios), onPressed: () {}),
                              )
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );                 
              },
            ),
          )
        ],
      ),
    );
  }
}