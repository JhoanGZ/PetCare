import 'package:flutter/material.dart';

class BuyMe extends StatelessWidget {
  const BuyMe({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BuyMe'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mi BuyMe',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}