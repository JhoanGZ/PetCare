import 'package:http/http.dart' as http;
import 'dart:convert';

class PetFindService {
  // Asynchronous method that takes a petId as an argument.
  // It fetches pet data from the server and returns a list of dynamic data.
  Future<List<dynamic>> findPet(int petId) async {
    try {
      // Sending an HTTP GET request to the server.
      final response = await http
          .get(Uri.parse('http://127.0.0.1:8000/api/pets/show/$petId'));

      // If the HTTP request is successful (status code 200),
      // it proceeds to parse the JSON response.
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        print(
            responseData); // Printing the received data for debugging purposes.
        return responseData; // Returning the parsed data.
      } else {
        // If the HTTP request is not successful,
        // it throws an exception with a detailed error message.
        throw Exception(
            'Error al cargar la lista de pets. Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      // Catching any exception that may occur during the HTTP request.
      print('Error en la solicitud HTTP: $e');
      throw Exception('Error al cargar la lista de pets. Detalles: $e');
    }
  }
}
