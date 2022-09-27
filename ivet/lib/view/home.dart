import 'package:flutter/material.dart';
import 'package:ivet/view/Consultas.dart';
import 'package:ivet/view/atividade.dart';
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
        mostrarTela('Carteira de vacinação'),
        mostrarTela('Adoção')
      ],
    ),
    Center(
      child: Text(
        'Conta',
        style: TextStyle(fontSize: 60),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.border_all_rounded,
                size: 32,
                color: Colors.blue,
              ),
              onPressed: () {}),
          title: Text(
            "NOME DO USER",
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
}

Widget mostrarTela(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 28),
      ),
    );
