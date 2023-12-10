import 'dart:async';

class HomeManager {
  static final HomeManager _instance = HomeManager._internal();

  factory HomeManager() {
    return _instance;
  }

  HomeManager._internal();

  // Un controlador de flujo para emitir actualizaciones del usuario
  final _homeController = StreamController<Map<String, dynamic>>.broadcast();

  // Getter para obtener el flujo de actualizaciones del usuario
  Stream<Map<String, dynamic>> get userStream => _homeController.stream;

  // Método para actualizar el usuario y emitir la actualización
  // Añadi if para saber si tenemos el data stream cerrado
  void updateUser(Map<String, dynamic> userData) {
    print('en user_manager: $userData');
    if (_homeController.isClosed) {
      _homeController.addError('Stream closed');
    } else {
      _homeController.add(userData);
    }
  }

  // Método para cerrar el controlador de flujo cuando ya no se necesite
  void dispose() {
    _homeController.close();
  }
}

class HomeDataFormatter {
  Map<String, dynamic> formatUserData(Map<String, dynamic> userData) {
    Map<String, dynamic> formattedData = {
      'user': {
        'id': userData['user']['id'],
        'rut': userData['user']['rut'],
        'email': userData['user']['email'],
        'nombre': userData['user']['nombre'],
        'apellido': userData['user']['apellido'],
        'fnac': userData['user']['fnac'], 
        'direccion': userData['user']['direccion'],
        'sexo': userData['user']['sexo'],
        'celular': userData['user']['celular'],
        'imagen': userData['user']['imagen'],
        'codigoVerificacion': userData['user']['codigoVerificacion'],
        'aceptaTerminosDeUso': userData['user']['aceptaTerminosDeUso'],
        'usuarioActivo': userData['user']['usuarioActivo'],
        'email_verified_at': userData['user']['email_verified_at'], 
        'created_at': userData['user']['created_at'], 
        'updated_at': userData['user']['updated_at'], 
      },
      'foundation_id': userData['foundation_id'],
      'auth': userData['auth'],
    };

    return formattedData;
  }
}
