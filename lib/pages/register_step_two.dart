import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/services/registration_service.dart';


class RegisterStepTwo extends StatefulWidget {
  const RegisterStepTwo({super.key});

  @override
  State<RegisterStepTwo> createState() => _RegisterStepTwoState();
}

class _RegisterStepTwoState extends State<RegisterStepTwo> {
  final _formRegisterStepTwoKey = GlobalKey<FormState>();
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _dateBirthController;
  late TextEditingController _maleController;
  late TextEditingController _femaleController;
  late bool isMale = false;
  late bool isFemale = false;


  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
    _dateBirthController = TextEditingController();
    _maleController = TextEditingController();
    _femaleController = TextEditingController();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.registerStepOne)),
      ),
        //TODO: Montar imagen Ruta => Image.asset('assets/images/dog_corner_register',),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(33, 200, 34, 0),
              child: Form(
                key: _formRegisterStepTwoKey,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      child: TextFormField(
                        controller: _phoneController,
                        validator: (phone) {
                          if (phone == null || phone.isEmpty) {
                            return 'Celular requerido';
                          }
                          return null;
                        },
                        decoration: PetCareInputStyle(labelText: ' Celular')
                            .regularInput,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      child: TextFormField(
                        controller: _addressController,
                        validator: (address) {
                          if (address == null || address.isEmpty) {
                            return 'Dirección requerida';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: PetCareInputStyle(labelText: ' Dirección')
                            .regularInput,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      child: TextFormField(
                        controller: _dateBirthController,
                        validator: (dateBirth) {
                          if (dateBirth == null || dateBirth.isEmpty) {
                            return 'Fecha de Nacimiento requerida';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration:
                            PetCareInputStyle(labelText: ' Fecha de Nacimiento')
                                .regularInput,
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: <Widget>[
                    //     CheckboxListTile(
                    //       title: const Text('Masculino'),
                    //       value: _maleController.text == 'true',
                    //       onChanged: (bool? value) {
                    //         setState(() {
                    //           if( value != null){
                    //           _maleController.text = value.toString();
                    //           _femaleController.text = (!value).toString();
                    //           }
                    //         });
                    //       },
                    //       controlAffinity: ListTileControlAffinity.leading,
                    //     ),
                    //     CheckboxListTile(
                    //       title: const Text('Femenino'), //TODO: ::FR&JG:: Ordenar los styles de estos checkboxes, no pude usar el widget original.
                    //       value: _femaleController.text == 'true',
                    //       onChanged: (bool? value) {
                    //         setState(() {
                    //           if(value != null){
                    //             _femaleController.text = value.toString();
                    //             _maleController.text = (!value).toString();
                    //           }                              
                    //         });
                    //       },
                    //       controlAffinity: ListTileControlAffinity.leading,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 26),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pushNamed(AppRoutes.registerStepThree);
                  // await registrationService(
                  //   _formRegisterStepTwoKey,
                  //   _phoneController,
                  //   _addressController,
                  //   _dateBirthController,
                  //   _maleController,
                  //   _femaleController,
                  //   context,
                  // );
                },
                style: PetCareButtonStyles.elevatedButtonStyle,
                child: const Text('->'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
