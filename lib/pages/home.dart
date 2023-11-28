import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi aplicación'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mi aplicación',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
