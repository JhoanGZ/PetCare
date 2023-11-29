import 'package:flutter/material.dart';

class RetrievePass extends StatelessWidget {
  const RetrievePass({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RetrievePass'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mi RetrievePass',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}