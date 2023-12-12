import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/config/app_urls.dart';

Future<void> sendDonationPet(
    GlobalKey<FormState> formKey,
    String donationAmount,
    String idPet,
    String idUser,
    dynamic userData,
    BuildContext context) async {

  print('Se recibe dato en donation_pet_service:$donationAmount');
  print('Se recibe dato en donation_pet_service:$idPet');
  print('Se recibe dato en donation_pet_service:$idUser');
  // print('Se recibe dato en donation_pet_service:$userData');

  try {
    final response = await http.post(
      Uri.parse('${AppUrls.baseUrlLocal}/api/login'), //FIXME:LUIGUI, asignar EP
      headers: {
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
      }, 
      body: {
        'donationAmount': donationAmount.toString(),
        'idPet' : idPet,
        'idUser' : idUser
      },
    );
    if (response.statusCode >= 200 || response.statusCode <= 300) {
      var responseData = jsonDecode(response.body);
      print('Respuesta de la API: $responseData');
      Future.microtask(() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Donación Enviada ✅'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed(AppRoutes.home,
                      arguments: {
                        'userData': userData,
                        'foundationIdClick': userData['foundation_id']
                    });
                  },
                  child: const Text('Cerrar'),
                ),
              ],
            );
          },
        );
      });
    } else {
      Future.microtask(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error en el envío 😶. $response'),
            duration: const Duration(seconds: 3),
          ),
        );
      });
    }
  } catch (e) {
    Future.microtask(() {
      print('Error al conectar con la API: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Error al conectar con la API. Por favor, inténtalo de nuevo.😶‍🌫️',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
    });
  }
}
