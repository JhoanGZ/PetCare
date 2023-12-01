class AppRoutes {
  // Si alguna dificultad para reconocer las variables, pregunten y anoten su descripción al lado con el nombre que tenemos en figma.
  AppRoutes._();
  static const String splash = 'splash';
  static const String logIn = 'login'; // temporal para testear el login
  static const String home = 'home';
  static const String registerStepOne = 'registerStepOne';
  static const String registerStepTwo = 'registerStepTwo';
  static const String registerStepThree = 'registerStepThree';
  static const String terms = 'terms';
  static const String userProfile = 'userProfile';
  static const String userSavedPets = 'userSavedPets'; // Mock Mascotas guardadas 
  static const String retrievePass = 'retrievePass';
  static const String retrievePassChange = 'retrievePassChange';
  static const String adoptionRequest = 'adoptionRequest'; 
  static const String adoptionConfirm = 'adoptionConfirm';
  static const String adoptionAccept = 'adoptionAccept';
  static const String donationConfirm = 'donationConfirm';
  static const String ngoProfile = 'ngoProfile'; // Perfil ONG
  static const String petProfile = 'petProfile'; // En figma está cómo Publicación
  static const String contact = 'contact';
  static const String buyMe = 'buyMe'; // No ibamos a dejar las donaciones afuera
  //TODO: Agregar ruta de vista = nologin_pet
}
