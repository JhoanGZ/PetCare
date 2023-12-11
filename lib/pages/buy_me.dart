import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petcare_app/design/themes.dart';

class BuyMe extends StatefulWidget {
  final dynamic userData;
  final String photoPet;
  final int? idPet;
  const BuyMe(
      {super.key, required this.photoPet, this.userData, this.idPet});

  @override
  State<BuyMe> createState() => _BuyMeState();
}

class _BuyMeState extends State<BuyMe> {
  final _formBuyMeKey = GlobalKey<FormState>();
  late String photoPet;
  late String statement;
  late String donationAmount;

  @override
  void initState() {
    super.initState();
    // Revisa si la variable está vacía al iniciar la pantalla
    if (widget.photoPet.isEmpty) {
      statement =
          'PetCare es financiada de aportes voluntarios y estatales para lograr dar hogar a mascotas en situación de rescate.';
      // Asigna un valor si la variable está vacía
      photoPet = 'assets/images/logo_petcare.png';
    } else {
      photoPet = widget.photoPet;
      statement =
          '🐕 Gracias por ayudar a nuestros animalitos, haremos llegar tu aporte a la mascota que seleccionaste 🐈‍⬛';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 67, 30, 0),
          child: Column(children: <Widget>[
            Text('${widget.idPet ?? 'hola nene'}'),
            Image.asset(
              photoPet,
              width: 200, // Ancho deseado
              height: 200, // Alto deseado
            ),
            Container(
              margin: const EdgeInsets.only(top: 37, bottom: 45.82),
              child: Text(
                statement,
                textAlign: TextAlign.center,
                style: PetCareThemes.statementTextStyle,
              ),
            ),
            Form(
                key: _formBuyMeKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number, // Teclado numérico
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter
                            .digitsOnly, // Solo permite dígitos
                      ],
                      validator: (amount) {
                        if (amount == null || amount.isEmpty) {
                          return 'campo requerido';
                        }
                        donationAmount =
                            amount; //TODO:luigui esta variable contiene el monto
                        //TODO: aqui sale la varibale con el
                        return null;
                      },
                      decoration:
                          PetCareInputStyle(labelText: ' Monto').regularInput,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 26),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formBuyMeKey.currentState!.validate()) {
                            // ignore: avoid_print
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Donación Enviada ✅'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cerrar'),
                                    ),
                                  ],
                                );
                              },
                            );
                            //luego cambiar pushNamed por pushReplacementNamed para evitar volver
                          }
                          //Acción al presionar el botón
                        },
                        style: PetCareButtonStyles.elevatedButtonStyle,
                        child: const Text('Donar'),
                      ),
                    ),
                  ],
                ))
          ]),
        )),
      ),
    );
  }
}
