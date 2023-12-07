import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:petcare_app/config/app_routes.dart';

// Define una función para manejar la lógica de autenticación
Future<void> petRegistration(
  GlobalKey<FormState> formKey,
  TextEditingController nameController,
  TextEditingController vaccineController,
  TextEditingController raceController,
  TextEditingController weightController,
  TextEditingController genderController,
  TextEditingController ageController,
  TextEditingController descriptionController,
  BuildContext context,
) async {
  if (formKey.currentState!.validate()) {
    // Datos del usuario del formulario usando controladores
    String name = nameController.text; 
    String vaccine = vaccineController.text;  
    String race = raceController.text;  
    String weight = weightController.text;  
    String gender = genderController.text;  
    String age = ageController.text;  
    String description = descriptionController.text; 
    try {
      // Realizar el envío a la API
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/login'), //TODO: ::LN:: Asignar Endpoint
        body: {
          'name' : name, 
          'vaccine' : vaccine,  
          'race' : race,  
          'weight' : weight,  
          'gender' : gender,  
          'age' : age,  
          'description' : description, 
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var responseData = jsonDecode(response.body);

        print('Respuesta de la API: $responseData');

        String userData = responseData['user'];
        bool userAuth = responseData['auth'] == true;

        // Navega a la pantalla de inicio y pasa los datos necesarios
        if (userAuth) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushNamed(
            AppRoutes.home,
            arguments: {userData},
          );
        }
      } else {
        print('Error en la autenticación: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Error en la autenticación. Verifica tus credenciales.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      print('Error al conectar con la API: $e');
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
