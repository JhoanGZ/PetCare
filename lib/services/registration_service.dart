// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:petcare_app/config/app_routes.dart';

// Define una función para manejar la lógica de autenticación
Future<void> registrationService(
  GlobalKey<FormState> formKey,
  TextEditingController emailController,
  TextEditingController rutController,
  TextEditingController firstNameController,
  TextEditingController lastNameController,
  TextEditingController phoneController,
  TextEditingController addressController,
  TextEditingController dateBirthController,
  TextEditingController maleController,
  TextEditingController femaleController,
  TextEditingController passwordController,
  TextEditingController passwordCheckController,
  TextEditingController termAcceptanceController,
  BuildContext context,

) async {
  if (formKey.currentState!.validate()) {
    // Datos del usuario del formulario usando controladores
    String email = emailController.text;
    String rut = rutController.text;
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String fullName = "$firstName $lastName"; //NOTE: Revisar ::LUIGUI:: como van los datos con el nombre.

    try {
      // Realizar la solicitud a la API
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/login'), // TODO: Falta agregar Endpoint correcto.
        body: {
          'email': email,
          'rut': rut,
          'nombre': fullName,
        },
      );

      // Verificar la respuesta de la API y manejarla según sea necesario
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // La autenticación fue exitosa
        var responseData = jsonDecode(response.body);

        // Puedes hacer algo con la respuesta, por ejemplo, almacenar un token
        print('Respuesta de la API: $responseData');

        // Guarda los datos que necesitas o realiza otras acciones
        String userName = responseData['name']
            .toString(); // FIXME::LUIGUI::29-11-23:: Esta variable debe llegar al home.
        String userToken = responseData['token']
            .toString(); // FIXME::LUIGUI::29-11-23:: Este token deben ser llevado al home.
        bool userAuth = responseData['auth'] ==
            true; // FIXME::LUIGUI::29-11-23:: Esto no va a ninguna otra vista

        // Navega a la pantalla de inicio y pasa los datos necesarios
        if (userAuth) {
          print('LOGIN EXITOSO!');
          // ignore: use_build_context_synchronously
          Navigator.of(context)
              .pushNamed(AppRoutes.home, arguments: {userName, userToken});
        }
      } else {
        // La autenticación falló, puedes mostrar un mensaje de error al usuario
        print('Error en la autenticación: ${response.body}');
        // Puedes mostrar un mensaje de error al usuario
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Error en la autenticación. Verifica tus credenciales.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      // Manejar errores de conexión o de la API
      print('Error al conectar con la API: $e');
      // Puedes mostrar un mensaje de error al usuario
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Error al conectar con la API. Por favor, inténtalo de nuevo.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
