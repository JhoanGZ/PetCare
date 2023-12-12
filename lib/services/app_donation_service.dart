import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/config/app_urls.dart';


Future<void> sendDonationApp(
  GlobalKey<FormState> formKey,
  int donationAmount, 
  BuildContext context
) async {
  print('Se recibe dato en donation_petcara_service:$donationAmount');

  try {
    final response = await http.post(
      Uri.parse('${AppUrls.baseUrlLocal}/api/login'),  //FIXME:LUIGUI, asignar EP
        headers: {
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
      }, 
      body: {'amount': donationAmount.toString()},
    );
    if (response.statusCode >= 200 || response.statusCode <= 300) {
      var responseData = jsonDecode(response.body);
      print('Respuesta de la API: $responseData');
      Future.microtask((){
        showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: const Text('Donación Enviada ✅'),
              actions: [
                TextButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed(
                    AppRoutes.logIn,
                  );
                },
                child: const Text('Cerrar'),
                ),
              ],
            );
          },
        );
          
        }
      );
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