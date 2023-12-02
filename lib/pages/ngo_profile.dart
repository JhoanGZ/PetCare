import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/design/colors.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/models/home_list.dart';
import 'package:petcare_app/widgets/expandable_text.dart';

class NgoProfile extends StatefulWidget {
  const NgoProfile({super.key});

  @override
  NgoProfileState createState() => NgoProfileState();
}

class NgoProfileState extends State<NgoProfile> {
  late TextEditingController _searchController;
  List<ItemData> filteredItems = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    filteredItems = items; // Inicialmente, muestra todos los elementos
    _searchController.addListener(onSearchChanged);
  }

  void onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredItems =
          items.where((item) => item.id.toLowerCase().contains(query)).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: Image.asset(
          'assets/images/logo_petcare_blanco.png',
          width: 21,
          height: 21,
        ), // Widget del título del AppBar
        backgroundColor: PetCareColors.brandPrimaryColor,
        toolbarHeight: 28,
        centerTitle: true,
       ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(
              left: 39,
              bottom: 18,
            ),

          ),
          Row(
            children: [
              const SizedBox(
                width: 23,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/images/fundacion perfil.png',
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
                    const Expanded(child: Text('Fundacion esperanza animal', style: PetCareThemes.nameProfileTextStyle, textAlign: TextAlign.center,)),

            ],
            
          ),
           Row(
                   children:[   
                    Container(
                      margin: const EdgeInsets.only(left: 46, right: 100, top: 20),
                      child: const Text('96', style: PetCareThemes.nameProfileTextStyle,)),
                    Container(
                      margin: const EdgeInsets.only(top:20),
                      child: const Text('120',style: PetCareThemes.nameProfileTextStyle,)), ]   
          ),
                     Row(
                   children:[   
                    Container(
                      margin: const EdgeInsets.only(left: 12, right: 30, bottom: 20),
                      child: const Text('Publicaciones', style: PetCareThemes.statementTextStyle,)),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: const Text('adopciones',style: PetCareThemes.statementTextStyle,)), ]   
          ),

                    // Utilizando el widget ExpandableTextWidget
                    Container(
                      margin: const EdgeInsets.only(right: 100 ,left: 20, bottom: 20),
                      child: const ExpandText(text: 'Fundación Esperanza Animal es una organización sin fines de lucro que se forma con el objetivo de mejorar la calidad de vida de las mascotas abandonadas o nacidas en la calle y a la vez disminuir la sobrepoblación a través de la educación y concientizar sobre la temática de Tenencia Responsable en nuestro país.', maxLines: 100,)),

          Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20, left: 14),
                  child: ElevatedButton(
                    onPressed: () {
                              Navigator.of(context).pushNamed(AppRoutes.petProfile);
                    },
                    style: PetCareLittleButtonStyles.elevatedButtonStyle,
                    child: const Text('Agregar nuevo'),
                  ),
                ),
                const SizedBox(width: 34,),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextFormField(
                  controller: _searchController,
                  textAlign: TextAlign.right,
                  decoration:
                      PetCareInputStyle(labelText: ' Buscar').regularInput,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
              ),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return GestureDetector(
                  onTap: () {
                    // Acción cuando se toca un elemento
                  },
                  child: GridTile(
                    footer: GridTileBar(
                      backgroundColor: Colors.black45,
                      title: Text(item.id),
                    ),
                    child: Image.asset(
                      item.photo,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          
        ],
        
      ),
    );
  }
}
