import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Hola mundo')),
      body: const Padding(
        padding:  EdgeInsets.all(8.0),
        child: Center(
          child: Text('estoy aprendiendo flutter', 
          style: TextStyle(fontSize: 25)),
          
          ),
      )
    )
    ));
}
