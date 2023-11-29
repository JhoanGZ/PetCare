import 'package:flutter/material.dart';

class RegisterStepThree extends StatelessWidget {
  const RegisterStepThree({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterStepThree'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mi registerStepThree',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
