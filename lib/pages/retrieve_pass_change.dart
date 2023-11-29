import 'package:flutter/material.dart';

class RetrievePassChange extends StatelessWidget {
  const RetrievePassChange({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RetrievePassChange'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mi RetrievePassChange',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
