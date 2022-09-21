import 'dart:ui';

import 'package:flutter/material.dart';

class Atividade extends StatelessWidget {
  const Atividade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 145,
            child: ListView.separated(
                padding: EdgeInsets.only(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return buildCard();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 15,
                  );
                },
                itemCount: 4),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Novidades',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Card(
                  child: ListTile(
                leading: Image.asset(
                  'images/noticia1.png',
                  width: 60,
                  height: 60,
                ),
                title: Text(
                  'Campanha de vacinação',
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
                  'images/noticia2.png',
                  width: 55,
                  height: 60,
                ),
                title: Text(
                  'Campanha de castração',
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
                  'images/noticia3.png',
                  width: 55,
                  height: 60,
                ),
                title: Text(
                  'Campanha de adoção',
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
          )
        ],
      ),
    );
  }
}

Widget buildCard() => Card(
  elevation: 5,
  child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              'Proxima consulta',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 50,
            )
          ],
        ),
        SizedBox(height: 2),
        Row(
          children: [
            Text(
              'Clinica: Z',
              style: TextStyle(fontSize: 11),
            ),
            SizedBox(
              width: 113,
            ),
          ],
        ),
        SizedBox(height: 2),
        Row(
          children: [
            Text(
              'Doutor: X',
              style: TextStyle(fontSize: 11),
            ),
            SizedBox(
              width: 113,
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Data:',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 113,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '10/08/2022',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 0,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ),
);
