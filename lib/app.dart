import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/pages/home.dart';
import 'package:petcare_app/pages/login.dart';
import 'package:petcare_app/pages/register_step_one.dart';

class PetCareApp extends StatelessWidget {
  const PetCareApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.home:
            return MaterialPageRoute(builder: (context) => const Home());
          case AppRoutes.logIn:
            return MaterialPageRoute(builder: (context) => const LogInPage());  
          default:
            // return MaterialPageRoute(builder: (context) => const LogInPage());
            return MaterialPageRoute(builder: (context) => const RegisterStepOne());
        }
      },
    );
  }
}
