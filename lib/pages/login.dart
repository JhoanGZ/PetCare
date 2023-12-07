import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/services/authentication_service.dart';
import 'package:petcare_app/widgets/checkbox.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formLoginKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late String userName;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // crea el esqueleto de la pantalla
      body: SingleChildScrollView(
        child: Center(
          //centra el contenido
          child: Padding(
            //damos margenes
            padding: const EdgeInsets.fromLTRB(
                33, 49, 34, 0), //especificamos los margenes, estos
            //deben ser sumados a margenes especificos mas abajo
            child: Column(
              // columna para distribuir elementos verticalmente
              children: <Widget>[
                // se utiliza la etiqueta widget para crear una lista de widgets

                // titulo
                const Text('Bienvenido', style: PetCareThemes.titleTextStyle),

                //Enunciado

                Container(
                  margin: const EdgeInsets.only(top: 37, bottom: 45.82),
                  child: const Text(
                    'PetCare es financiada de aportes voluntarios y estatales para lograr dar hogar a mascotas en situación de rescate.',
                    textAlign: TextAlign.center,
                    style: PetCareThemes.statementTextStyle,
                  ),

                  //Formularioo=============================================
                ),

                Form(
                  key: _formLoginKey,
                  child: Column(
                    children: [
                      //Input Correo electronico
                      Container(
                        margin: const EdgeInsets.only(bottom: 0),
                        child: TextFormField(
                          controller: _emailController,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Campo requerido';
                            }
                            userName = email;
                            return null;
                          },
                          decoration: PetCareInputStyle(
                                  labelText: ' Correo Electronico')
                              .regularInput,
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 14.82, bottom: 30.63),
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Contraseña requerida';
                            }

                            return null;
                          },
                          obscureText: true, //esto hace que no se vea el texto
                          decoration:
                              PetCareInputStyle(labelText: ' Contraseña')
                                  .regularInput,
                        ),
                      ),
                    ],
                  ),
                ),
                //Input Contraseña

                //enunciado olvide la contraseña

                Center(
                  child: Container(
                    margin: const EdgeInsets.only(left: 34),
                    child: Row(
                      children: <Widget>[
                        const Text(
                          '¿Olvidaste la contraseña? ',
                          style: PetCareThemes.statementTextStyle,
                        ),

                        //Text buton para recuperar contraseña

                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.retrievePass);
                            //logica del text buton Logic:
                          },
                          child: const Text(
                            'Recuperar',
                            style: PetCareThemes.linkTextStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                //Check box Recordarme

                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .start, //este parametro lo alinea a la izquierda
                  children: <Widget>[
                    PetCareCheckBox(
                      initialValue:
                          true, // Establecer el valor inicial si es necesario
                      labelText:
                          'Recordarme', // Texto que se adjunta al checkbox
                      onChanged: (value) {
                        // Hacer algo cuando el valor del checkbox cambie :Logic
                      },
                    )
                  ],
                ),

                //Boton entrar
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 26),
                  child: ElevatedButton(
                    onPressed: () async {
                      await authenticationLogin(
                        // TODO::LUIGUI::29-11-23:: Dentro de esta función está la navegación
                        _formLoginKey,
                        _emailController,
                        _passwordController,
                        context,
                      );
                    },
                    style: PetCareButtonStyles.elevatedButtonStyle,
                    child: const Text('Entrar'),
                  ),
                ),

                //linea horizontal 1

                Row(
                  children: [
                    Container(
                      // ese container actua como una linea simple sobre la app
                      width: 138, // Define el ancho de la línea
                      height: 1, // Grosor de la línea
                      color: Colors.black, // Color de la línea
                    ),

                    // texto O

                    Container(
                      margin: const EdgeInsets.only(left: 11, right: 11),
                      child: const Text(
                        'O',
                        style: PetCareThemes.statementTextStyle,
                      ),
                    ),

                    //linea horizontal

                    Container(
                      width: 138, // Define el ancho de la línea
                      height: 1, // Grosor de la línea
                      color: Colors.black, // Color de la línea
                    )
                  ],
                ),

                //caja vacia invisible

                Row(
                  children: [
                    const SizedBox(
                      width: 60, // Ancho deseado
                      height: 50, // Alto deseado
                    ),

                    //imagen logo petcare

                    Image.asset(
                      'assets/images/logo_petcare.png',
                      width: 38, // Ancho deseado
                      height: 45, // Alto deseado
                    ),

                    //texto apoyanos

                    const Text('¡Apoyanos!',
                        style: PetCareThemes.statementTextStyle),

                    //Boton toca aqui

                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.buyMe);
                        //logica del text buton Toca aquí Logic:
                      },
                      child: const Text(
                        'Toca aquí',
                        style: PetCareThemes.linkTextStyle,
                      ),
                    ),
                  ],
                ),

                //caja invisible

                Row(
                  children: [
                    const SizedBox(
                      width: 13, // Ancho deseado
                      height: 45, // Alto deseado
                    ),

                    //texto no estas registrado?

                    const Text('¿No estás registrado?',
                        style: PetCareThemes.statementTextStyle),

                    //boton registrarse

                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.registerStepOne);
                        //logica del text buton Registrarse Logic:
                      },
                      child: const Text(
                        ' Registrarse ahora',
                        style: PetCareThemes.linkTextStyle,
                      ),
                    ),
                  ],
                ),

                //linea horizontal

                Container(
                  // ese container actua como una linea simple sobre la app
                  width: 326, // Define el ancho de la línea
                  height: 1, // Grosor de la línea
                  color: Colors.black, // Color de la línea
                ),

                //texto Eres una ong protectora?

                Row(
                  children: [
                    const Text('¿Eres una ONG protectora?',
                        style: PetCareThemes.statementTextStyle),

                    //boton contactanos

                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.home, arguments: {
                          'userName': 'Fundacion Generica',
                          'userToken': 'Token de usuario',
                          'foundationId': '1',
                        }); //TODO: SE CAMBIO ESTO PARA FINES DESARROLLATIVOS
                        //logica del text buton contactanos Logic:
                      },
                      child: const Text(
                        'Contáctanos',
                        style: PetCareThemes.linkTextStyle,
                      ),
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
