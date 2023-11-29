import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String userName; // TODO::LUIGUI::29-11-23:: Declaro variables
  final String userToken; // TODO::LUIGUI::29-11-23:: Declaro variables
  const Home({super.key, this.userName = 'Invitado', this.userToken = 'null'});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
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
