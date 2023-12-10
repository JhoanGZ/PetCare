import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/colors.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/models/home_list.dart';
import 'package:petcare_app/pages/adoption_request.dart';
import 'package:petcare_app/widgets/expandable_text.dart';

class Home extends StatefulWidget {
  final dynamic userData;

  const Home({super.key, required this.userData});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic user = widget.userData['user'] ?? 'Usuario no disponible';
    dynamic nombre = widget.userData['nombre'] ?? 'Nombre no disponible';
    dynamic userImage =
        widget.userData['imagen'] ?? 'assets/images/pic_default_user.png';
    print('userData in home_build : $widget.userData');
    print('Nombre: $nombre');
    print('user: $user');

    bool showButtons = widget.userData['foundation_id'] == 0 ? false : true;
    print('aqui se muestra toda la wea ${widget.userData}');
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
                if (user['foundation_id'] != null &&
                    user['foundation_id'] == '0') {
                  Navigator.of(context).pushNamed(
                    AppRoutes.userProfile,
                    arguments: {'userData': widget.userData},
                  );
                } else {
                  Navigator.of(context).pushNamed(
                    AppRoutes.ngoProfile,
                    arguments: {
                      'userData': widget.userData,
                      'foundationIdClick': user['foundation_id']
                    },
                  );
                }
              },
              child: Image.asset(
                widget.userData['user']['imagen'],
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
                            'userData': widget.userData,
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
