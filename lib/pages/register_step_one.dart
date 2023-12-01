import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/models/storage_transfer.dart';
import 'package:petcare_app/pages/register_step_two.dart';
import 'package:petcare_app/widgets/up_load_image.dart';

class RegisterStepOne extends StatefulWidget {
  const RegisterStepOne({super.key, required this.dataStorage});
  final DataRegistrationTransfer dataStorage;
  @override
  State<RegisterStepOne> createState() => _RegisterStepOneState();
}

class _RegisterStepOneState extends State<RegisterStepOne> {
  final _formRegisterStepOneKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _rutController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;

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
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const SetPhotoScreen())); //NOTE: habilitación de usuario para nueva foto - Metodo
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 1, right: 5),
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            69), // promedio width x height
                        child: Image.asset(
                            'assets/images/pic_default_user.png'), //NOTE: Foto inicial (sin foto)
                      ),
                    ),
                  ),
                ],
              ),
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
                            return 'Rut requerido';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration:
                            PetCareInputStyle(labelText: ' Rut').regularInput,
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
                        obscureText: true,
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
                        obscureText: true,
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
                  DataRegistrationTransfer storageData =
                      DataRegistrationTransfer();
                  storageData.email = _emailController.text;
                  storageData.rut = _rutController.text;
                  storageData.firstName = _firstNameController.text;
                  storageData.lastName = _lastNameController.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RegisterStepTwo(storageData: storageData),
                    ),
                  );
                },
                style: PetCareButtonStyles.elevatedButtonStyle,
                child: const Text('->'),
              ),
            ),
          ], // mark
        ),
      ),
    );
  }
}
