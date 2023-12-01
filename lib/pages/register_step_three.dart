import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/models/storage_transfer.dart';

class RegisterStepThree extends StatefulWidget {
  final DataRegistrationTransfer storageData;
  const RegisterStepThree({super.key, required this.storageData});

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
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.registerStepTwo)),
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
                        validator: (address) {
                          if (address == null || address.isEmpty) {
                            return 'Repetición de Contraseña requerida';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration:
                            PetCareInputStyle(labelText: ' Repetir Contraseña')
                                .regularInput,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: CheckboxListTile(
                            title: const Text(
                                ''), //TODO: ::FR&JG:: Ordenar los styles de estos checkboxes, no pude usar el widget original.
                            value: _termAcceptanceController.text.toLowerCase() == 'true',
                            onChanged: (bool? value) {
                              setState(() {
                                _termAcceptanceController.text = value.toString();
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(AppRoutes.terms);
                          },
                          child: const Text(
                            'los términos y condiciones',
                            style: PetCareThemes.linkTextStyleBold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 26),
              child: ElevatedButton(
                onPressed: () async {
                  widget.storageData.password = _passwordController.text;
                  widget.storageData.passwordCheck = _passwordCheckController.text;
                  widget.storageData.termAcceptance = _termAcceptanceController.text;
                
                  //TODO: ::JG:: Trabajado en ello
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
