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
      body: 
        const Padding(
          padding: EdgeInsets.only(left: 39),
          child:
          Column(
            children: [
              SizedBox(child: 
                Text('Registrarse', 
                  style: PetCareThemes.titleTextStyle, 
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                width: 135,
                height: 138,
                child: ImageInput(),
                )
            ],
          ),
        ),
    );
  }
}
