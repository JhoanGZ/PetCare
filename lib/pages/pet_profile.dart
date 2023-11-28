import 'package:flutter/material.dart';

class PetProfile extends StatelessWidget {
  const PetProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PetProfile'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mi PetProfile',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
