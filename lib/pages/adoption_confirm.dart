import 'package:flutter/material.dart';

class AdoptionConfirm extends StatelessWidget {
  const AdoptionConfirm({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdoptionConfirm'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mi AdoptionConfirm',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
