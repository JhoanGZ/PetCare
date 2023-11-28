import 'package:flutter/material.dart';
import 'package:petcare_app/design/colors.dart';

class PetCareThemes {//Esta clase nos permite dar estilo a todos los textos de la app
  PetCareThemes._();
  //Estan todos modularizados
  static const TextStyle statementTextStyle = TextStyle(//esta atributo es usado para los enunciados
    fontFamily: 'Inter', //esto se utiliza para recoger los fonts importados
    fontWeight: FontWeight.w200, // esto es el ancho de la linea
    fontSize: 15, //tamaño de la fuente
    color: PetCareColors.brandShadowColor,
  );

  static const TextStyle titleTextStyle = TextStyle(//esta atributo es usado para los titulos escritos en naranjo
    fontFamily: 'Inter', 
    fontWeight: FontWeight.w600, // FontWeight para inter-semibold
    fontSize: 30,
    color: PetCareColors.brandPrimaryColor,
  );

  static const TextStyle blackRegularTextStyle = TextStyle(//esta atributo es usado para los textos en negrita
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400, // FontWeight para inter-regular
    fontSize: 24,
    color: PetCareColors.brandShadowColor,
  );
}

class PetCareInputStyle {//esta clase da formato a los inputs
  final String labelText;

  PetCareInputStyle({required this.labelText});//El parametro label text es requerido pero puede ser recibido como un string vacio

  InputDecoration get regularInput {
    return InputDecoration(
      filled: true,
      fillColor: PetCareColors.brandSecondaryColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      labelText: labelText,
      labelStyle: const TextStyle(fontSize: 12.0, color: PetCareColors.brandShadowColor, fontFamily: 'Inter'), // etiqueta del input con su formato correspondiente
    );
  }
}