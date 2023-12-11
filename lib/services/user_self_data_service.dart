// ignore: avoid_web_libraries_in_flutter
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> userSelfData(
  int userId,
) async {
  try {
    final response = await http.post(
      // URL no cel
       Uri.parse('http://127.0.0.1:8000/api/user/show/$userId'), 
      // URL cel JG      
      //Uri.parse('http://192.168.0.16:8000/api/user/show/$userId'),
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
          'Error al conectar con la API. Por favor, inténtalo de nuevo.',
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
