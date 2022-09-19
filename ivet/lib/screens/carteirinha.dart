import 'package:flutter/material.dart';

class Carteirinha extends StatelessWidget {
  const Carteirinha();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _build_Content(context));
  }
}

Widget _build_Content(BuildContext context){
  return Expanded(
    child: Container(
      color: Colors.amber,
    )
  );
}