import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';

class PetCareTitleAppBarUser extends StatelessWidget {
  const PetCareTitleAppBarUser({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/logo_petcare_blanco.png',
          width: 21,
          height: 21,
        ),
        const SizedBox(
          width: 317,
        ),
        // TODO: AQUÍ VA LA IMAGEN DE USUARIO
        GestureDetector(
      onTap: () {
    // Coloca aquí la lógica que deseas ejecutar al hacer clic en el botón
      Navigator.of(context).pushNamed(AppRoutes.userProfile);
      },
        child: Image.asset(
        'assets/images/pic_default_user.png',
        width: 21,
        height: 21,
  ),
)

      ],
    );
  }
}
