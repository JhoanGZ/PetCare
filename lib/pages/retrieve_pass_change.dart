import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/utils/validators.dart';

class RetrievePassChange extends StatefulWidget {
  const RetrievePassChange({super.key});

  @override
  State<RetrievePassChange> createState() => _RetrievePassChangeState();
}

class _RetrievePassChangeState extends State<RetrievePassChange> {
  final _formRetrievePassChangeKey = GlobalKey<FormState>();
  late TextEditingController _passwordController;
  late TextEditingController _repeatPasswordController;
  late String password;
  late String passwordRepeat;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _repeatPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // crea el esqueleto de la pantalla
      body: SingleChildScrollView(
        child: Center(
          //centra el contenido
          child: Padding(
            //damos margenes
            padding: const EdgeInsets.fromLTRB(
                33, 0, 34, 0), //especificamos los margenes, estos
            //deben ser sumados a margenes especificos mas abajo
            child: Column(
              // columna para distribuir elementos verticalmente
              children: <Widget>[
                // se utiliza la etiqueta widget para crear una lista de widgets

                // titulo
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 102),
                      child: const Text(
                        'Cambiar\nContraseña',
                        style: PetCareThemes.titleTextStyle,
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),

                //Formularioo=============================================

                Form(
                  key: _formRetrievePassChangeKey,
                  child: Column(
                    children: [
                      //Input Nueva contraseña
                      Container(
                        margin: const EdgeInsets.only(bottom: 0),
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (firstPassword) {
                            if (firstPassword == null ||
                                firstPassword.isEmpty) {
                              return 'Campo requerido';
                            }
                            if (!ValidatorPassword.isValidPassword(firstPassword)) {
                              return 'La contraseña debe tener al menos 6 carácteres';
                            }
                            password = firstPassword;
                            return null;
                          },
                          obscureText: true,
                          decoration:
                              PetCareInputStyle(labelText: ' Nueva contraseña')
                                  .regularInput,
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 14.82, bottom: 10.63),
                        child: TextFormField(
                          controller: _repeatPasswordController,
                          validator: (passwordTwo) {
                            if (passwordTwo == null || passwordTwo.isEmpty) {
                              return 'Campo requerido';
                            }
                            passwordRepeat = passwordTwo;
                            if (password != passwordRepeat) {
                              return 'La contraseña no coincide';
                            }
                            if (!ValidatorPassword.isValidPassword(passwordTwo)) {
                              return 'La contraseña debe tener al menos 6 carácteres';
                            }
                            return null;
                          },
                          obscureText: true, //esto hace que no se vea el texto
                          decoration: PetCareInputStyle(
                                  labelText: ' Repetir contraseña')
                              .regularInput,
                        ),
                      ),
                    ],
                  ),
                ),
                //Input Contraseña

                //enunciado olvide la contraseña

                Container(
                  margin: const EdgeInsets.only(bottom: 48),
                  child: const Center(
                    child: Text(
                      'La contraseña debe contener almenos\nun número y un caracter especial',
                      style: PetCareThemes.statementTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                //Check box Recordarme

                //Boton entrar
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 26),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formRetrievePassChangeKey.currentState!
                              .validate()) {
                            if (password == passwordRepeat) {
                              Navigator.of(context).pushNamed(AppRoutes.logIn);
                            } else {}
                            // Si la validación es exitosa, el campo de texto está lleno
                            // Realizar acciones correspondientes aquí
                            // Por ejemplo, puedes acceder al valor del campo de texto:
                          }
                        }
                        //async {
                        //   await authenticationRetrivePass(
                        //     // TODO::LUIGUI::29-11-23:: Dentro de esta función está la navegación
                        //     _formRetrievePassChangeKey,
                        //     _passwordController,
                        //     _repeatPasswordController,
                        //     context,
                        //   )
                        //},
                        ,
                        style: PetCareButtonStyles.elevatedButtonStyle,
                        child: const Text('Cambiar'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 136),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Image.asset(
                      'assets/images/michi.png',
                      width: 129, // Ancho deseado
                      height: 69, // Alto deseado
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
