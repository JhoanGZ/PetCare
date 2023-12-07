import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/themes.dart';

class AdoptionRequest extends StatefulWidget {
  final String itemID;

  const AdoptionRequest({super.key, required this.itemID});

  @override
  State<AdoptionRequest> createState() => _AdoptionRequestState();
}

class _AdoptionRequestState extends State<AdoptionRequest> {
  late TextEditingController _nameController;
  late TextEditingController _uploadController;
  late final String? nameDocument;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _uploadController = TextEditingController();
    _nameController.text = widget.itemID; //texto del contenedor
    _uploadController.text = 'formulario_de_adopcion.pdf';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.itemID),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
          child: Column(
            children: [
              const Row(
                children: [
                  Text('Adopción', style: PetCareThemes.titleTextStyle),
                  SizedBox(
                    width: 200,
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 14.82, bottom: 30.63),
                child: TextFormField(
                  controller: _nameController,

                  readOnly: true, //esto hace que sea de solo lectura
                  decoration: PetCareInputStyle(labelText: '').regularInput,
                ),
              ),
              Center(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 50,
                    ),
                    Image.asset(
                      'assets/images/icon_pdf.png',
                      width: 30,
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        print('todo bien');
                        //TODO: aqui se debe descargar pdf
                        //logica del text buton Logic:
                      },
                      child: const Text(
                        'Formulario_de_adopción.pdf',
                        style: PetCareThemes.linkTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Por favor, descarga el formulario, llenalo y adjuntalo en la siguiente casilla para enviarlo a la fundación responsable.',
                style: PetCareThemes.statementTextStyle,
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 220,
                    child: TextFormField(
                      controller: _uploadController,
                      textAlign: TextAlign.left,
                      decoration: PetCareInputStyle(labelText: '').regularInput,
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(top: 20, bottom: 20, left: 14),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: PetCareLittleButtonStyles.elevatedButtonStyle,
                      child: const Text('Adjuntar'),
                    ),
                  ),
                ],
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
                  child: const Text('Enviar'),
                ),
              ),
            ],
          ),
        ));
  }
}
