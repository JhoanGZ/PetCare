class ItemData {
  final String profileIcon;
  final String title;
  final String photo;
  final String description;
  final String id;

  ItemData({
    required this.profileIcon,
    required this.title,
    required this.photo,
    required this.description,
    required this.id,
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
    id: '123'
  ),
  ItemData(
    profileIcon: 'assets/images/fundacion perfil.png',
    title: 'Fundacion Manos Amigas',
    photo: 'assets/images/gatitos luigui.png',
    description: 'Descripción de la imagen 2',
    id: '456'
  ),
  ItemData(
    profileIcon: 'assets/images/fundacion perfil.png',
    title: 'Fundacion Give Life',
    photo: 'assets/images/sofia.jpg',
    description: 'Descripción de la imagen 3',
    id: '789'
  ),
];
