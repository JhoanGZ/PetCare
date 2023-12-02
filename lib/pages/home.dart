import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/colors.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/models/home_list.dart'; // Importa la lista items
import 'package:petcare_app/pages/adoption_request.dart';
<<<<<<< HEAD
=======
import 'package:petcare_app/pages/buy_me.dart';
import 'package:petcare_app/widgets/app_bar_home.dart';
>>>>>>> 587db21956262285051e78765fa8a1e14f0452ef
import 'package:petcare_app/widgets/expandable_text.dart';


class Home extends StatefulWidget {
  final String userName;
  final String userToken;

  const Home({super.key, required this.userName, required this.userToken});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
<<<<<<< HEAD
  bool showDonationSection = false;
=======
  //bool showDonationSection = false;
>>>>>>> 587db21956262285051e78765fa8a1e14f0452ef

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: const PetCareTitleAppBarUser(), // Widget del título del AppBar
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
<<<<<<< HEAD
                    Image.asset(
                      items[index].profileIcon, // Icono de perfil
                      width: 38,
                      height: 38,
=======
                    GestureDetector(

                      onTap: (){
                        Navigator.of(context).pushNamed(AppRoutes.ngoProfile);
                      },
                      child: Image.asset(
                        items[index].profileIcon, // Icono de perfil
                        width: 38,
                        height: 38,
                      ),
>>>>>>> 587db21956262285051e78765fa8a1e14f0452ef
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
<<<<<<< HEAD
                    onTap: () {
                      setState(() {
                        showDonationSection = !showDonationSection;
                      });
                    },
                    child: IconButton(
                      onPressed: () {},
=======
                    child: IconButton(
                      onPressed: () {
                  
           Navigator.push(context,MaterialPageRoute(builder: (context) => BuyMe(photoPet: items[index].photo)));
                      },
>>>>>>> 587db21956262285051e78765fa8a1e14f0452ef
                      icon: Image.asset(
                        'assets/images/icon_donation_home.png',
                        width: 30,
                        height: 30,),
                        ),
<<<<<<< HEAD
                      ),
=======
                  ),
>>>>>>> 587db21956262285051e78765fa8a1e14f0452ef
                    ),
                    //otro boton
                     const SizedBox(
                        width:
                            4),
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
                        
<<<<<<< HEAD
                            Navigator.push(context,MaterialPageRoute(
                                builder: (context) => AdoptionRequest(itemID: items[index].id),
=======
                            Navigator.push(context,MaterialPageRoute(builder: (context) => AdoptionRequest(itemID: items[index].id),
>>>>>>> 587db21956262285051e78765fa8a1e14f0452ef
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
                        const SizedBox(
                        width:
                            4),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: PetCareColors
                            .brandPrimaryColor, // Color de fondo del botón
                      ),
                      child: 
                      GestureDetector(
                        child: IconButton(
                          onPressed: () {
                            // Acción al presionar el botón
                             
                          },
                          icon: Image.asset('assets/images/icon_share_home.png',
                              width: 30, height: 30),
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
                    ExpandText(text: items[index].description, maxLines: 2,),// Descripción del elemento
              ],
            ),
          );
        },
      ),
    );
  }
}
