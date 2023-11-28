import 'package:flutter/material.dart';
import 'package:petcare_app/design/colors.dart';

class PetCareThemes {
  PetCareThemes._();

  static const TextStyle statementTextStyle = TextStyle(
    fontFamily: 'Inter', 
    fontWeight: FontWeight.w200, // FontWeight para inter-extralight
    fontSize: 15,
    color: PetCareColors.brandShadowColor,
  );

  static const TextStyle titleTextStyle = TextStyle(
    fontFamily: 'Inter', 
    fontWeight: FontWeight.w600, // FontWeight para inter-semibold
    fontSize: 30,
    color: PetCareColors.brandPrimaryColor,
  );
  
  static const TextStyle blackRegularTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400, // FontWeight para inter-regular
    fontSize: 24,
    color: PetCareColors.brandShadowColor,
  );
}
