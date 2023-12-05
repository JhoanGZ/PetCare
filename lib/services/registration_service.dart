import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/models/storage_transfer.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

Future<void> registrationService(DataRegistrationTransfer data, BuildContext context) async 
{
  String email = data.email;
  String rut = data.rut;
  String firstName = data.firstName;
  String lastName = data.lastName;
  String photo = data.photo;
  String address = data.address;
  String dateBirth = data.dateBirth;
  // String female = data.female; // En lógica final quedo sin uso.
  String male = data.male;
  String password = data.password;
  String passwordCheck = data.passwordCheck;
  String termAcceptance = data.termAcceptance;
  String gender;

  print('Datos recibidos en registrationService:');
  print('Email: ${data.email}');
  print('Rut: ${data.rut}');
  print('Nombre: ${data.firstName}');
  print('Apellido: ${data.lastName}');
  print('Foto: ${data.photo}');
  print('Dirección: ${data.address}');
  print('Fecha de Nacimiento: ${data.dateBirth}');
  print('Femenino: ${data.female}');
  print('Masculino: ${data.male}');
  print('Contraseña: ${data.password}');
  print('Repetir Contraseña: ${data.passwordCheck}');
  print('Aceptación de Términos: ${data.termAcceptance}');

  gender = male == 'false' ? '1' : '0';    

  if (formKey.currentState!.validate()) {
    try {
      // Realizar la solicitud a la API
      final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/login'),
      headers: {
        'Content-Type': 'application/json', //NOTE: ::LN:: Por si lo necesitas como application/json
      },
      body: jsonEncode({
        'email': email,
        'rut': rut,
        'nombre': '$firstName $lastName',
        'photo': photo,
        'address': address,
        'dateBirth': dateBirth,
        'gender': gender,
        'password': password,
        'passwordCheck': passwordCheck,
        'termAcceptance': termAcceptance
      }),
    );

      // Verificar la respuesta de la API y manejarla según sea necesario
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // La autenticación fue exitosa
        var responseData = jsonDecode(response.body);

        // Puedes hacer algo con la respuesta, por ejemplo, almacenar un token
        print('Respuesta de la API: $responseData');

        // Guarda los datos que necesitas o realiza otras acciones
        String userName = responseData['name'].toString();
        String userToken = responseData['token'].toString();
        bool userAuth = responseData['auth'] == true;

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
            content: Text('Error en la autenticación. Verifica tus credenciales.'),
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
          content: Text('Error al conectar con la API. Por favor, inténtalo de nuevo.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
