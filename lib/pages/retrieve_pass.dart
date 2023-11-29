import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/themes.dart';

class RetrievePass extends StatefulWidget {
  const RetrievePass({super.key});

  @override
  State<RetrievePass> createState() => _RetrievePassState();
}

class _RetrievePassState extends State<RetrievePass> {
  final _formRetrievePassKey = GlobalKey<FormState>();
  late List<TextEditingController> controllers;
  late String mail;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(5, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: const Text(
                    'Recuperar\nContraseña',
                    style: PetCareThemes.titleTextStyle,
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            Form(
              key: _formRetrievePassKey,
              child: Column(children: [
                TextFormField(
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Campo requerido';
                    }
                    mail = email;
                    return null;
                  },
                  decoration:
                      PetCareInputStyle(labelText: ' Correo Electronico')
                          .regularInput,
                ),
              ]),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                5,
                (index) => SizedBox(
                  width: 50,
                  child: TextFormField(
                    controller: controllers[index],
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onChanged: (value) {
                      var recoveryCode = '';
                      for (var i = 0; i < 5; i++) {
                        var text = controllers[i].text;
                        recoveryCode += text.isEmpty ? ' ' : text;
                      }

                      if (recoveryCode.trim().length == 5) {
                        // Realiza alguna acción con recoveryCode, por ejemplo:
                        // ignore: avoid_print
                        print('Código de recuperación: $recoveryCode');
                        
                        //TODO: Aqui hay que validar que el codigo sea el mismo que se envio por correo
                        Navigator.of(context).pushNamed(AppRoutes.registerStepTwo);
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 28),
              child: const Text(
                'Se enviará un código de verificación a tu casilla de correo electrónico',
                style: PetCareThemes.statementTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
  onPressed: () {
    if (_formRetrievePassKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Código Enviado ✅'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cerrar'),
              ),
            ],
          );
        },
      );
    }
  },
  style: PetCareButtonStyles.elevatedButtonStyle,
  child: const Text('Enviar'),
)
          ],
        ),
      ),
    );
  }
}
