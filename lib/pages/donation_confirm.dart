import 'package:flutter/material.dart';

class DonationConfirm extends StatelessWidget {
  const DonationConfirm({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DonationConfirm'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mi DonationConfirm',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
