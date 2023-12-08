import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/colors.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/services/pet_service.dart';
import 'package:petcare_app/widgets/checkbox.dart';
import 'package:petcare_app/widgets/up_load_image.dart';

class PetProfile extends StatefulWidget {
  final dynamic userData;
  const PetProfile({
    super.key,
    required this.userData,
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
  late TextEditingController _genderController;
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
    _weightController = TextEditingController();
    _genderController = TextEditingController();
    _ageController = TextEditingController();
    _descriptionController = TextEditingController();
    petPhoto = File('assets/images/avatar_pet_default.png');
  }

  @override
  Widget build(BuildContext context) {
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
                    // ignore: unused_local_variable
                    File? selectedImage = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SetPhotoScreen(
                          onPhotoSelected: (File? photo) {
                            setState(() {
                              _image = photo;
                              // if (_image != null) {
                              //   petPhoto = _image!;
                              // }
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
                                // if (_image != null)
                                //   CircleAvatar(
                                //     backgroundImage: FileImage(_image!),
                                //     radius: 90.0,
                                //   ),
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
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Campo requerido';
                          }
                          userName = email;
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
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Campo requerido';
                          }
                          userName = email;
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
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Campo requerido';
                          }
                          userName = email;
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
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Campo requerido';
                          }
                          userName = email;
                          return null;
                        },
                        decoration:
                            PetCareInputStyle(labelText: ' Peso').regularInput,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    PetCareCheckBox(
                      initialValue:
                          true, // Establecer el valor inicial si es necesario
                      labelText: 'Chip', // Texto que se adjunta al checkbox
                      onChanged: (value) {
                        // Hacer algo cuando el valor del checkbox cambie :Logic
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 0),
                      child: TextFormField(
                        controller: _genderController,
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Campo requerido';
                          }
                          userName = email;
                          return null;
                        },
                        decoration:
                            PetCareInputStyle(labelText: ' Sexo').regularInput,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    PetCareCheckBox(
                      initialValue:
                          true, // Establecer el valor inicial si es necesario
                      labelText:
                          'Esterilizacion', // Texto que se adjunta al checkbox
                      onChanged: (value) {
                        // Hacer algo cuando el valor del checkbox cambie :Logic
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 0),
                      child: TextFormField(
                        controller: _ageController,
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Campo requerido';
                          }
                          userName = email;
                          return null;
                        },
                        decoration:
                            PetCareInputStyle(labelText: ' Edad').regularInput,
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
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Campo requerido';
                          }
                          userName = email;
                          return null;
                        },
                        decoration: PetCareInputStyle(labelText: ' Decripcion')
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
                        _weightController,
                        _genderController,
                        _ageController,
                        _descriptionController,
                        context,
                      );
                    }
                    // ignore: use_build_context_synchronously
                    Navigator.of(context)
                        .popAndPushNamed(AppRoutes.ngoProfile, arguments: {
                      'userData': widget.userData,
                      'foundationIdClick': widget.userData['foundation_id']
                    });
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
