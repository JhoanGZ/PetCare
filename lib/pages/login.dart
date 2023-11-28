import 'package:flutter/material.dart';
import 'package:petcare_app/design/themes.dart';
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
    return Scaffold(
      body: Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(33, 49, 34, 0),
        child: Column(
          children: <Widget>[
            const Text('Bienvenido', style: PetCareThemes.titleTextStyle),
            Container(
              margin: const EdgeInsets.only(top: 37, bottom: 59.82),
              child: const Text(
                'PetCare es financiada con aportes voluntarios y estatales para lograr dar hogar a mascotas en situación de rescate.',
                textAlign: TextAlign.center,
                style: PetCareThemes.statementTextStyle,
              ),
            ),
            TextField(
              decoration: PetCareInputStyle(labelText: 'Correo Electronico')
                  .regularInput,
            ),
            Container(
              margin: const EdgeInsets.only(top: 14.82, bottom: 32.63),
                child: TextField(
                  decoration:
                    PetCareInputStyle(labelText: 'Contraseña').regularInput,
                ),
            ),
            const Text('¿Olvidaste la contraseña? Recuperar', style: PetCareThemes.statementTextStyle,)
          ],
          
        ),
      ),
    ));
  }
}
