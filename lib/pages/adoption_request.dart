import 'package:flutter/material.dart';

class AdoptionRequest extends StatelessWidget {
  final String itemID;

  const AdoptionRequest({super.key, required this.itemID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemID),
      ),
      body: Center(
        child: Text(
          'Bienvenido a la pantalla de solicitud de adopción con el ID: $itemID',
          style: const TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
