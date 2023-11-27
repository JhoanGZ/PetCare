import 'package:flutter/material.dart';

class PetCareApp extends StatelessWidget{
  const PetCareApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: const Login_page(key: key) 
    ,)    
  }
};

