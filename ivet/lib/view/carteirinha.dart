import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Carteirinha extends StatelessWidget{
  const Carteirinha({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    FirebaseFirestore fdb = FirebaseFirestore.instance;
    String userAuthUID = FirebaseAuth.instance.currentUser!.uid;
    String userID = userAuthUID.toString();

    CollectionReference pets = fdb.collection('Pets');
    CollectionReference vaccineRegisters = fdb.collection('VaccineRegisters');

    DocumentReference<Map<String, dynamic>> userDocRef =fdb.collection('Users').doc(userID);

    Stream<QuerySnapshot<Object?>> _petsStream = pets.where('userID', isEqualTo: userID).snapshots();
    Stream<QuerySnapshot<Object?>> _vaccinesStream = vaccineRegisters.snapshots();
    
  List<String> lista = ['God','Devil','Satan'];
  String dropdownvalue = lista.first;

    return Padding(
      padding: EdgeInsets.only(),
      child: Column(
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  DropdownButton<String>(
                    value: dropdownvalue,
                    icon: const Icon(Icons.arrow_downward),
                    onChanged: (String? value){
                      dropdownvalue = value!;
                    },
                    items: lista.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),

                ],
              ),
            ),
          ),
          
          SizedBox(height: 10),

          Expanded(
            child: Container(
              child: 
                ListView(

                scrollDirection: Axis.vertical,
                children: [      
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  'Vacina',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Container(
                                  child: Text(
                                    'VACINA 1',
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
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Container(
                                  child: Text(
                                    'ASSINATURA 1',
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
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Container(
                                  child: Text(
                                    'XX/XX/XXXX',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Próxima Aplicação',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Container(
                                  child: Text(
                                    'XX/XX/XXXX',
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