import 'package:flutter/material.dart';
import 'package:petcare_app/design/themes.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Hola mundo', 
      style: PetCareThemes.titleTextStyle)),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            'estoy aprendiendo flutter',
            style: PetCareThemes.statementTextStyle,
          ),
        ),
      ),
    ),
  ));
}
