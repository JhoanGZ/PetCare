import 'package:flutter/material.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/widgets/checkbox.dart';
// class LogInPage extends StatelessWidget {
//   const LogInPage({super.key});
//   @override
//   State<LogInPage> createState() => _LogInPageState();

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

// class _LogInPageState extends State<LogInPage>{
//   @override
//   Widget build(BuildContext context){
//     return const Scaffold(
//       body: Center (
//         child: Column([
//           Container(
//             child: Text
//           )
//         ]
//           ),
//         ),
//     );
//   }
// }
class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(// crea el esqueleto de la pantalla
      body: Center(//centra el contenido
        child: Padding(//damos margenes
          padding: const EdgeInsets.fromLTRB(33, 49, 34, 0),//especificamos los margenes, estos 
          //deben ser sumados a margenes especificos mas abajo
          child: Column(// columna para distribuir elementos verticalmente
            children: <Widget>[// se utiliza la etiqueta widget para crear una lista de widgets
              const Text('Bienvenido', 
              style: PetCareThemes.titleTextStyle),
              Container(
                margin: const EdgeInsets.only(top: 37, bottom: 45.82),
                child: const Text(
                  'PetCare es financiada de aportes voluntarios y estatales para lograr dar hogar a mascotas en situación de rescate.',
                  textAlign: TextAlign.center,
                  style: PetCareThemes.statementTextStyle,
                ),
              ),
              TextField(
                decoration: PetCareInputStyle(
                  labelText: 'Correo Electronico')
                    .regularInput,
              ),
              Container(
                margin: const EdgeInsets.only(top: 14.82, bottom: 32.63),
                child: TextField(
                  decoration: PetCareInputStyle(
                    labelText: 'Contraseña').regularInput,
                ),
              ),

              Center(
                child: Container(
                  margin: const EdgeInsets.only(left: 34, right: 27.4),
                  child:  Row(
                    children:  <Widget>[
                      const Text(
                        '¿Olvidaste la contraseña? ',
                        style: PetCareThemes.statementTextStyle,
                      ),
                      GestureDetector(
                        onTap: () {
                          //aqui va el codigo para redirigir cuando se pulse el texto de Recuperar :Logic
                        },
                        child: const Text('Recuperar', 
                        style: PetCareThemes.linkTextStyle,),
                      )
                      
                    ],
                  ),
                ),
              ),
                            Row(
                mainAxisAlignment: MainAxisAlignment.start,//este parametro lo alinea a la izquierda
                children: <Widget>[
                  PetCareCheckBox(

                initialValue: true, // Establecer el valor inicial si es necesario
                labelText: 'Recordarme', // Texto que se adjunta al checkbox
                onChanged: (value) {
                  // Hacer algo cuando el valor del checkbox cambie :Logic
                },
                  )
                  
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top:20 , bottom: 36),
                child: ElevatedButton(
                  onPressed: () {
                // Acción al presionar el botón
                },
                  style: PetCareButtonStyles.elevatedButtonStyle,
                  child: const Text('Entrar'),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

