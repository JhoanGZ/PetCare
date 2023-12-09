// import 'package:flutter/material.dart';
// import 'package:petcare_app/config/app_routes.dart';
// import 'package:petcare_app/design/colors.dart';
// import 'package:petcare_app/design/themes.dart';
// import 'package:petcare_app/models/home_list.dart'; // Importa la lista items
// import 'package:petcare_app/pages/adoption_request.dart';
// import 'package:petcare_app/widgets/expandable_text.dart';

// // ignore: must_be_immutable
// class Home extends StatefulWidget {
//   final Map<String, dynamic> userData;
//   // ignore: use_super_parameters
//   const Home({Key? key, required this.userData}) : super(key: key);

//   @override
//   HomeState createState() => HomeState();
// }

// class HomeState extends State<Home> {
//   //bool showDonationSection = false;
//   late Map<String, dynamic> userData;
//   @override
//   void initState() {
//     super.initState();
//     userData = widget.userData;
//     print('userData in initState: $userData');
//   }

//   @override
//   Widget build(BuildContext context) {
//     var user = widget.userData?['user'];
//     var nombre = user?['nombre'] ?? 'Nombre no disponible';
//     print('userData in build: ${widget.userData}');
//     print('Nombre: $nombre'); 
//     bool showButtons = widget.userData['foundation_id'] != null &&
//         widget.userData['foundation_id'] == 0;
//     '0'; //TODO::LUIGUI::EJEMPLO DE CONSUMO DE DATOS:: AQUI ESTOY ACCEDIENDO A 'foundation_id'

//     return Scaffold(
//       appBar: AppBar(
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(10),
//           ),
//         ),
//         title: Row(
//           children: [
//             Image.asset(
//               (widget.userData?['user']?['imagen'] ?? 'assets/images/default_user_image.png') as String,
//               width: 21,
//               height: 21,
//             ),
//             Expanded(
//                 child: Text(
//               widget.userData['user']?['nombre'] ?? 'Nombre no disponible',
//               style: PetCareThemes.buttonTextStyle,
//             )),
//             // TODO: AQUÍ VA LA IMAGEN DE USUARIO
//             GestureDetector(
//               onTap: () {
//                 //NOTE: cambio de '0' a 0 (int)
//                 if (widget.userData['user'] != null &&
//                     widget.userData['user']['imagen'] != null &&
//                     widget.userData['user']['foundation_id'] != null &&
//                     widget.userData['user']['foundation_id'] == 0) {
//                   Navigator.of(context).pushNamed(
//                     AppRoutes.userProfile,
//                     arguments: {'userData': widget.userData},
//                   );
//                 } else {
//                   Navigator.of(context).pushNamed(
//                     AppRoutes.ngoProfile,
//                     arguments: {
//                       'userData': widget.userData,
//                       'foundationIdClick': widget.userData['foundation_id']
//                     },
//                   );
//                 }
//                 // Coloca aquí la lógica que deseas ejecutar al hacer clic en el botón
//               },
//               child: Image.asset(
//                 widget.userData['user']['imagen'],
//                 width: 21,
//                 height: 21,
//               ),
//             )
//           ],
//         ), // Widget del título del AppBar
//         backgroundColor: PetCareColors.brandPrimaryColor,
//         toolbarHeight: 28,
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(top: 13),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Elementos en fila: icono de perfil y título
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).pushNamed(
//                           AppRoutes.ngoProfile,
//                           arguments: {
//                             'userData': widget.userData,
//                             'foundationIdClick': items[index].idfoundation
//                           },
//                         );
//                       },
//                       child: Image.asset(
//                         items[index].profileIcon, // Icono de perfil
//                         width: 38,
//                         height: 38,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 8,
//                     ), // Espacio entre el icono y el texto
//                     Text(
//                       items[index].title,
//                       style: PetCareThemes.nameProfileTextStyle,
//                     ), // Título del elemento // Título del elemento
//                   ],
//                 ),
//                 const SizedBox(
//                     height: 8), // Espacio entre el título y la imagen
//                 // Imagen principal
//                 Image.asset(
//                   items[index].photo, // Ruta de la imagen
//                   width: double.infinity, // Ancho completo
//                   height: 500, // Altura fija
//                   fit: BoxFit.cover, // Ajuste de la imagen
//                 ),
//                 const SizedBox(
//                     height: 8), // Espacio entre la imagen y la descripción
//                 //======================================================botones
//                 if (showButtons)
//                   Row(
//                     children: [
//                       const SizedBox(
//                         width: 4,
//                       ),
//                       Container(
//                         width: 30,
//                         height: 30,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: PetCareColors.brandPrimaryColor,
//                         ),
//                         child: GestureDetector(
//                           child: IconButton(
//                             onPressed: () {
//                               // Navigator.push(
//                               //     context,
//                               //     MaterialPageRoute(
//                               //         builder: (context) =>
//                               //             BuyMe(photoPet: items[index].photo)));
//                               Navigator.of(context).pushNamed(
//                                 AppRoutes.buyMe,
//                                 arguments: {
//                                   'userData': widget.userData,
//                                   'photoPet': items[index].photo
//                                 },
//                               );
//                             },
//                             icon: Image.asset(
//                               'assets/images/icon_donation_home.png',
//                               width: 30,
//                               height: 30,
//                             ),
//                           ),
//                         ),
//                       ),
//                       //otro boton
//                       const SizedBox(width: 4),
//                       Container(
//                         width: 30,
//                         height: 30,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: PetCareColors
//                               .brandPrimaryColor, // Color de fondo del botón
//                         ),
//                         child: GestureDetector(
//                           child: IconButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => AdoptionRequest(
//                                       itemID: items[index].idPet),
//                                 ),
//                               );
//                               // Acción al presionar el botón
//                             },
//                             icon: Image.asset(
//                                 'assets/images/icon_adoption_home.png',
//                                 width: 30,
//                                 height: 30),
//                           ),
//                         ),
//                       ),
//                       //otro boton
//                       const SizedBox(width: 4),
//                       Container(
//                         width: 30,
//                         height: 30,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: PetCareColors
//                               .brandPrimaryColor, // Color de fondo del botón
//                         ),
//                         child: GestureDetector(
//                           child: IconButton(
//                             onPressed: () {
//                               // Acción al presionar el botón
//                             },
//                             icon: Image.asset(
//                                 'assets/images/icon_share_home.png',
//                                 width: 30,
//                                 height: 30),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 256,
//                       ),

//                       Expanded(
//                         child: Container(
//                           width: 30,
//                           height: 30,
//                           decoration: const BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: PetCareColors
//                                 .brandPrimaryColor, // Color de fondo del botón
//                           ),
//                           child: IconButton(
//                             onPressed: () {
//                               // Acción al presionar el botón
//                             },
//                             icon: Image.asset(
//                               'assets/images/icon_save_home.png',
//                               width: 30,
//                               height: 30,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),

//                 Row(
//                   children: [
//                     const SizedBox(
//                       width: 4,
//                     ),
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         items[index].title,
//                         style: PetCareThemes.nameProfileTextStyle,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     const SizedBox(width: 8),
//                     ExpandText(
//                       text: items[index].description,
//                       maxLines: 15,
//                     ), // D
//                   ],
//                 ),
//                 // Utilizando el widget ExpandableTextWidget
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/colors.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/models/home_list.dart';
import 'package:petcare_app/pages/adoption_request.dart';
import 'package:petcare_app/widgets/expandable_text.dart';

class Home extends StatefulWidget {
  final Map<String, dynamic> userData;

  const Home({Key? key, required this.userData}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late Map<String, dynamic> userData;

  @override
  void initState() {
    super.initState();
    userData = widget.userData;
    print('userData in initState: $userData');
  }

  @override
  Widget build(BuildContext context) {
    dynamic user = userData?['user'];
    dynamic nombre = user?['nombre'] ?? 'Nombre no disponible';
    dynamic userImage = user?['imagen'] ?? 'assets/images/default_user_image.png';
    print('userData in build: $userData');
    print('Nombre: $nombre');

    bool showButtons = userData['foundation_id'] != null &&
        userData['foundation_id'] == 0;

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: Row(
          children: [
            Image.asset(
              (userImage),
              width: 21,
              height: 21,
            ),
            Expanded(
              child: Text(
                user?['nombre'] ?? 'Nombre no disponible',
                style: PetCareThemes.buttonTextStyle,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (user != null &&
                    user['imagen'] != null &&
                    user['foundation_id'] != null &&
                    user['foundation_id'] == 0) {
                  Navigator.of(context).pushNamed(
                    AppRoutes.userProfile,
                    arguments: {'userData': userData},
                  );
                } else {
                  Navigator.of(context).pushNamed(
                    AppRoutes.ngoProfile,
                    arguments: {
                      'userData': userData,
                      'foundationIdClick': user['foundation_id']
                    },
                  );
                }
              },
              child: Image.asset(
                user?['imagen'] as String,
                width: 21,
                height: 21,
              ),
            )
          ],
        ),
        backgroundColor: PetCareColors.brandPrimaryColor,
        toolbarHeight: 28,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.ngoProfile,
                          arguments: {
                            'userData': userData,
                            'foundationIdClick': items[index].idfoundation
                          },
                        );
                      },
                      child: Image.asset(
                        items[index].profileIcon,
                        width: 38,
                        height: 38,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      items[index].title,
                      style: PetCareThemes.nameProfileTextStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Image.asset(
                  items[index].photo,
                  width: double.infinity,
                  height: 500,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                if (showButtons)
                  Row(
                    children: [
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: PetCareColors.brandPrimaryColor,
                        ),
                        child: GestureDetector(
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.buyMe,
                                arguments: {
                                  'userData': userData,
                                  'photoPet': items[index].photo
                                },
                              );
                            },
                            icon: Image.asset(
                              'assets/images/icon_donation_home.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: PetCareColors.brandPrimaryColor,
                        ),
                        child: GestureDetector(
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AdoptionRequest(
                                    itemID: items[index].idPet,
                                  ),
                                ),
                              );
                            },
                            icon: Image.asset(
                              'assets/images/icon_adoption_home.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: PetCareColors.brandPrimaryColor,
                        ),
                        child: GestureDetector(
                          child: IconButton(
                            onPressed: () {
                              // Acción al presionar el botón
                            },
                            icon: Image.asset(
                              'assets/images/icon_share_home.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 256,
                      ),
                      Expanded(
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: PetCareColors.brandPrimaryColor,
                          ),
                          child: IconButton(
                            onPressed: () {
                              // Acción al presionar el botón
                            },
                            icon: Image.asset(
                              'assets/images/icon_save_home.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                Row(
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        items[index].title,
                        style: PetCareThemes.nameProfileTextStyle,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 8),
                    ExpandText(
                      text: items[index].description,
                      maxLines: 15,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
