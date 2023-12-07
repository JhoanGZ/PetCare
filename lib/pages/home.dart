import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/colors.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/models/home_list.dart'; // Importa la lista items
import 'package:petcare_app/pages/adoption_request.dart';
import 'package:petcare_app/pages/buy_me.dart';
import 'package:petcare_app/widgets/expandable_text.dart';

class Home extends StatefulWidget {
  //TODO::SE SUPONE ESTO SE RECIBE DE DB, ACA ESTÁ HARDCODE PARA TRABAJAR OFFLINE.
  Map<String, dynamic> userData = {
    "user": {
      "id": 2,
      "rut": "261740002",
      "email": "luivin@gmail.com",
      "nombre": "Luigui",
      "apellido": "Vinci",
      "fnac": "1997-01-01",
      "direccion": "Paradisi",
      "sexo": 0,
      "celular": "1234567",
      "imagen": "",
      "codigoVerificacion": "",
      "aceptaTerminosDeUso": "1",
      "usuarioActivo": 1,
      "email_verified_at": null,
      "created_at": "2023-12-05T19:16:26.000000Z",
      "updated_at": "2023-12-06T19:21:28.000000Z",
      "foundation": null
    },
    "foundation_id": "0",
    "auth": true
  };

  Home({
    super.key,
    required this.userData,
  });

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
              widget.userData as String,
              style: PetCareThemes.buttonTextStyle,
            )),
            // TODO: AQUÍ VA LA IMAGEN DE USUARIO
            GestureDetector(
              onTap: () {
                if (widget.userData['foundation_id'] == '0') {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.userProfile, arguments: {
                    'userName': widget.userData['user']['name'],
                    'foundationId': widget.userData['foundation_id'],
                  });
                } else {
                  Navigator.of(context).pushNamed(
                    AppRoutes.ngoProfile,
                    arguments: {
                      'foundationId': widget.userData['foundation_id'],
                      'userName': widget.userData['user']['name'],
                      'foundationIdClick': widget.userData['foundation_id'],
                    },
                  );
                }
                // Coloca aquí la lógica que deseas ejecutar al hacer clic en el botón
              },
              child: Image.asset(
                'assets/images/pic_default_user.png',
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
                        print(widget.userData['user']['name']);
                        print(items[index].title);
                        print(items[index].idfoundation);

                        Navigator.of(context).pushNamed(
                          AppRoutes.ngoProfile,
                          arguments: {
                            'foundationId': widget.userData['foundation_id'],
                            'userName': items[index]
                                .title, // Asegúrate de tener el valor de userName disponible aquí
                            'foundationIdClick': items[index].idfoundation,
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
                        width: 8), // Espacio entre el icono y el texto
                    Text(
                      items[index].title,
                      style: PetCareThemes.nameProfileTextStyle,
                    ), // Título del elemento
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
                                      builder: (context) =>
                                          BuyMe(photoPet: items[index].photo)));
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

                      Container(
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
                    ],
                  ),

                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    items[index].title,
                    style: PetCareThemes.nameProfileTextStyle,
                  ),
                ),
                const SizedBox(width: 8),
                // Utilizando el widget ExpandableTextWidget
                ExpandText(
                  text: items[index].description,
                  maxLines: 2,
                ), // Descripción del elemento
              ],
            ),
          );
        },
      ),
    );
  }
}
