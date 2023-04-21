import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text("Fitly"),
      centerTitle: true,
      backgroundColor: Colors.green[800],
    ),
    body: Center(
      child: Text("Hello World",
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.orange,
        //fontFamily: Font
      )),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){},
      child: Icon(Icons.add),
      backgroundColor: Colors.green[800],
    ),
  ),

));

