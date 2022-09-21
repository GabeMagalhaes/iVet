import 'dart:ui';
import 'package:flutter/material.dart';

class Consultas extends StatelessWidget {
  const Consultas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            color: Color.fromARGB(255, 85, 144, 200),
            height: 250,
            width: 380,
            child: Center(
              child: Text(" + MARCAR CONSULTA \n - ULTIMAS CONSULTAS"),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Ultimas Consultas',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),

        SizedBox(
          height: 280,
          child:ListView.separated(
            padding: EdgeInsets.only(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
                return buildVets();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 2,
              );
            },
            itemCount: 1
          ),
        )

        ],
      ),
    );
  }
}

Widget buildVets() => Container(
  child: Padding(
   padding: const EdgeInsets.only(right: 8.0, left: 8.00),
    child: Column(
      children: <Widget>[
        Card(
          child: ListTile(
          leading: Image.asset(
            'images/clinica2.png',
            width: 55,
            height: 60,
          ),
          title: Text(
            'Clinica Dra.Carmen',
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
            'images/clinica2.png',
            width: 55,
            height: 60,
          ),
          title: Text(
            'Clinica Dra.Carmen',
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
            'images/clinica2.png',
            width: 55,
            height: 60,
          ),
          title: Text(
            'Clinica Dra.Carmen',
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
    ),
  ),
);

