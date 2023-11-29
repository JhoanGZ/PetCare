import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Define una función para manejar la lógica de autenticación
Future<void> authenticationLogin(
  GlobalKey<FormState> formKey,
  TextEditingController emailController,
  TextEditingController passwordController,
  BuildContext context,
  String userName,
) async {
  if (formKey.currentState!.validate()) {
    // Datos del usuario del formulario usando controladores
    String email = emailController.text;
    String password = passwordController.text;

    try {
      // Realizar la solicitud a la API
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/login'), // URL correcta
        body: {
          'email': email,
          'password': password,
        },
      );

      // Verificar la respuesta de la API y manejarla según sea necesario
      if (response.statusCode == 200) {
        // La autenticación fue exitosa
        var responseData = json.decode(response.body);
        // Puedes hacer algo con la respuesta, por ejemplo, almacenar un token
        print('Respuesta de la API: $responseData');

        Navigator.of(context).pushNamed(AppRoutes.home, arguments: userName);
        // También puedes almacenar el token de acceso u otra información según sea necesario
      } else {
        // La autenticación falló, puedes mostrar un mensaje de error al usuario
        print('Error en la autenticación: ${response.body}');
      }
    } catch (e) {
      // Manejar errores de conexión o de la API
      print('Error al conectar con la API: $e');
    }
  }
}
