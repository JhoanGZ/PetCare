import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/colors.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/widgets/up_load_image.dart';


class UserProfile extends StatefulWidget {
  const UserProfile({super.key, required this.foundationId, required this.userName});
  final String foundationId;
  final String userName;
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _formUserProfileKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 250,),
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: PetCareColors.brandPrimaryColor, // Color de fondo del botón
              ),
              child: IconButton(
                onPressed: () {

                  Navigator.of(context).pushNamed(AppRoutes.userSavedPets,
                  arguments: {
                    'foundationId': widget.foundationId,
                    'userName': widget.userName,
                  }
                  );
                  // Acción al presionar el botón
                },
                icon: Image.asset(
                  'assets/images/icon_save_home.png',
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 39,
                  ),
                  child: Text(
                    widget.userName,
                    style: PetCareThemes.titleTextStyle,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SetPhotoScreen(
                      onPhotoSelected: (File? photo) {
                        
                      },
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 1, right: 5),
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            69), // promedio width x height
                        child: Image.asset(
                            'assets/images/pic_default_user.png'), //NOTE: Foto inicial (sin foto)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(33, 0, 34, 0),
              child: Form(
                key: _formUserProfileKey,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      child: TextFormField(
                  
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return 'Campo requerido';
                          }
                          return null;
                        },
                        decoration:
                            PetCareInputStyle(labelText: ' Nombre')
                                .regularInput,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      child: TextFormField(
               
                        validator: (apellido) {
                          if (apellido == null || apellido.isEmpty) {
                            return 'Campo requerido';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration:
                            PetCareInputStyle(labelText: ' Apellido').regularInput,
                      ),

                      
                    ),
                    Container(
              margin: const EdgeInsets.only(top: 20, bottom: 26),
              child: ElevatedButton(
                onPressed: () async {
Navigator.of(context).pushNamed(AppRoutes.retrievePassChange);
                  // await registrationService(
                  //   _formUserProfileKey,
                  //   _nameController,
                  //   _apellidoController,
                  //   _emailController,
                  //   _phoneController,
                  //   context,
                  // );
                  //FIXME: ::JG:: Trabajado en ello
                },
                style: PetCareButtonStyles.elevatedButtonStyle,
                child: const Text('Cambiar contraseña'),
              ),
            ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      child: TextFormField(
         
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Campo requerido';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: PetCareInputStyle(labelText: ' Correo electrónico')
                            .regularInput,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      child: TextFormField(
                 
                        validator: (phone) {
                          if (phone == null || phone.isEmpty) {
                            return 'Campo requerido';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: PetCareInputStyle(labelText: ' Celular')
                            .regularInput,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 26),
              child: ElevatedButton(
                onPressed: () async {

                  if(_formUserProfileKey.currentState!.validate()){
showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Guardado ✅'),
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

                  }
                 
                  // await registrationService(
                  //   _formUserProfileKey,
                  //   _nameController,
                  //   _apellidoController,
                  //   _emailController,
                  //   _phoneController,
                  //   context,
                  // );
                  //FIXME: ::JG:: Trabajado en ello
                },
                style: PetCareButtonStyles.elevatedButtonStyle,
                child: const Text('Guardar Cambios'),
              ),
            ),
          ], // mark
        ),
      ),
    );
  }
}

