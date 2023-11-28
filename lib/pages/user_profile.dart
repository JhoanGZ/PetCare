import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserProfile'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mi UserProfile',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
