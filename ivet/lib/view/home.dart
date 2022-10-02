import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ivet/screens/welcome.dart';
import 'package:ivet/view/Consultas.dart';
import 'package:ivet/view/adocao.dart';
import 'package:ivet/view/atividade.dart';
import 'package:ivet/view/carteirinha.dart';
import 'package:ivet/view/clinicas.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final screens = [
    TabBarView(
      children: [
        Atividade(),
        Clinicas(),
        Consultas(),
        Carteirinha(),
        Adocao(),
      ],
    ),

    Center(
      child: Text(
        'SATAN',
        style: TextStyle(fontSize: 60),
      ),
    ),

  ];

  @override
  Widget build(BuildContext context) {

    // Firestore instanciada
    FirebaseFirestore fdb = FirebaseFirestore.instance;
    // Collection 'Users' instanciada
    CollectionReference users = fdb.collection('Users');
    // UID do usuario (FireAuthenticator)
    String userAuthUID = FirebaseAuth.instance.currentUser!.uid;
    // String do ID do documento que se refere ao usuario (Firestore Database)
    String userID = userAuthUID.toString();
    // Referecia do Documento do usuario (Firestore Database)
    DocumentReference<Map<String, dynamic>> userDocRef =fdb.collection('Users').doc(userID);
    // Instanciando o Snapshots do Documento do User atual em uma Stream
    final Stream<DocumentSnapshot<Map<String, dynamic>>> _userStream = userDocRef.snapshots();

    void signOut() async{
      await FirebaseAuth.instance.signOut();
      Navigator.pushNamed(context, '/login');
  }

  
    return StreamBuilder<DocumentSnapshot>(
      stream: _userStream,
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              color: Color.fromARGB(255, 238, 238, 238),
            );
        }
        
        String name = snapshot.data!['name'].toString();

        return DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 70,
              backgroundColor: Colors.white,
              leading: IconButton(
                  icon: Icon(
                    Icons.logout_outlined,
                    size: 32,
                    color: Colors.blue,
                  ),
                  onPressed: signOut
                  ),
              title: Text(
                name, 
               style: TextStyle(
                  color: Colors.black
                ),
              ),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.notifications_none,
                      size: 32,
                      color: Colors.blue
                    ),
                    onPressed: () {})
              ],
              
              bottom: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Color.fromARGB(255, 157, 157, 157),
                tabs: [
                  Tab(
                    text:'Atividade',
                  ),
                  Tab(
                    text: 'Clinicas',
                  ),
                  Tab(
                    text: 'Histórico',
                  ),
                  Tab(
                    text: 'Carteira de vacinação',
                  ),
                  Tab(
                    text: 'Adoção',
                  )
                ],
                isScrollable: true,
              ),
            ),

            body: IndexedStack(
              index: currentIndex,
              children: screens,
            ),

            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.favorite,
                size: 35,
              ),
              backgroundColor: Color.fromRGBO(255, 101, 132, 1),
            ),
            
            bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              elevation: 0,
              child: BottomNavigationBar(
                currentIndex: currentIndex,
                iconSize: 40,
                showUnselectedLabels: false,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.blueAccent,
                onTap: (index) => setState(() => currentIndex = index),
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Conta',
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

