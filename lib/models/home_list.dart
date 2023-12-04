class ItemData {
  final String profileIcon;
  final String title;
  final String photo;
  final String description;
  final String idPet;
  final String idfoundation;

  ItemData({
    required this.profileIcon,
    required this.title,
    required this.photo,
    required this.description,
    required this.idPet,
    required this.idfoundation,
  });
}

//TODO: LUIGUI FUCKER AQUI SE ALIMENTA EL LISTVIEW DEL HOME PARA HACER EL SCROLL INFINITE
// Lista de elementos
final List<ItemData> items = [
  ItemData(
    profileIcon: 'assets/images/fundacion perfil.png',
    title: 'Fundacion Esperanza',
    photo: 'assets/images/Bruno.jpg',
    description:
        'Bruno\nRaza: Mestizo\nEdad: 9 meses\nEsterilizacion: Si\nVacunas: Al dia\nPeso: 21kilos\n ',
    idPet: '123', 
    idfoundation: '1',
  ),
  ItemData(
    profileIcon: 'assets/images/fundacion perfil.png',
    title: 'Fundacion Manos Amigas',
    photo: 'assets/images/gatitos luigui.png',
    description: 'Descripción de la imagen 2',
    idPet: '456',
    idfoundation: '2',
  ),
  ItemData(
    profileIcon: 'assets/images/fundacion perfil.png',
    title: 'Fundacion Give Life',
    photo: 'assets/images/sofia.jpg',
    description: 'Descripción de la imagen 3',
    idPet: '789',
    idfoundation: '3',
  ),
    ItemData(
    profileIcon: 'assets/images/fundacion perfil.png',
    title: 'Fundacion Esperanza',
    photo: 'assets/images/Bruno.jpg',
    description:
        'Bruno\nRaza: Mestizo\nEdad: 9 meses\nEsterilizacion: Si\nVacunas: Al dia\nPeso: 21kilos\n ',
    idPet: '123',
    idfoundation: '4',
  ),
  
];
