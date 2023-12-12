import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/colors.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/services/pet_registration_service.dart';
import 'package:petcare_app/utils/validators.dart';
import 'package:petcare_app/widgets/checkbox.dart';
import 'package:petcare_app/widgets/droplists.dart';
import 'package:petcare_app/widgets/up_load_image.dart';

class PetProfile extends StatefulWidget {
  final dynamic userData;
  final int foundationIdClick;
  final List<dynamic> petData;

  const PetProfile({
    super.key,
    required this.userData,
    required this.foundationIdClick,
    required this.petData,
  });

  @override
  State<PetProfile> createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  final _formPetProfileStateKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _vaccineController;
  late TextEditingController _raceController;
  late TextEditingController _weightController;
  late TextEditingController _chipController;
  late TextEditingController _genderController;
  late TextEditingController _sterilizationController;
  late TextEditingController _ageController;
  late TextEditingController _descriptionController;
  late String userName;
  File? _image;
  late File petPhoto;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _vaccineController = TextEditingController();
    _raceController = TextEditingController();
    _chipController = TextEditingController();
    _weightController = TextEditingController();
    _sterilizationController = TextEditingController();
    _genderController = TextEditingController();
    _ageController = TextEditingController();
    _descriptionController = TextEditingController();
    petPhoto = File('assets/images/avatar_pet_default.png');
  }

  @override
  Widget build(BuildContext context) {
    final String apitoken = widget.userData['user']['api_token'];
    final dynamic estadoMascota = widget.petData['estadoMascota'];

  //   "PetData-":[
  //  {
  //     "id":1,
  //     "imagen":"assets/images/Bruno.jpg",
  //     "vacunas":Vacuna1,
  //     Vacuna2,
  //     "nombre":"Peludito",
  //     "raza":"Labrador",
  //     "peso":15,
  //     "chip":1,
  //     "sexo":1,
  //     "esteril":0,
  //     "edad":2,
  //     "anotaciones":"Juguetón y cariñoso",
  //     "idAdoptante":0,
  //     "idFundacion":1,
  //     "estadoMascota":1,
  //     "created_at":"2023-12-10T20":"30":48.000000Z,
  //     "updated_at":"2023-12-10T20":"30":48.000000Z,
  //     "adoptante":null,
  //     "foundation":{
  //        "id":1,
  //        "idUser":1,
  //        "rut":11-1111111,
  //        "email":fundacion1@example.com,
  //        "nombre":"Fundación Pata Feliz",
  //        "cantPublicActiva":50,
  //        "cantAdopciones":20,
  //        "descripcion":"Somos una fundación dedicada al cuidado y adopción de mascotas.",
  //        "imagen":"assets/images/fundacion perfil.png",
  //        "direccion":"Calle de las Mascotas",
  //        123,
  //        "usuarioActivo":1,
  //        "created_at":"2023-12-10T20":"23":11.000000Z,
  //        "updated_at":"2023-12-10T20":"23":11.000000Z
  //     }
  //  },
  
   {
      // "id":2,
      // "imagen":"assets/images/gatitos luigui.png",
      // "vacunas":Vacuna1,
      // "nombre":"Firulais",
      // "raza":"Bulldog",
      // "peso":20,
      // "chip":1,
      // "sexo":1,
      // "esteril":1,
      // "edad":3,
      // "anotaciones":"Le encanta dormir",
      // "idAdoptante":0,
      // "idFundacion":2,
      // "estadoMascota":1,
      // "created_at":"2023-12-10T20":3

    print('este es el apitoken en pet_profile $apitoken');

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 34, 30),
            child: Column(
              children: [
                PetCareCheckBox(
                  initialValue:
                      true, // Establecer el valor inicial si es necesario
                  labelText:
                      'Publicacion activa', // Texto que se adjunta al checkbox
                  onChanged: (value) {
                    // Hacer algo cuando el valor del checkbox cambie :Logic
                  },
                ),
                GestureDetector(
                  onTap: () async {
                    File? selectedImage = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SetPhotoScreen(
                          onPhotoSelected: (File? photo) {
                            setState(() {
                              _image = photo;
                            });
                          },
                        ),
                      ),
                    );
                    if (selectedImage != null) {
                      petPhoto = selectedImage;
                    }
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 1, right: 5),
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                70), //WARNING: Siempre h+w/4.5. Sino OverFlow
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 150,
                                  height: 150,
                                  color: Colors.grey.shade200,
                                  child: _image != null
                                      ? Image.file(_image!, fit: BoxFit.cover)
                                      : Image.asset(
                                          'assets/images/avatar_pet_default.png',
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formPetProfileStateKey,
                  child: Column(children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 0),
                      child: TextFormField(
                        controller: _nameController,
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return 'Campo requerido';
                          }
                          if (!ValidatorLengthField.isValidFieldLength(name)) {
                            return 'Debe tener al menos 3 carácteres';
                          }
                          return null;
                        },
                        decoration: PetCareInputStyle(labelText: ' Nombre')
                            .regularInput,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 0),
                      child: TextFormField(
                        controller: _vaccineController,
                        validator: (vaccinne) {
                          if (vaccinne == null || vaccinne.isEmpty) {
                            return 'Campo requerido';
                          }
                          return null;
                        },
                        decoration: PetCareInputStyle(labelText: ' Vacunas')
                            .regularInput,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 0),
                      child: TextFormField(
                        controller: _raceController,
                        validator: (race) {
                          if (race == null || race.isEmpty) {
                            return 'Campo requerido';
                          }
                          if (!ValidatorLengthField.isValidFieldLength(race)) {
                            return 'Debe tener al menos 3 carácteres';
                          }
                          return null;
                        },
                        decoration:
                            PetCareInputStyle(labelText: ' Raza').regularInput,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 0),
                      child: TextFormField(
                        controller: _weightController,
                        validator: (weight) {
                          if (weight == null || weight.isEmpty) {
                            return 'Campo requerido';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: PetCareInputStyle(
                                labelText: ' Peso, entregar en (Kgs)')
                            .regularInput,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Theme(
                        data: PetCareAnimationColor.customAnimationColorTheme,
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value:
                                  _chipController.text.toLowerCase() == 'true',
                              onChanged: (bool? value) {
                                setState(() {
                                  _chipController.text = value.toString();
                                });
                              },
                            ),
                            const SizedBox(
                                width:
                                    8.0), // Ajusta este valor según tu necesidad
                            const Text('Chip', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropListWidget(
                      controller: _genderController,
                      labelText: ' Sexo',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Theme(
                        data: PetCareAnimationColor.customAnimationColorTheme,
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value:
                                  _sterilizationController.text.toLowerCase() ==
                                      'true',
                              onChanged: (bool? value) {
                                setState(() {
                                  _sterilizationController.text =
                                      value.toString();
                                });
                                if (value == false) {
                                  _sterilizationController.text = 'false';
                                }
                              },
                            ),
                            const SizedBox(
                                width:
                                    8.0), // Ajusta este valor según tu necesidad
                            const Text('Esterilización',
                                style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 0),
                      child: TextFormField(
                        controller: _ageController,
                        validator: (age) {
                          if (age == null || age.isEmpty) {
                            return 'Campo requerido';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: PetCareInputStyle(
                                labelText: ' Edad, menor a un año, dejar en 0')
                            .regularInput,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 0),
                      child: TextFormField(
                        maxLines: 5, // Número de líneas para el área de texto
                        controller: _descriptionController,
                        validator: (description) {
                          if (description == null || description.isEmpty) {
                            return 'Se debe ingresar una breve descripción';
                          }
                          return null;
                        },
                        decoration: PetCareInputStyle(labelText: ' Descripción')
                            .regularInput,
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formPetProfileStateKey.currentState!.validate()) {
                      await petRegistration(
                        _formPetProfileStateKey,
                        petPhoto,
                        _nameController,
                        _vaccineController,
                        _raceController,
                        _chipController,
                        _weightController,
                        _sterilizationController,
                        _genderController,
                        _ageController,
                        _descriptionController,
                        apitoken,
                        estadoMascota,
                        widget.foundationIdClick,
                        context,
                      );
                      print(
                          'esto es widget.userData[foundation_id] ${widget.userData['foundation_id']}');
                      print('esto es widget.userData ${widget.userData}');

                      Future.microtask(() {
                        Navigator.of(context).pushNamed(
                          AppRoutes.ngoProfile,
                          arguments: {
                            'userData': widget.userData,
                            'foundationIdClick': widget.foundationIdClick,
                            'petData': widget.petData
                          },
                        );
                      });
                      //                     Navigator.of(context).pushNamed(
                      // AppRoutes.ngoProfile,
                      // arguments: {
                      //   'userData': widget.userData,
                      //   'foundationIdClick': widget.userData['user']['foundation']
                      //       ['id'],
                      //   'petData': petData
                      // },
                      // );
                    }
                  },
                  style: PetCareButtonStyles.elevatedButtonStyle,
                  child: const Text('Publicar'),
                ),
              ],
            ),
          ),
        ));
  }
}
