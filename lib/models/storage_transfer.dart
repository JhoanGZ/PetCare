// Registration Data Tranferences
// Class de almacenamiento para gestión de datos a través del navigator
class DataRegistrationTransfer {
  String email = '';
  String rut = '';
  String firstName = '';
  String lastName = '';
  String phone = '';
  String address = '';
  String dateBirth = '';
  String female = '';
  String male = '';
  String password = '';
  String passwordCheck = '';
  String termAcceptance = '';

  DataRegistrationTransfer(); //Constructor

  // Reset campos
  void resetData() {
    email = '';
    rut = '';
    firstName = '';
    lastName = '';
    phone = '';
    address = '';
    dateBirth = '';
    female = '';
    male = '';
    password = '';
    passwordCheck = '';
    termAcceptance = '';
  }

  // Método para verificar si todos los campos obligatorios están completos
  bool isComplete() {
    return _isNonEmpty(email) &&
        _isNonEmpty(rut) &&
        _isNonEmpty(firstName) &&
        _isNonEmpty(lastName) &&
        _isNonEmpty(phone) &&
        _isNonEmpty(address) &&
        _isNonEmpty(dateBirth) &&
        _isNonEmpty(female) &&
        _isNonEmpty(male) &&
        _isNonEmpty(password) &&
        _isNonEmpty(passwordCheck) &&
        _isNonEmpty(termAcceptance);
  }

  // Método para convertir la instancia en un mapa de datos
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'rut': rut,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'address': address,
      'dateBirth': dateBirth,
      'female': female,
      'male': male,
      'password': password,
      'passwordCheck': passwordCheck,
      'termAcceptance': termAcceptance,
    };
  }

  // Función auxiliar para verificar si una cadena no está vacía
  bool _isNonEmpty(String value) {
    return value.isNotEmpty;
  }
}
