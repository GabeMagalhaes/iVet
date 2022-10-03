import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ivet/view/agendar.dart';

class Agendamento extends StatelessWidget{

    final String selectedClinic;
    const Agendamento({Key? key, required this.selectedClinic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
  FirebaseFirestore fdb = FirebaseFirestore.instance;

  String userAuthUID = FirebaseAuth.instance.currentUser!.uid;
  String userID = userAuthUID.toString();

  CollectionReference clinics = fdb.collection('Clinics');
  Stream<QuerySnapshot> _clinicsStream = clinics.snapshots();

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
                      builder: (_) => Agendar(selectedClinic:selectedClinic),
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
            padding: EdgeInsets.only(top: 25),
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
          
        ],
      ),
    );
  }
}