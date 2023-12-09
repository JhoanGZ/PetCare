import 'package:flutter/material.dart';
import 'package:petcare_app/design/colors.dart';

class DropListWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const DropListWidget({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: DropdownButtonFormField<String>(
        value: controller.text.isNotEmpty ? controller.text : null,
        onChanged: (value) {
          controller.text = value!;
        },
        items: const [
          DropdownMenuItem<String>(
            value: '0',
            child: Text('Macho'),
          ),
          DropdownMenuItem<String>(
            value: '1',
            child: Text('Hembra'),
          ),
        ],
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
                color: PetCareColors
                    .brandSecondaryColor), // Cambio en el color del borde cuando no está enfocado
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
                color: PetCareColors
                    .brandPrimaryColor), // Color del borde al estar enfocado
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 16.0,
          ), 
          hintText: 'Elija sexo', 
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, seleccione una opción.';
          }
          return null;
        },
      ),
    );
  }
}
