import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/config/app_urls.dart';
import 'package:petcare_app/models/register_data_transfer.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

Future<void> registrationService(
  DataRegistrationTransfer data, BuildContext context) async {
  String email = data.email;
  String rut = data.rut;
  String firstName = data.firstName;
  String lastName = data.lastName;
  String photo = data.photo;
  String phone = data.phone;
  String address = data.address;
  String dateBirth = data.dateBirth;
  // String female = data.female; // En lógica final quedo sin uso.
  String male = data.male;
  String password = data.password;
  // String passwordCheck = data.passwordCheck; // Gestión de PswCheck en FE
  String termAcceptance = data.termAcceptance;
  String gender;

  print('Datos recibidos en registrationService:');
  print('Email: ${data.email}');
  print('Rut: ${data.rut}');
  print('Nombre: ${data.firstName}');
  print('Apellido: ${data.lastName}');
  print('Foto: ${data.photo}');
  print('phone: ${data.phone}');
  print('Dirección: ${data.address}');
  print('Fecha de Nacimiento: ${data.dateBirth}');
  print('Femenino: ${data.female}');
  print('Masculino: ${data.male}');
  print('Contraseña: ${data.password}');
  print('Repetir Contraseña: ${data.passwordCheck}');
  print('Aceptación de Términos: ${data.termAcceptance}'); //NOTE: BORRAR

  gender = male == 'false' ? '1' : '0';

  if (true) {
    try {
      // Realizar la solicitud a la API
      final response = await http.post(
        //URL 
        Uri.parse('${AppUrls.baseUrlLocal}/api/register'),
        headers: {
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*',
        },
        body: {
          'rut': rut,
          'email': email,
          'nombre': firstName,
          'apellido': lastName,
          'password': password,
          // 'password_confirmation': passwordCheck,
          'fnac': dateBirth,
          'direccion': address,
          'sexo': gender,
          'celular': phone,
          'imagen': photo,
          'codigoVerificacion': 'null',
          // ignore: unrelated_type_equality_checks
          'aceptaTerminosDeUso': termAcceptance == true ? '1' : '0',
        },
      );

      // Por scaffold y snackbar no se debe crear una instancia que no se va a usar siempre, mejora el rendimiento. Se usa microtask
      Future.microtask(() {
        if (response.statusCode >= 200 && response.statusCode < 300) {
          // La autenticación fue exitosa
          var responseData = jsonDecode(response.body);
          print('Respuesta de la API: $responseData');

          print('Registro Exítoso');
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.logIn,
            (route) => false,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('¡Felicitaciones! ¡Ya estás registrado!👍'),
              duration: Duration(seconds: 4),
            ),
          );
        } else {
          print('Error en la autenticación: ${response.body}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error en el registro 😶. $response'),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      });
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
}
