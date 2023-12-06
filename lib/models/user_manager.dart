// SIN USO, NO SE BORRA POR SI SE NECESITASE<=======
// class User {
//   String name;
//   String token;
//   int foundationId; // Cambiado a int

//   User({
//     required this.name,
//     required this.token,
//     required this.foundationId,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       name: json['name'],
//       token: json['token'],
//       foundationId: json['foundationId'],
//     );
//   }
// }

// class NormalUser extends User {
//   String firstName, lastName, email, phone;

//   NormalUser({
//     required super.name,
//     required super.token,
//     required super.foundationId,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.phone,
//   });
// }

// class NgoUser extends User {
//   String organizationName;

//   NgoUser({
//     required super.name,
//     required super.token,
//     required super.foundationId,
//     required this.organizationName,
//   });

//   
// }

// // class UserLoader {
// //   static Future<User> loadUser() async {
// //     datos de la base de datos
// //     Map<String, dynamic> userData = {
// //       'name': 'Nombre del Usuario',
// //       'token': 'TokenUsuario123',
// //       'organizationName': 'Nombre de la Organización', // Solo para NgoUser
// //     };

// //     // Determina si el usuario es un User normal o un NgoUser
// //     if (userData.containsKey('organizationName')) {
// //       return NgoUser(
// //         name: userData['name'],
// //         token: userData['token'],
// //         organizationName: userData['organizationName'], userType: '',
// //       );
// //     } else {
// //       return User(
// //         name: userData['name'],
// //         token: userData['token'], userType: '',
// //       );
// //     }
// //   }
// // }


// class UserManager {
//   static User? _currentUser;

//   // ignore: unnecessary_getters_setters - MIENTRAS SE IMPLEMENTA -
//   static User? get currentUser => _currentUser;

//   static set currentUser(User? user) {
//     _currentUser = user;
//   }
// }