import 'dart:async';

class UserManager {
  static final UserManager _instance = UserManager._internal();

  factory UserManager() {
    return _instance;
  }

  UserManager._internal();

  // Un controlador de flujo para emitir actualizaciones del usuario
  final _userController = StreamController<Map<String, dynamic>>.broadcast();

  // Getter para obtener el flujo de actualizaciones del usuario
  Stream<Map<String, dynamic>> get userStream => _userController.stream;

  // Método para actualizar el usuario y emitir la actualización
  // Añadi if para saber si tenemos el data stream cerrado
  void updateUser(Map<String, dynamic> userData) {
    print('en user_manager: $userData');
    if (_userController.isClosed) {
      _userController.addError('Stream closed');
    } else {
      _userController.add(userData);
    }
  }

  // Método para cerrar el controlador de flujo cuando ya no se necesite
  void dispose() {
    _userController.close();
  }
}

// class UserDataFormatter {
//   Map<String, dynamic> formatUserData(Map<String, dynamic> userData) {
//     Map<String, dynamic> formattedData = {
//       'user': {
//         'id': userData['user']['id'],
//         'rut': userData['user']['rut'],
//         'email': userData['user']['email'],
//         'nombre': userData['user']['nombre'],
//         'apellido': userData['user']['apellido'],
//         'fnac': userData['user']['fnac'],
//         'direccion': userData['user']['direccion'],
//         'sexo': userData['user']['sexo'],
//         'celular': userData['user']['celular'],
//         'imagen': userData['user']['imagen'],
//         'codigoVerificacion': userData['user']['codigoVerificacion'],
//         'aceptaTerminosDeUso': userData['user']['aceptaTerminosDeUso'],
//         'usuarioActivo': userData['user']['usuarioActivo'],
//         'email_verified_at': DateTime.parse(userData['user']['email_verified_at']), // Convertir a DateTime
//         'created_at': DateTime.parse(userData['user']['created_at']), // Convertir a DateTime
//         'updated_at': DateTime.parse(userData['user']['updated_at']), // Convertir a DateTime
//         // 'foundation': userData['user']['foundation'],
//       },
//       'foundation_id': userData['foundation_id'],
//       'auth': userData['auth'],
//     };

//     return formattedData;
//   }
// }

class UserDataFormatter {
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

// // Importa tu UserManager
// import 'path_to_user_manager/user_manager.dart';

// // Escucha actualizaciones del usuario
// UserManager().userStream.listen((userData) {
//   // Actualiza la interfaz de usuario según sea necesario con los datos del usuario
// });