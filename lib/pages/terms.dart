import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mi Terms',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
