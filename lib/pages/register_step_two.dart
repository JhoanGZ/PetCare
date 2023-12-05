import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/models/storage_transfer.dart';
import 'package:petcare_app/pages/register_step_three.dart';

class RegisterStepTwo extends StatefulWidget {
  final DataRegistrationTransfer storageData;

  const RegisterStepTwo({super.key, required this.storageData});

  @override
  
  State<RegisterStepTwo> createState() => _RegisterStepTwoState();
}

class _RegisterStepTwoState extends State<RegisterStepTwo> {
  final _formRegisterStepTwoKey = GlobalKey<FormState>();
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _dateBirthController;
  late bool isMale = false;
  late bool isFemale = false;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
    _dateBirthController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.of(context).pushNamed(AppRoutes.registerStepOne),
        ),
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
                        decoration: PetCareInputStyle(labelText: ' Dirección')
                            .regularInput,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: TextFormField(
                        controller: _dateBirthController,
                        validator: (dateBirth) {
                          if (dateBirth == null || dateBirth.isEmpty) {
                            return 'Fecha de Nacimiento requerida';
                          }
                          return null;
                        },
                        decoration: PetCareInputStyle(
                          labelText: ' Fecha de Nacimiento',
                        ).regularInput,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isMale = !isMale;
                                isFemale = !isMale;
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                const SizedBox(width: 15),
                                Checkbox(
                                  value: isMale,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isMale = value ?? false;
                                      isFemale = !isMale;
                                    });
                                  },
                                  activeColor:
                                      PetCareAnimationColor.customAnimationColor,
                                ),
                                const Text('Masculino',
                                    style: TextStyle(fontSize: 15)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 40),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isFemale = !isFemale;
                                isMale = !isFemale;
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                Checkbox(
                                  value: isFemale,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isFemale = value ?? false;
                                      isMale = !isFemale;
                                    });
                                  },
                                  activeColor:
                                      PetCareAnimationColor.customAnimationColor,
                                ),
                                const Text('Femenino',
                                    style: TextStyle(fontSize: 15)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60, bottom: 26),
              child: ElevatedButton(
                onPressed: () async {
                  widget.storageData.address = _addressController.text;
                  widget.storageData.phone = _phoneController.text;
                  widget.storageData.dateBirth = _dateBirthController.text;
                  widget.storageData.female = isFemale.toString();
                  widget.storageData.male = isMale.toString();
                                  
                  Navigator.push( context, MaterialPageRoute(builder: (context) => RegisterStepThree(storageData: widget.storageData),),
                  );
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
