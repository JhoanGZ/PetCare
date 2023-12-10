import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/models/register_data_transfer.dart';
import 'package:petcare_app/services/user_registration_service.dart';
import 'package:petcare_app/utils/validators.dart';

class RegisterStepThree extends StatefulWidget {
  const RegisterStepThree({super.key, required this.storageData});
  final DataRegistrationTransfer storageData;

  @override
  State<RegisterStepThree> createState() => _RegisterStepThreeState();
}

class _RegisterStepThreeState extends State<RegisterStepThree> {
  final _formRegisterStepThreeKey = GlobalKey<FormState>();
  late TextEditingController _passwordController;
  late TextEditingController _passwordCheckController;
  late TextEditingController _termAcceptanceController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _passwordCheckController = TextEditingController();
    _termAcceptanceController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(AppRoutes.registerStepTwo)),
      ),
      //TODO: Adjuntar gatito en el borde inferior
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(33, 200, 34, 0),
              child: Form(
                key: _formRegisterStepThreeKey,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      child: TextFormField(
                        controller: _passwordController,
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'Contraseña requerida';
                          }
                          if (!ValidatorPassword.isValidPassword(password)) {
                            return 'La contraseña debe tener al menos 6 caracteres';
                          }
                          return null;
                        },
                        decoration: PetCareInputStyle(labelText: ' Contraseña')
                            .regularInput,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      child: TextFormField(
                        controller: _passwordCheckController,
                        validator: (passwordCheck) {
                          if (passwordCheck == null || passwordCheck.isEmpty) {
                            return 'Repetición de Contraseña requerida'; // TODO: Lógica passwordCheck
                          }
                          if (!ValidatorPassword.isValidPassword(passwordCheck)) {
                            return 'La contraseña debe tener al menos 3 caracteres';
                          }
                          if (_passwordController.text != _passwordCheckController.text) {
                            return 'Ambas contraseñas deben ser iguales';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration:
                            PetCareInputStyle(labelText: ' Repetir Contraseña')
                                .regularInput,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Theme(
                        data: PetCareAnimationColor.customAnimationColorTheme,
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: _termAcceptanceController.text
                                      .toLowerCase() ==
                                  'true',
                              onChanged: (bool? value) {
                                setState(() {
                                  _termAcceptanceController.text =
                                      value.toString();
                                });
                              },
                            ),
                            const SizedBox(
                                width:
                                    8.0), // Ajusta este valor según tu necesidad
                            const Text(
                              'Acepto ',
                              style: TextStyle(fontSize: 15),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.terms);
                              },
                              child: const Text(
                                'los términos y condiciones',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight
                                        .bold), // NOTE: No se puede usar Themes por overflow
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 120, bottom: 26),
              child: ElevatedButton(
                key: const Key('button_register_step_three'),
                onPressed: () async {
                  if (_formRegisterStepThreeKey.currentState!.validate() && _termAcceptanceController.text != '') {
                    widget.storageData.password = _passwordController.text;
                    widget.storageData.passwordCheck = _passwordCheckController.text;
                    widget.storageData.termAcceptance = _termAcceptanceController.text;
                    _formRegisterStepThreeKey.currentState?.save();
                    await registrationService(widget.storageData, context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Todos los datos deben estar llenos y sin avisos de llenado 😺',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                },
                style: PetCareButtonStyles.elevatedButtonStyle,
                child: const Text('Registrarme'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
