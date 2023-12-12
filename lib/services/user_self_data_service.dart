// ignore: avoid_web_libraries_in_flutter
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:petcare_app/config/app_urls.dart';

Future<void> userSelfData(
  int userId,
) async {
  try {
    final response = await http.post(
      Uri.parse('${AppUrls.baseUrlLocal}/api/user/show/$userId'),
    );

    Future.microtask(() {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Map<String, dynamic> responseData = json.decode(response.body);
        dynamic userData = responseData['user'];
        bool userAuth = responseData['auth'] == true;

        print('------------------');
        print('------------------');
        print(userData);
        print(' ');

        if (userAuth) {
          print('LOGIN EXITOSO!');
          return userData;
        }
      } else {
        print('Usuario no existe: ${response.body}');
        ScaffoldMessenger.of(context as BuildContext).showSnackBar(
          const SnackBar(
            content: Text(
              'El usuario no existe.',
            ),
            duration: Duration(seconds: 3),
          ),
        );
      }
    });
  } catch (e) {
    print('Error al conectar con la API: $e');
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(
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
