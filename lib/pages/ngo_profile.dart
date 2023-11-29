import 'package:flutter/material.dart';

class NgoProfile extends StatelessWidget {
  const NgoProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NgoProfile'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mi NgoProfile',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
