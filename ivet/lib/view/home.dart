import 'package:flutter/material.dart';

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
        mostrarTela('Atividade'),
        mostrarTela('Clínicas'),
        mostrarTela('Consultas'),
        mostrarTela('Carteira de vacinação'),
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
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.border_all_rounded,
                size: 32,
              ),
              onPressed: () {}),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  size: 32,
                ),
                onPressed: () {})
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Atividade',
              ),
              Tab(
                text: 'Clinicas',
              ),
              Tab(
                text: 'Consultas',
              ),
              Tab(
                text: 'Carteira de vacinação',
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
