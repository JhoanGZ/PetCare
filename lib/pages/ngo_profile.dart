import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/colors.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/widgets/expandable_text.dart';

class NgoProfile extends StatefulWidget {
  final dynamic userData;
  final int foundationIdClick;
  final List<dynamic> petData;
  const NgoProfile(
      {super.key,
      required this.userData,
      required this.foundationIdClick,
      required this.petData});

  @override
  NgoProfileState createState() => NgoProfileState();
}

class NgoProfileState extends State<NgoProfile> {
  late TextEditingController _searchController;
  List<dynamic> filteredPets = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    filterPetsByFoundation();
    _searchController.addListener(onSearchChanged);
  }

  void filterPetsByFoundation() {
    setState(() {
      filteredPets = widget.petData
          .where((pet) => pet['foundation']['id'] == widget.foundationIdClick)
          .toList();
    });
  }

  void onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredPets = widget.petData
          .where((pet) =>
              pet['nombre'].toLowerCase().contains(query) &&
              pet['foundation']['id'] == widget.foundationIdClick)
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('estos son los datos de petData en ngoProfile ${widget.petData}');
    dynamic foundFoundation;
    for (var pet in widget.petData) {
      // Verifica si el valor asociado a la clave 'foundation' es un Map y tiene el id 2
      if (pet['foundation'] is Map &&
          pet['foundation']['id'] == widget.foundationIdClick) {
        foundFoundation = pet['foundation'];
        break; // Sale del bucle si encuentra la fundación
      }
    }
    print('fundacion encontrada: $foundFoundation');
    bool showButtons = widget.userData['user']['foundation']['id'] != null &&
        widget.userData['user']['foundation']['id'] == widget.foundationIdClick;
    print('petData en ngoProfile: ${widget.petData}');
    final String description = foundFoundation['descripcion'];
    final int maxLines = description.length ~/
        2; //NOTE::FR:: Se cambio de (description.length / 2).toInt();
    final int post = filteredPets.length;
    print('esto es filterdPets $filteredPets');
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: Row(
          children: [
            Expanded(
                child: Text(
              widget.userData['user']['nombre'],
              style: PetCareThemes.buttonTextStyle,
            )),
            Image.asset(
              'assets/images/logo_petcare_blanco.png',
              width: 21,
              height: 21,
            ),
          ],
        ), // Widget del título del AppBar
        backgroundColor: PetCareColors.brandPrimaryColor,
        toolbarHeight: 28,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(
              left: 39,
              bottom: 18,
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 23,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  foundFoundation['imagen'],
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  child: Text(
                foundFoundation['nombre'],
                style: PetCareThemes.nameProfileTextStyle,
                textAlign: TextAlign.center,
              )),
              if (showButtons)
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: PetCareColors.brandPrimaryColor,
                  ),
                  child: IconButton(
                    onPressed: () {
                      // Navigator.of(context).pushNamed(AppRoutes.adoptionAccept);
                      Navigator.of(context)
                          .pushNamed(AppRoutes.adoptionAccept, arguments: {
                        'userData': widget.userData,
                        'foundationIdClick': widget.foundationIdClick,
                        'petData': widget.petData
                      });
                    },
                    icon: Image.asset(
                      'assets/images/icon_notification.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
            ],
          ),
          Row(children: [
            Container(
                margin: const EdgeInsets.only(left: 46, right: 100, top: 20),
                child: Text(
                  '$post',
                  style: PetCareThemes.nameProfileTextStyle,
                )),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  '${foundFoundation['cantAdopciones']}',
                  style: PetCareThemes.nameProfileTextStyle,
                )),
          ]),
          Row(children: [
            Container(
                margin: const EdgeInsets.only(left: 12, right: 30, bottom: 20),
                child: const Text(
                  'Publicaciones',
                  style: PetCareThemes.statementTextStyle,
                )),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: const Text(
                  'adopciones',
                  style: PetCareThemes.statementTextStyle,
                )),
          ]),

          // Utilizando el widget ExpandableTextWidget
          Container(
              margin: const EdgeInsets.only(right: 100, left: 20, bottom: 20),
              child: ExpandText(
                text: foundFoundation['descripcion'],
                maxLines: (maxLines),
              )),

          Row(
            children: [
              if (showButtons)
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20, left: 14),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).pushNamed(
                      // AppRoutes.petProfile,
                      // arguments: {
                      //   'foundationId': widget.userData,
                      // },
                      // );
                      Navigator.of(context).pushNamed(
                        AppRoutes.petProfile,
                        arguments: {
                          'userData': widget.userData,
                          'foundationIdClick': widget.foundationIdClick,
                          'petData': widget.petData
                        },
                      );
                    },
                    style: PetCareLittleButtonStyles.elevatedButtonStyle,
                    child: const Text('Agregar nuevo'),
                  ),
                ),
              const SizedBox(
                width: 34,
              ),
              if (showButtons)
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextFormField(
                    controller: _searchController,
                    textAlign: TextAlign.right,
                    decoration:
                        PetCareInputStyle(labelText: ' Buscar').regularInput,
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
              ),
              itemCount: filteredPets.length,
              itemBuilder: (context, index) {
                final pet = filteredPets[index];
                return GestureDetector(
                  onTap: () {
                    // Acción cuando se toca un elemento
                  },
                  child: GridTile(
                    footer: GridTileBar(
                      backgroundColor: Colors.black45,
                      title: Text(pet['nombre']),
                    ),
                    child: Image.asset(
                      pet['imagen'],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
