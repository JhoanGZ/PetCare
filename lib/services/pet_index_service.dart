import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:petcare_app/config/app_urls.dart';

class PetIndexService {
  Future<List<dynamic>> getPetList(apiToken) async {
    // Obtener el token de tu lugar de almacenamiento (preferiblemente seguro)

    //String? apiToken = '30|1IKPPc1O0NSZaOOVlOvL39Zm8dQXAzG31RHp6YOF0d8a5ec4';

    try {
      // 1. Realiza una solicitud GET a la URL proporcionada
      final response = await http.get(
        
        Uri.parse('${AppUrls.baseUrlLocal}/api/pets/index'),
        headers: {
          'Authorization': 'Bearer $apiToken',
          'Accept': 'application/json',
        },
      );

      // 2. Verifica si la solicitud fue exitosa (código de estado 200)
      if (response.statusCode == 200) {
        // 3. Si la solicitud es exitosa, devuelve la lista de pets
        var responseData = json.decode(response.body);
        print(
            'Respuesta de la API: $responseData'); // Imprime en consola para visualizar la recepción de los datos.

        return responseData; // Retorna los datos obtenidos y tratados
      } else {
        // 4. Si la solicitud falla, arroja una excepción
        throw Exception(
            'Error al cargar la lista de pets. Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      // 5. Captura cualquier excepción durante la solicitud HTTP
      print('Error en la solicitud HTTP: $e');
      throw Exception('Error al cargar la lista de pets. Detalles: $e');
    }
  }
}
