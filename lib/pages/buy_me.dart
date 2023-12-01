import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petcare_app/design/themes.dart';

class BuyMe extends StatefulWidget {
  final String photoPet;

  const BuyMe({super.key, required this.photoPet});

  @override
  State<BuyMe> createState() => _BuyMeState();
}

class _BuyMeState extends State<BuyMe> {
  final _formBuyMeKey = GlobalKey<FormState>();

  late String donationAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 67, 30, 0),
          child: Column(children: <Widget>[
            Image.asset(
              widget.photoPet,
              width: 200, // Ancho deseado
              height: 200, // Alto deseado
            ),
            Container(
              margin: const EdgeInsets.only(top: 37, bottom: 45.82),
              child: const Text(
                'PetCare es financiada de aportes voluntarios y estatales para lograr dar hogar a mascotas en situación de rescate.',
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
                            amount; //luigui esta variable contiene el monto
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
                            print('todo bien');
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
