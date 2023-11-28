import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';

class RegisterStepOne extends StatelessWidget {
  const RegisterStepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.home);
            }),
      ),
    );
  }
}
