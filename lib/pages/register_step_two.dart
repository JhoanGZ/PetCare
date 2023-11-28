import 'package:flutter/material.dart';

class RegisterStepTwo extends StatelessWidget {
  const RegisterStepTwo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterStepTwo'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mi RegisterStepTwo',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
