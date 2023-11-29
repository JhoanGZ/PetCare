import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/widgets/upload_image.dart';

class RegisterStepOne extends StatelessWidget {
  const RegisterStepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.home);
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 39),
        child: Column(
          children: [
            const SizedBox(
              child: Text(
                'Registrarse',
                style: PetCareThemes.titleTextStyle,
                textAlign: TextAlign.right,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SetPhotoScreen()));
              },
              child: SizedBox(
                width: 135,
                height: 138,
                child: Image.asset('assets/images/pic_default_user.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
