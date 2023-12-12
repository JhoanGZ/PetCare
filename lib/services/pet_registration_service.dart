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
    TextEditingController chipController, //int
    TextEditingController weightController,
    TextEditingController sterilizationController, //int
    TextEditingController genderController, //int
    TextEditingController ageController,
    TextEditingController descriptionController,
    String apiToken,
    int foundationId,
    int estadoMascota,
    BuildContext context
    
  ) async {
  // print('Datos recibidos en petRegistration:');
  // print('Pet Photo: ${petPhoto.path}');
  // print('Name: ${nameController.text}');
  // print('Vaccine: ${vaccineController.text}');
  // print('Race: ${raceController.text}');
  // print('Chip: ${chipController.text}');
  // print('Weight: ${weightController.text}');
  // print('Sterilization: ${sterilizationController.text}');
  // print('Gender: ${genderController.text}');
  // print('Age: ${ageController.text}');
  // print('Description: ${descriptionController.text}');
  // print('ApiToken: $apiToken');
  // print('ApiToken: $foundationId');

  String foundationIdConv = foundationId.toString();

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
    
    //Convertions 

    String sterilizationConv = sterilization == 'false' ? '0' : '1';
    int sterilizationConvToInt = int.parse(sterilizationConv);
    String chipConv = chip == 'false' ? '0' : '1';
    int chipConvToInt = int.parse(chipConv);
    String genderConv = gender == 'true' ? '0' : '1';
    int genderContToInt = int.parse(genderConv);


    print('tipo de dato chipConv ${chipConvToInt.runtimeType}');
    print('tipo de dato sterilization ${sterilizationConvToInt.runtimeType}');
    print('tipo de dato gender ${genderContToInt.runtimeType}');
    print('tipo de dato ESTADOMASCOTA ${estadoMascota.runtimeType}');

    try {
      final response = await http.post(
        Uri.parse('${AppUrls.baseUrlLocal}/api/pets/store'),
        headers: {
          'Authorization': 'Bearer $apiToken',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*',
        }, //TODO: ::LN:: Asignar Endpoint
        body: {
          'imagen': petPhoto,
          'vacuna': vaccine,
          'nombre': name,
          'raza': race,
          'peso': weight,
          'chip': chipConvToInt,
          'sexo': genderContToInt,
          'esteril': sterilizationConvToInt,
          'edad': age,
          'anotaciones': description,
          'estadoMascota': estadoMascota,
          'foundationId': foundationIdConv
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
            'Error al conectar con la API. Por favor, inténtalo de nuevo.😶‍🌫️',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
