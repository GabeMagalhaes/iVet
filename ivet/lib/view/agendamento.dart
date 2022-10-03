import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ivet/view/agendar.dart';

class Agendamento extends StatefulWidget{

    final String selectedClinic;
    const Agendamento({Key? key, required this.selectedClinic}) : super(key: key);

  @override
  State<Agendamento> createState() => _AgendamentoState();
}

class _AgendamentoState extends State<Agendamento> {

  var selectedPet;

  @override
  Widget build(BuildContext context) {
  
  FirebaseFirestore fdb = FirebaseFirestore.instance;

  String userAuthUID = FirebaseAuth.instance.currentUser!.uid;
  String userID = userAuthUID.toString();

  CollectionReference clinics = fdb.collection('Clinics');
  CollectionReference pets = fdb.collection('Pets');
  Stream<QuerySnapshot> _clinicsStream = clinics.snapshots();
  Stream<QuerySnapshot> _petsStream = pets.where('userID', isEqualTo: userID).snapshots();

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 65),
          Row(
            children: <Widget>[
              new InkWell(
                onTap: (){
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (_) => Agendar(selectedClinic:widget.selectedClinic),
                    ),
                  );
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Agendamento de Consulta',
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 65),
          Padding(
            padding: EdgeInsets.only(),
            child: StreamBuilder<QuerySnapshot>(
                  stream: _petsStream,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
                    if(!snapshot.hasData) {
                      return Center(child: Text('Loading...'));
                    } else {
                      List<DropdownMenuItem> userPets = [];
                      for(int i=0; i<snapshot.data!.docs.length;i++ ){
                        DocumentSnapshot snap = snapshot.data!.docs[i];
                        userPets.add(
                          DropdownMenuItem(
                            child: Text(
                              snap['name'],
                              style: TextStyle(color: Colors.indigo),
                            ),
                            value: '${snap['name']}',
                          )
                        );
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: <Widget>[
                          Text(
                            'Selecione um pet',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 20),
                          Icon(Icons.pets, color: Colors.indigo,),
                          SizedBox(width: 20),

                          DropdownButton<dynamic>(
                            items: userPets,
                            onChanged: (petValue){
                              final snackbar = SnackBar(
                                content: Text('Você selecionou ${petValue}', style: TextStyle(color: Color.fromARGB(255, 245, 247, 245)),),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              setState((){
                                selectedPet = petValue;
                              });
                            },
                            value: selectedPet,
                            isExpanded: false,
                            hint: new Text(
                              'Selecione um pet',
                              style: TextStyle(color: Colors.indigo),
                            ),
                          ),

                        ],

                      );
                    }            
                  },
                ),
          ),  
        ],
      ),
    );
  }
}