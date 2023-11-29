import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:petcare_app/config/app_routes.dart';

// Define una función para manejar la lógica de autenticación
Future<void> authenticationLogin(
  GlobalKey<FormState> formKey,
  TextEditingController emailController,
  TextEditingController passwordController,
  BuildContext context,
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
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // La autenticación fue exitosa
        var responseData = jsonDecode(response.body);

        // Puedes hacer algo con la respuesta, por ejemplo, almacenar un token
        print('Respuesta de la API: $responseData');

        print('Tipo de datos de token: ${responseData['token'].runtimeType}');
        print('Tipo de datos de auth: ${responseData['auth'].runtimeType}');

        // Guarda los datos que necesitas o realiza otras acciones
        String userToken = responseData['token'].toString();
        bool userAuth = responseData['auth'] == true;

        // Puedes almacenar estos datos en algún lugar, por ejemplo, utilizando Provider o SharedPreferences

        // Navega a la pantalla de inicio y pasa los datos necesarios
        if (userAuth) {
          print('LOGIN EXITOSO!');
          bool parsedToken = userToken
              .isNotEmpty; // Tratar el token como true si no está vacío
          // TODO: 29-11-2023 LUIGUI DICE: El error está en la línea del Navigator, al comentarla no se crashea, de resto se envía y recibe la respuesta de la api al enviar los datos.
          Navigator.of(context)
              .pushNamed(AppRoutes.home, arguments: {'userToken': parsedToken});
        }
      } else {
        // La autenticación falló, puedes mostrar un mensaje de error al usuario
        print('Error en la autenticación: ${response.body}');
        // Puedes mostrar un mensaje de error al usuario
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Error al conectar con la API. Por favor, inténtalo de nuevo.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
