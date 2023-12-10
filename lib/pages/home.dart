import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/colors.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/models/home_list.dart'; // Importa la lista items
import 'package:petcare_app/models/user_manager.dart';
import 'package:petcare_app/pages/adoption_request.dart';
import 'package:petcare_app/widgets/expandable_text.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({super.key, required this.userData});
  Map<String, dynamic> userData =
      (UserManager().userStream.first as Map<String, dynamic>);
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  //bool showDonationSection = false;

  @override
  Widget build(BuildContext context) {
    bool showButtons = widget.userData['foundation_id'] ==
        '0'; //TODO::LUIGUI::EJEMPLO DE CONSUMO DE DATOS:: AQUI ESTOY ACCEDIENDO A 'foundation_id'

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
              'assets/images/logo_petcare_blanco.png',
              width: 21,
              height: 21,
            ),

            Expanded(
                child: Text(
              widget.userData['user']['nombre'],
              style: PetCareThemes.buttonTextStyle,
            )),
            // TODO: AQUÍ VA LA IMAGEN DE USUARIO
            GestureDetector(
              onTap: () {
                if (widget.userData['foundation_id'] == '0') {
                  Navigator.of(context).pushNamed(
                    AppRoutes.userProfile,
                    arguments: {'userData': widget.userData},
                  );
                } else {
                  Navigator.of(context).pushNamed(
                    AppRoutes.ngoProfile,
                    arguments: {
                      'userData': widget.userData,
                      'foundationIdClick': widget.userData['foundation_id']
                    },
                  );
                }
                // Coloca aquí la lógica que deseas ejecutar al hacer clic en el botón
              },
              child: Image.asset(
                widget.userData['user']['imagen'],
                width: 21,
                height: 21,
              ),
            )
          ],
        ), // Widget del título del AppBar
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
                // Elementos en fila: icono de perfil y título
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.ngoProfile,
                          arguments: {
                            'userData': widget.userData,
                            'foundationIdClick': items[index].idfoundation
                          },
                        );
                      },
                      child: Image.asset(
                        items[index].profileIcon, // Icono de perfil
                        width: 38,
                        height: 38,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ), // Espacio entre el icono y el texto
                    Text(
                      items[index].title,
                      style: PetCareThemes.nameProfileTextStyle,
                    ), // Título del elemento // Título del elemento
                  ],
                ),
                const SizedBox(
                    height: 8), // Espacio entre el título y la imagen
                // Imagen principal
                Image.asset(
                  items[index].photo, // Ruta de la imagen
                  width: double.infinity, // Ancho completo
                  height: 500, // Altura fija
                  fit: BoxFit.cover, // Ajuste de la imagen
                ),
                const SizedBox(
                    height: 8), // Espacio entre la imagen y la descripción
                //======================================================botones
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
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             BuyMe(photoPet: items[index].photo)));
                              Navigator.of(context).pushNamed(
                                AppRoutes.buyMe,
                                arguments: {
                                  'userData': widget.userData,
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
                      //otro boton
                      const SizedBox(width: 4),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: PetCareColors
                              .brandPrimaryColor, // Color de fondo del botón
                        ),
                        child: GestureDetector(
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AdoptionRequest(
                                      itemID: items[index].idPet),
                                ),
                              );
                              // Acción al presionar el botón
                            },
                            icon: Image.asset(
                                'assets/images/icon_adoption_home.png',
                                width: 30,
                                height: 30),
                          ),
                        ),
                      ),
                      //otro boton
                      const SizedBox(width: 4),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: PetCareColors
                              .brandPrimaryColor, // Color de fondo del botón
                        ),
                        child: GestureDetector(
                          child: IconButton(
                            onPressed: () {
                              // Acción al presionar el botón
                            },
                            icon: Image.asset(
                                'assets/images/icon_share_home.png',
                                width: 30,
                                height: 30),
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
                            color: PetCareColors
                                .brandPrimaryColor, // Color de fondo del botón
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
                    ), // D
                  ],
                ),
                // Utilizando el widget ExpandableTextWidget
              ],
            ),
          );
        },
      ),
    );
  }
}
