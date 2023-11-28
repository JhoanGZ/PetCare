import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('contact'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mi contact',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}