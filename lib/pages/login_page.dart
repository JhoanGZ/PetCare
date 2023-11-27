import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage>{
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Center (
        child: Text('Hola.'),
        ),
    );
  }
}
