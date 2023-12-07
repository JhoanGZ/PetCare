import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/themes.dart';

class AdoptionConfirm extends StatelessWidget {
  const AdoptionConfirm({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 30),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo_petcare.png',
                  width: 200, // Ancho deseado
                  height: 200, // Alto deseado
                ),
                const SizedBox(
                  height: 44,
                ),
                const Text(
                  'Solicitud enviada ✅',
                  style: PetCareThemes.nameProfileTextStyle,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Hemos enviado tu solicitud a la organización responsable de tu futura mascota.\nEn un plazo de 24 horas hábiles recibirás más detalles en tu casilla de correo electronico vinculada a tu cuenta para cerrar el proceso de adopción.\nTe agradecemos por ser parte activa de la familia PetCare.',
                  textAlign: TextAlign.center,
                  style: PetCareThemes.statementTextStyle,
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/images/perro_adorno.png',
                  width: 200,
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        AppRoutes.home); //TODO: se debe enviar user, token
                  },
                  style: PetCareButtonStyles.elevatedButtonStyle,
                  child: const Text('Entendido'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
