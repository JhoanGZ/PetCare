// validators_register.dart

class ValidatorsRutRegister {

  //Validador Rut
  static bool isValidRut(String rut) {
    return _isValidRutFormat(rut) && _isValidRutConstraints(rut);
  }
  //Validador Estructura Rut
  static bool _isValidRutFormat(String rut) {
    final RegExp formatRegex = RegExp(r'^\d{1,3}(\.\d{3}){0,2}-?[\dkK]$');
    return formatRegex.hasMatch(rut);
  }
  // Constraints - Casos especiales
  static bool _isValidRutConstraints(String rut) {
    final List<String> invalidRuts = ['0.000.000-0', '1.111.111-1', '5.555.555-5', '1-9', '7.777.777-7'];
    return !invalidRuts.contains(rut.trim());
  }
}
class ValidatorMailRegister{

  //Validador Simple de Correo
  static bool isValidEmail(String email){
    RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

}
  //Validador Contraseña length
class ValidatorPassword {

  static bool isValidPassword(String password) {
    const minimumLengthPassword = 6;
    return password.length >= minimumLengthPassword;
  }
}

//Validador de campos mínimo de 2 carácteres
class ValidatorLengthField {

  static bool isValidFieldLength(String field){
    const minimumLengthField = 2;
    return field.length >= minimumLengthField;
  }
}