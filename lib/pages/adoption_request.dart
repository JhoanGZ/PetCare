import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/themes.dart';

class AdoptionRequest extends StatefulWidget {
  final String itemID;
  final dynamic userData;

  const AdoptionRequest({super.key, required this.itemID, this.userData});

  @override
  State<AdoptionRequest> createState() => _AdoptionRequestState();
}

class _AdoptionRequestState extends State<AdoptionRequest> {
  late TextEditingController _nameController;
  late final String? nameDocument;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _nameController.text = widget.itemID; //texto del contenedor
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Proceso de Adopción', style: PetCareThemes.statementItalicTextStyle,),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
          child: Column(
            children: [
              //crear un container donde se muestre en pantalla la foto de la mascota
              const Row(
                children: [
                  Text('Adoptame', style: PetCareThemes.titleTextStyle),
                  SizedBox(
                    width: 100,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
                Container(
                margin: const EdgeInsets.only(top: 30, bottom: 30),
                child: Image.asset(
                  'assets/images/Bruno.jpg',
                  width: 200, // Ancho deseado
                  height: 200, // Alto deseado
                ),
              ),
              Text(
                '${widget.itemID} está muy feliz por tu interes. \nTener la posibilidad de encontrar un hogar es grandioso',
                style: PetCareThemes.statementTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 26),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.adoptionConfirm);
                  },
                  style: PetCareButtonStyles.elevatedButtonStyle,
                  child: const Text('Solicitar Adopción'),
                ),
              ),
            ],
          ),
      )
    );
  }
}
