import 'package:flutter/material.dart';
import 'package:petcare_app/design/themes.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(35, 77, 30, 0),
        child: Column(children: <Widget>[
          Image.asset(
            'assets/images/logo_petcare.png',
            width: 200, // Ancho deseado
            height: 200, // Alto deseado
          ),
          Container(
            margin: const EdgeInsets.only(top: 37, bottom: 45.82),
            child: const Text(
              'En los siguientes datos podrá contactarse con nosotros.\nEsperamos que pronto pueda ser parte de la familia PetCare.',
              textAlign: TextAlign.center,
              style: PetCareThemes.statementTextStyle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 50, // Ancho deseado
                height: 5, // Alto deseado
              ),
              Image.asset(
                'assets/images/icono_mail.png',
                width: 35, // Ancho deseado
                height: 35, // Alto deseado
              ),
              const Text(
                'petcarechile@empresa.cl',
                style: PetCareThemes.statementTextStyle,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 50, // Ancho deseado
                height: 5, // Alto deseado
              ),
              Image.asset(
                'assets/images/icono_mail.png',
                width: 35, // Ancho deseado
                height: 35, // Alto deseado
              ),
              const Text(
                'petcare@empresa.cl',
                style: PetCareThemes.statementTextStyle,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 50, // Ancho deseado
                height: 5, // Alto deseado
              ),
              Image.asset(
                'assets/images/whats_app_icono.png',
                width: 35, // Ancho deseado
                height: 35, // Alto deseado
              ),
              const Text(
                '+56 9 91254789',
                style: PetCareThemes.statementTextStyle,
              )
            ],
          )
        ]),
      )),
    );
  }
}
