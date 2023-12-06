import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:petcare_app/config/app_routes.dart';
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
  print('Aceptación de Términos🥵🍆💧: ${data.termAcceptance}');

  gender = male == 'false' ? '1' : '0';

  if (true) {
    try {
      // Realizar la solicitud a la API
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/register'),
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

          // 'rut': '261740002', // TODO::LUIGUI:: ESTOS COMENTARIOS SON UN EJEMPLO DE LLENADO QUE SE ENVÍA SIN PROBLEMAS..
          // 'email': 'luivin@gmail.com',
          // 'nombre': 'Luigui',
          // 'apellido': 'Vinci',
          // 'password': '123456',
          // 'fnac': '1997-01-01',
          // 'direccion': 'Paradisi',
          // 'sexo': '0',
          // 'celular': '1234567',
          // 'imagen': 'null',
          // 'codigoVerificacion': 'null',
          // 'aceptaTerminosDeUso': '1',
        },
      );

      // Verificar la respuesta de la API y manejarla según sea necesario
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // La autenticación fue exitosa
        var responseData = jsonDecode(response.body);

        // Puedes hacer algo con la respuesta, por ejemplo, almacenar un token
        print('Respuesta de la API: $responseData');

        // Guarda los datos que necesitas o realiza otras acciones
        String userName = responseData['name']
            .toString(); // Ajusta la clave según la respuesta real
        String userToken = responseData['token']
            .toString(); // Ajusta la clave según la respuesta real
        bool userAuth = responseData['auth'] == true;

        // Navega a la pantalla de inicio y pasa los datos necesarios
        if (userAuth) {
          print('LOGIN EXITOSO🍆🥵!');
          Navigator.of(context)
              .pushNamed(AppRoutes.home, arguments: {userName, userToken});
        }
      } else {
        // La autenticación falló, puedes mostrar un mensaje de error al usuario
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
      // Manejar errores de conexión o de la API
      print('Error al conectar con la API: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Error al conectar con la API. Por favor, inténtalo de nuevo.', textAlign: TextAlign.center,),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
