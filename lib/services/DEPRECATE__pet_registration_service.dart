import 'package:http/http.dart' as http;
import 'dart:convert';

Map<String, dynamic> _petData = {
  // EJEMPLO DE CÓMO SE VEN LOS DATOS QUE SE ENVÍAN
// ESTA ES LA ESTRUCTURA Y DATOS QUE DEBEN SER ENVIADOS A LA API..
  'vacunas': 'Vacuna contra la rabia',
  'nombre': 'Firulais',
  'raza': 'Labrador Retriever',
  'peso': 10,
  'chip': 123456789,
  'sexo':
      1, // 0 para masculino, 1 para femenino (ajustar según la convención de tu API)
  'esteril':
      0, // 1 para esterilizado, 0 para no esterilizado (ajustar según la convención de tu API)
  'edad': 3,
  'anotaciones': 'Es un perro muy juguetón',
};

class PetRegistrationService {
  Future<void> registerPet(Map<String, dynamic> petData) async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/pets/store'),
        headers: {
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*',
        },
        body:
            _petData, //TODO::LUIGUI:: Esto usa los datos falsos de la línea 4, debe cambiarse por la variable petData para recibir los datos por parámetros.
      );

      Future.microtask(() {
        if (response.statusCode >= 200 && response.statusCode < 300) {
          // El registro fue exitoso
          var responseData = jsonDecode(response.body);
          print('Respuesta de la API: $responseData');

          // Puedes realizar acciones adicionales con la respuesta, si es necesario
        } else {
          // El registro falló
          print('Error en el registro: ${response.body}');
          // Puedes manejar el error según tus necesidades
        }
      });
    } catch (e) {
      // Manejar errores de conexión o de la API
      Future.microtask(() {
        print('Error al conectar con la API: $e');
        // Puedes manejar el error según tus necesidades
      });
    }
  }
}
