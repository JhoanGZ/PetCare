import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/services/donation_pet_service.dart';
import 'package:petcare_app/services/donation_petcare_service.dart';

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
  late String idUser;
  late String idPet;

  @override
  void initState() {
    super.initState();
    // Revisa si la variable está vacía al iniciar la pantalla
    if (widget.photoPet.isEmpty) {
      statement =
          'PetCare se financia mediante contribuciones estatales y voluntarias para ayudar a las mascotas en situación de rescate. ¡Gracias por tu aporte 🐶!';
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
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter
                            .digitsOnly, //NOTE Solo dígitos
                      ],
                      validator: (amount) {
                        if (amount == null || amount.isEmpty) {
                          return 'Ingrese el monto a enviar';
                        }
                        donationAmount = amount;
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration:
                          PetCareInputStyle(labelText: ' Monto').regularInput,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 26),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formBuyMeKey.currentState!.validate()) {
                            if (widget.photoPet.isEmpty) {
                              await sendDonationPetcare(
                                _formBuyMeKey,
                                donationAmount,
                                context,
                              );
                              Future.microtask(() {
                                Navigator.of(context).popAndPushNamed(
                                  AppRoutes.logIn,
                                );
                              });
                            } else {
                              await sendDonationPet(_formBuyMeKey,
                                  donationAmount, idPet, idUser, context);
                              Future.microtask(() {
                                Navigator.of(context).popAndPushNamed(
                                    AppRoutes.home,
                                    arguments: {
                                      'userData': widget.userData,
                                      'foundationIdClick':
                                          widget.userData['foundation_id']
                                    });
                              });
                              // ignore: use_build_context_synchronously
                              Future.microtask(() {
                                  showDialog(
                                  context: context,
                                  builder: (BuildContext context){
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
                              });
                            }
                          }
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
