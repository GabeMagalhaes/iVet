import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Consultas extends StatelessWidget {
  const Consultas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    FirebaseFirestore fdb = FirebaseFirestore.instance;
    String userAuthUID = FirebaseAuth.instance.currentUser!.uid;
    String userID = userAuthUID.toString();
    CollectionReference visits = fdb.collection('Visits');
    Stream<QuerySnapshot<Object?>> _closedVisitsStream = visits.where('userID', isEqualTo: userID).where('closedVisit', isEqualTo: true).snapshots();

    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ultimas Consultas',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 400,
            child: StreamBuilder<QuerySnapshot>(
              stream: _closedVisitsStream,
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

                    Timestamp visitTimestamp = document['visitDate'];
                    DateTime visitDatetime = visitTimestamp.toDate();
                    DateFormat formatterDate = DateFormat('dd/MM/yyyy');
                    DateFormat formatterHour = DateFormat('HH:mm');
                    String visitDay = formatterDate.format(visitDatetime);
                    String visitHour = formatterHour.format(visitDatetime);

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
                               '${document['clinicName']} - ${visitDay}',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                document["description"],
                                style: TextStyle(fontSize: 11),
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
