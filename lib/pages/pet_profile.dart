import 'package:flutter/material.dart';
import 'package:petcare_app/design/colors.dart';
import 'package:petcare_app/widgets/app_bar_home.dart';
import 'package:petcare_app/widgets/checkbox.dart';

class PetProfile extends StatefulWidget {
  const PetProfile({super.key});

  @override
  State<PetProfile> createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),
          title: const PetCareTitleAppBarUser(), // Widget del título del AppBar
          backgroundColor: PetCareColors.brandPrimaryColor,
          toolbarHeight: 28,
          centerTitle: true,
      ),
      body: Column(

      children: [
        
        PetCareCheckBox(
          initialValue:
              true, // Establecer el valor inicial si es necesario
          labelText:
              'Publicacion activa', // Texto que se adjunta al checkbox
          onChanged: (value) {
            // Hacer algo cuando el valor del checkbox cambie :Logic
          },
        )],
      )
    );
  }
}
