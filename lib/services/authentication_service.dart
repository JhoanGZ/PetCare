import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/models/user_manager.dart';

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
      // Por scaffold no se debe crear una instancia que no se va a usar siempre, mejora el rendimiento. Se usa microtask
      Future.microtask(() {
        if (response.statusCode >= 200 && response.statusCode < 300) {
          // La autenticación fue exitosa
          Map<String, dynamic> responseData = json.decode(response.body);

          // Puedes hacer algo con la respuesta, por ejemplo, almacenar un token
          print('Respuesta de la API: $responseData');

          // Guarda los datos que necesitas o realiza otras acciones
          // dynamic userData = responseData['user'];
          bool userAuth = responseData['auth'] == true;

          UserDataFormatter formatter = UserDataFormatter();
          Map<String, dynamic> userData =
              formatter.formatUserData(responseData);

          print('Print de formatter antes de usar UserManager(): $formatter');

          UserManager().updateUser(userData);

          print('User data en Authentication_Service: $userData');

          // Navega a la pantalla de inicio y pasa los datos necesarios
          if (userAuth) {
            print('LOGIN EXITOSO!');
            // ignore: use_build_context_synchronously
            // Navigator.of(context).pushNamed(AppRoutes.home, arguments: {
            //   'userData': userData
            // },);
            Navigator.of(context).pushNamed(AppRoutes.home, arguments: {
                'userData': userData,
              },
            );
          }
          print('User Data después de LOGIN EXITOSO: $userData');
        } else {
          // La autenticación falló, puedes mostrar un mensaje de error al usuario
          print('Error en la autenticación: ${response.body}');
          // Puedes mostrar un mensaje de error al usuario
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: /*  */
                  Text('Error en la autenticación. Verifica tus credenciales.'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      });
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
