import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/themes.dart';

class RetrievePass extends StatefulWidget {
  const RetrievePass({super.key});

  @override
  RetrievePassState createState() => RetrievePassState();
}

class RetrievePassState extends State<RetrievePass> {
  final _formRetrievePassKey = GlobalKey<FormState>();
  late List<TextEditingController> controllers;
  late String mail;
  late List<bool> isEnabled;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(5, (_) => TextEditingController());
    isEnabled = List.generate(5, (_) => false);
    isEnabled[0] = true; // Habilita el primer campo de texto por defecto
    focusNodes = List.generate(5, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
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
              child: Column(
                children: [
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
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      5,
                      (index) => SizedBox(
                        width: 50,
                        child: TextFormField(
                          controller: controllers[index],
                          enabled: isEnabled[index], // Controla la habilitación
                          focusNode: focusNodes[index],
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(1),
                          ],
                          onChanged: (value) {
                            var code = controllers[index].text;
                            if (code.isNotEmpty) {
                              if (index < 4) {
                                // Habilita el siguiente campo de texto y mueve el foco
                                setState(() {
                                  isEnabled[index + 1] = true;
                                });
                                FocusScope.of(context)
                                    .requestFocus(focusNodes[index + 1]);
                              }
                            } else {
                              // Si se borra el dígito, deshabilita los campos subsiguientes
                              for (var i = index + 1; i < 5; i++) {
                                setState(() {
                                  isEnabled[i] = false;
                                });
                              }
                            }
                            var recoveryCode = controllers
                                .map((controller) => controller.text.isEmpty
                                    ? ' '
                                    : controller.text)
                                .join();
                            if (recoveryCode.trim().length == 5) {
                              // Realizar acciones con recoveryCode si se ingresaron 5 dígitos
                              // ignore: avoid_print
                              print('Código de recuperación: $recoveryCode');
                              Navigator.of(context).pushNamed(AppRoutes.retrievePassChange);

                              //FIXME: recoveryCode es la variable que otorga el codigo de verificacions
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
                ],
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

                  //FIXME: Aqui se verifica que el formulario este validado 
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
