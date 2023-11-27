import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';

class PetCareApp extends StatelessWidget {
  const PetCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Login();
      },
    );
  }
}

class Login {
  const Login();
}
