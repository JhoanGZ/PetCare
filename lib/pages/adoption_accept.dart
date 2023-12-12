import 'package:flutter/material.dart';
import 'package:petcare_app/design/themes.dart';

class AdoptionAccept extends StatefulWidget {
  final dynamic userData;
  final int foundationIdClick;
  final List<dynamic> petData;
  const AdoptionAccept(
      {super.key,
      this.userData,
      required this.foundationIdClick,
      required this.petData});

  @override
  State<AdoptionAccept> createState() => _AdoptionAcceptState();
}

class _AdoptionAcceptState extends State<AdoptionAccept> {



  @override
  Widget build(BuildContext context) {
    print('esto es userdata ${widget.userData}');
    print('esto es foundationidClick ${widget.foundationIdClick}');
    print('esto es petData ${widget.petData}');
    final Map<String, dynamic> mapjason = widget.petData[1];
    print('este es el mapjson $mapjason');
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
            const Center(
              child: Row(
                children: [
                  
                ],
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            Image.asset(
              'assets/images/perro_adorno.png',
              width: 200,
              height: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
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
            shape: RoundedRectangleBorder(
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Aceptar'),
        ),
      ],
      )
          ],
        ),
      ),
    );
  }
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
                //aqui se actualizan los datoooooooooooooooos
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

