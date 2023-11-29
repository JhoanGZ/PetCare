import 'package:flutter/material.dart';

class AdoptionAccept extends StatelessWidget {
  const AdoptionAccept({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdoptionAccept'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mi AdoptionAccept',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
