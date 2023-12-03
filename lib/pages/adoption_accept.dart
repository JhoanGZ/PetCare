import 'package:flutter/material.dart';
import 'package:petcare_app/design/themes.dart';

class AdoptionAccept extends StatefulWidget {
  const AdoptionAccept({super.key});

  @override
  State<AdoptionAccept> createState() => _AdoptionAcceptState();
}

class _AdoptionAcceptState extends State<AdoptionAccept> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();

    _nameController.text = " Francisco Soto: Bruno(123)"; //texto del contenedor
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 30),
        child: Column(
          children: [
            const Center(
              child: Row(
                children: [
                  Text('Adoptante', style: PetCareThemes.titleTextStyle),
                  SizedBox(
                    width: 175,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
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
const SizedBox(height: 200,),
                Image.asset(
                  'assets/images/perro_adorno.png',
                  width: 200,
                  height: 100,
                ),
                const SizedBox(height: 20,),
              const MyButtonsRow(),
          ],
        ),
      ),
    );
  }
}





class MyButtonsRow extends StatelessWidget {
  const MyButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          
          onPressed: () {
            _showConfirmationDialog(context, 'Rechazar');
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            // ignore: deprecated_member_use
            primary: Colors.red,
            shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Radio de los bordes
    ),
          ),
          child: const Text('Rechazar'),
        ),
        ElevatedButton(
          onPressed: () {
            _showConfirmationDialog(context, 'Aceptar');
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            // ignore: deprecated_member_use
            primary: Colors.green,
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
               ),
          ),
          child: const Text('Aceptar'),
        ),
      ],
    );
  }




  void _showConfirmationDialog(BuildContext context, String action) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¿Está seguro de $action?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes realizar la acción correspondiente a 'Aceptar' o 'Rechazar'
                // Puedes agregar lógica adicional según sea necesario
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                // ignore: deprecated_member_use
                primary: action == 'Aceptar' ? Colors.green : Colors.red,
              ),
              child: Text(action),
            ),
          ],
        );
      },
    );
  }
}
