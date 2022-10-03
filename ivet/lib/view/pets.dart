import 'dart:ui';
import 'package:ivet/view/carteirinha.dart';
import 'agendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class myPets extends StatelessWidget {
  const myPets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
  FirebaseFirestore fdb = FirebaseFirestore.instance;
  String userAuthUID = FirebaseAuth.instance.currentUser!.uid;
  String userID = userAuthUID.toString();
  CollectionReference myPets = fdb.collection('Pets');
  Stream<QuerySnapshot> _myPetsStream = myPets.where('userID', isEqualTo: userID).snapshots();

    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              Text(
                'Meus Pets',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                onPressed: (){ Navigator.pushNamed(context, '/registrosPet');},
                icon: Icon(Icons.add),
              ),
            ],
          ),

          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 400,
            child: StreamBuilder<QuerySnapshot>(
              stream: _myPetsStream,
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

                  return Container(
                    child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: Column(

                        children: <Widget>[
                          Card(
                            child: ListTile(
                            // leading: Image(
                            //   image: NetworkImage(document['logoUrl']),
                            //   width: 60,
                            //   height: 60,
                            // ),
                            title: Text(
                              document['name'],
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${document['species']} - ${document['breed']} - ${document['genre']}',
                              style: TextStyle(fontSize: 11),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.arrow_forward_ios),
                                onPressed: () {
                                  Navigator.push(
                                    context, MaterialPageRoute(
                                      builder: (_) => Carteirinha(selectedPet:document.id.toString()),
                                    ),
                                  );
                                },
                            ),
                          ),
                          ),
                        ],
                      ),
                    ),
                  );
                  }).toList(),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}


