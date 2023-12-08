import 'package:flutter/material.dart';
import 'package:petcare_app/design/themes.dart';
import 'package:petcare_app/models/home_list.dart';

class UserSavedPets extends StatefulWidget {
  const UserSavedPets(
      {super.key, required this.foundationId, required this.userName});
  final String foundationId;
  final String userName;

  @override
  UserSavedPetsState createState() => UserSavedPetsState();
}

class UserSavedPetsState extends State<UserSavedPets> {
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
      filteredItems = items
          .where((item) => item.description.toLowerCase().contains(query))
          .toList();
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
        title: Text(widget.userName),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(
              left: 39,
              bottom: 18,
            ),
            child: Text(
              widget.userName,
              style: PetCareThemes.titleTextStyle,
              textAlign: TextAlign.right,
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
                  'assets/images/pic_default_user.png',
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 180,
              ),
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
                      title: Text(item.description),
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
