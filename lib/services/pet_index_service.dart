import 'package:http/http.dart' as http;
import 'dart:convert';

class PetIndexService {
  Future<List<dynamic>> getPetList() async {
    try {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/api/pets/index'));

      if (response.statusCode == 200) {
        // Si la solicitud es exitosa, devuelve la lista de pets
        var responseData = json.decode(response.body);
        print(
            responseData); // Imprime en consola para visualizar la recepción de los datos.
        return responseData; // Retorna los datos obtenidos y tratados
      } else {
        // Si la solicitud falla, arroja una excepción
        throw Exception(
            'Error al cargar la lista de pets. Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      // Captura cualquier excepción durante la solicitud HTTP
      print('Error en la solicitud HTTP: $e');
      throw Exception('Error al cargar la lista de pets. Detalles: $e');
    }
  }
}
