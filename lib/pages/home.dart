import 'package:flutter/material.dart';
import 'package:petcare_app/design/colors.dart';
import 'package:petcare_app/design/themes.dart';

class Home extends StatelessWidget {
  final String userName; // TODO::LUIGUI::29-11-23:: Declaro variables
  final String userToken; // TODO::LUIGUI::29-11-23:: Declaro variables
  const Home({super.key, required this.userName, required this.userToken});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: const PetCareTitleAppBarUser(),
        backgroundColor: PetCareColors.brandPrimaryColor,
        toolbarHeight: 28,
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mi Home🥵🍆',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
