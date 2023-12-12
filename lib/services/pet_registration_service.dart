import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/config/app_urls.dart';

Future<void> petRegistration(
  GlobalKey<FormState> formKey,
  File petPhoto,
  TextEditingController nameController,
  TextEditingController vaccineController,
  TextEditingController raceController,
  TextEditingController chipController,
  TextEditingController weightController,
  TextEditingController sterilizationController,
  TextEditingController genderController,
  TextEditingController ageController,
  TextEditingController descriptionController,
  String apiToken,
  BuildContext context

) async {
  print('Datos recibidos en petRegistration:');
  print('Pet Photo: ${petPhoto.path}');
  print('Name: ${nameController.text}');
  print('Vaccine: ${vaccineController.text}');
  print('Race: ${raceController.text}');
  print('Chip: ${chipController.text}');
  print('Weight: ${weightController.text}');
  print('Sterilization: ${sterilizationController.text}');
  print('Gender: ${genderController.text}');
  print('Age: ${ageController.text}');
  print('Description: ${descriptionController.text}');
  print('ApiToken: $apiToken');

  if (formKey.currentState!.validate()) {
    String name = nameController.text;
    String vaccine = vaccineController.text;
    String race = raceController.text;
    String chip = chipController.text;
    String weight = weightController.text;
    String sterilization = sterilizationController.text;
    String gender = genderController.text;
    String age = ageController.text;
    String description = descriptionController.text;
    try {
      final response = await http.post(
        Uri.parse('${AppUrls.baseUrlLocal}/api/pets/store'),
        headers: {
          'Authorization': 'Bearer $apiToken',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*',
        }, //TODO: ::LN:: Asignar Endpoint
        body: {
          'vacuna': vaccine,
          'nombre': name,
          'raza': race,
          'peso': weight,
          'chip': chip,
          'sexo': gender,
          'esteril': sterilization,
          'edad': age,
          'anotaciones': description,
          'api_token': apiToken
        },
      );

      Future.microtask(() {
        if (response.statusCode >= 200 && response.statusCode < 300) {
          var responseData = jsonDecode(response.body);

          print('Respuesta de la API: $responseData');

          String userData = responseData['user'];
          bool userAuth = responseData['auth'] == true;

          if (userAuth) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Mascota Registrada 🤩',
                  textAlign: TextAlign.center,
                ),
                duration: Duration(seconds: 3),
              ),
            );
            Navigator.of(context).pushReplacementNamed(
              AppRoutes.ngoProfile,
              arguments: {userData},
            );
          }
        } else {
          print('Error en el registro: ${response.body}');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Error con la conexión.',
                textAlign: TextAlign.center,
              ),
              duration: Duration(seconds: 3),
            ),
          );
        }
      });
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
