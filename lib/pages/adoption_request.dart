import 'package:flutter/material.dart';

class AdoptionRequest extends StatelessWidget {
  const AdoptionRequest({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdoptionRequest'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mi AdoptionRequest',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
