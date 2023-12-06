import 'dart:io';
import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/models/register_data_transfer.dart';
import 'package:petcare_app/pages/register_step_two.dart';
import 'package:petcare_app/utils/validators_register.dart';
import 'package:petcare_app/widgets/up_load_image.dart';

class RegisterStepOne extends StatefulWidget {
  const RegisterStepOne({super.key, required this.storageData});

  final DataRegistrationTransfer storageData;
  @override
  State<RegisterStepOne> createState() => _RegisterStepOneState();
}

class _RegisterStepOneState extends State<RegisterStepOne> {
  final _formRegisterStepOneKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _rutController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  File? _image;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _rutController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.logIn);
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 39,
                  ),
                  child: const Text(
                    'Registrarse',
                    style: PetCareThemes.titleTextStyle,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
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
                  widget.storageData.photo =
                      selectedImage as String; //NOTE: verificar sino .toString(), pero funcional;
                }
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 1, right: 5),
                    child: SizedBox(
                      width: 170,
                      height: 170,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            90), //WARNING: Siempre h+w/2. Sino OverFlow
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.grey.shade200,
                              child: _image != null
                                  ? Image.file(_image!, fit: BoxFit.cover)
                                  : Image.asset(
                                      'assets/images/pic_default_user.png',
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            if (_image != null)
                              CircleAvatar(
                                backgroundImage: FileImage(_image!),
                                radius: 90.0,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(33, 0, 34, 0),
              child: Form(
                key: _formRegisterStepOneKey,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      child: TextFormField(
                        controller: _emailController,
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Correo Electrónico requerido';
                          }
                          if (!ValidatorMailRegister.isValidEmail(email)) {
                            return 'Ingrese un correo valido';
                          }
                          return null;
                        },
                        decoration:
                            PetCareInputStyle(labelText: ' Correo Electrónico')
                                .regularInput,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      child: TextFormField(
                        controller: _rutController,
                        validator: (rut) {
                          if (rut == null || rut.isEmpty) {
                            return 'RUT requerido';
                          }
                          if (!ValidatorsRutRegister.isValidRut(rut)) {
                            return 'Ingrese un RUT válido, con puntos y guión medio';
                          }
                          return null;
                        },
                        decoration: PetCareInputStyle(
                                labelText: ' Rut, con puntos y guión medio')
                            .regularInput,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      child: TextFormField(
                        controller: _firstNameController,
                        validator: (firstName) {
                          if (firstName == null || firstName.isEmpty) {
                            return 'Nombre Requerido';
                          }
                          return null;
                        },
                        decoration: PetCareInputStyle(labelText: ' Nombre')
                            .regularInput,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      child: TextFormField(
                        controller: _lastNameController,
                        validator: (lastName) {
                          if (lastName == null || lastName.isEmpty) {
                            return 'Apellido requerido';
                          }
                          return null;
                        },
                        decoration: PetCareInputStyle(labelText: ' Apellido')
                            .regularInput,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 26),
              child: ElevatedButton(
                onPressed: () async {
                  if (_formRegisterStepOneKey.currentState!.validate()) {
                    widget.storageData.email = _emailController.text;
                    widget.storageData.rut = _rutController.text;
                    widget.storageData.firstName = _firstNameController.text;
                    widget.storageData.lastName = _lastNameController.text;
                    widget.storageData.photo =
                        _image?.path ?? 'assets/images/pic_default_user.png';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RegisterStepTwo(storageData: widget.storageData),
                      ),
                    );
                  } 
                },
                style: PetCareButtonStyles.elevatedButtonStyle,
                child: const Text('->'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
