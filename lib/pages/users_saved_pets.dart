import 'package:flutter/material.dart';

class UserSavedPets extends StatelessWidget {
  const UserSavedPets({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserSavedPets'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mi UserSavedPets',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
