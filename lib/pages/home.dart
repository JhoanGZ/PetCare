import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String userValid;  
  const Home({super.key, required this.userValid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userValid),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mi Home',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
