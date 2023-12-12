// ignore_for_file: avoid_web_libraries_in_flutter, unused_import
import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/models/register_data_transfer.dart';
import 'package:petcare_app/pages/adoption_accept.dart';
import 'package:petcare_app/pages/adoption_confirm.dart';
import 'package:petcare_app/pages/adoption_request.dart';
import 'package:petcare_app/pages/buy_me.dart';
import 'package:petcare_app/pages/contact.dart';
import 'package:petcare_app/pages/donation_confirm.dart';
import 'package:petcare_app/pages/home.dart';
import 'package:petcare_app/pages/login.dart';
import 'package:petcare_app/pages/ngo_profile.dart';
import 'package:petcare_app/pages/pet_profile.dart';
import 'package:petcare_app/pages/register_step_one.dart';
import 'package:petcare_app/pages/register_step_three.dart';
import 'package:petcare_app/pages/register_step_two.dart';
import 'package:petcare_app/pages/retrieve_pass.dart';
import 'package:petcare_app/pages/retrieve_pass_change.dart';
import 'package:petcare_app/pages/terms.dart';
import 'package:petcare_app/pages/user_profile.dart';
import 'package:petcare_app/pages/users_saved_pets.dart';
import 'package:petcare_app/models/user_manager.dart';

class PetCareApp extends StatelessWidget {
  const PetCareApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //COMMENT: DESACTIVADO DEBUG BANNER

      onGenerateRoute: (settings) {
        switch (settings.name) {
          
          case AppRoutes.home:            
            Map<String, dynamic>? arguments =
                settings.arguments as Map<String, dynamic>?;
            // print('en App.Dart ${arguments}userData'); 
            return MaterialPageRoute(
              builder: (context) => Home(
                userData: arguments?['userData'] ?? 'Invitado',
              ),
            );

          case AppRoutes.registerStepOne:
            return MaterialPageRoute(
              builder: (context) => RegisterStepOne(
                storageData: DataRegistrationTransfer(),
              ),
            );

          case AppRoutes.registerStepTwo:
            final DataRegistrationTransfer? storageData =
                settings.arguments as DataRegistrationTransfer?;
            return MaterialPageRoute(
              builder: (context) => RegisterStepTwo(
                storageData: storageData ?? DataRegistrationTransfer(),
              ),
            );

          case AppRoutes.registerStepThree:
            final DataRegistrationTransfer? storageData =
                settings.arguments as DataRegistrationTransfer?;
            return MaterialPageRoute(
              builder: (context) => RegisterStepThree(
                storageData: storageData ?? DataRegistrationTransfer(),
              ),
            );

          case AppRoutes.terms:
            return MaterialPageRoute(builder: (context) => const Terms());

          case AppRoutes.userProfile:
            // Asegurarse `settings.arguments` es un Map<String, dynamic>
            Map<String, dynamic>? arguments =
                settings.arguments as Map<String, dynamic>?;

            return MaterialPageRoute(
              builder: (context) => UserProfile(
                // Usar ?? para proporcionar valores predeterminados si las variables no están presentes
                userData: arguments?['userData'] ?? 'Invitado',
              ),
            );

          case AppRoutes.userSavedPets:
            final Map<String, dynamic> args =
                settings.arguments as Map<String, dynamic>;
            final String foundationId = args['foundationId'];
            final String userName = args['userName'];

            return MaterialPageRoute(
              builder: (context) => UserSavedPets(
                foundationId: foundationId,
                userName: userName,
              ),
            );

          case AppRoutes.retrievePass:
            return MaterialPageRoute(
                builder: (context) => const RetrievePass());

          case AppRoutes.retrievePassChange:
            return MaterialPageRoute(
                builder: (context) => const RetrievePassChange());

          case AppRoutes.adoptionRequest:
            Map<String, dynamic>? arguments = settings.arguments as Map<String, dynamic>?;

            // Cambia el tipo de petData de List<dynamic> a Map<String, dynamic>
            Map<String, dynamic> petData = arguments?['petData'] ?? <String, dynamic>{};

            return MaterialPageRoute(
              builder: (context) => AdoptionRequest(
                userData: arguments?['userData'] ?? 'Invitado',
                petData: petData,
              ),
            );


          case AppRoutes.adoptionConfirm:
            return MaterialPageRoute(
                builder: (context) => const AdoptionConfirm());


          case AppRoutes.adoptionAccept:
            Map<String, dynamic>? arguments = settings.arguments as Map<String, dynamic>?;
            List<dynamic> petData = arguments?['petData'] ?? <dynamic>[];
            final int foundationIdClick =
                arguments?['foundationIdClick'] ?? '';
            return MaterialPageRoute(
                builder: (context) => AdoptionAccept(
                  userData: arguments?['userData'] ?? 'Invitado',
                  petData: petData,
                  foundationIdClick: foundationIdClick, 
                ));

          case AppRoutes.donationConfirm:
            return MaterialPageRoute(
                builder: (context) => const DonationConfirm());

          case AppRoutes.ngoProfile:
            // Asegurarse `settings.arguments` es un Map<String, dynamic>
            Map<String, dynamic>? arguments =
                settings.arguments as Map<String, dynamic>?;
            List<dynamic> petData = arguments?['petData'] ?? <dynamic>[];
            final int foundationIdClick =
                arguments?['foundationIdClick'] ?? '';

            return MaterialPageRoute(
              builder: (context) => NgoProfile(
                // Usar ?? para proporcionar valores predeterminados si las variables no están presentes
                userData: arguments?['userData'] ?? 'Invitado',
                foundationIdClick: foundationIdClick, 
                petData: petData,
                
              ),
            );

          case AppRoutes.petProfile:
            // Asegurarse `settings.arguments` es un Map<String, dynamic>
            Map<String, dynamic>? arguments =
                settings.arguments as Map<String, dynamic>?;
            List<dynamic> petData = arguments?['petData'] ?? <dynamic>[];
            final int foundationIdClick =
                arguments?['foundationIdClick'] ?? '';

            return MaterialPageRoute(
              builder: (context) => PetProfile(
                userData: arguments?['userData'] ?? 'Invitado',
                foundationIdClick: foundationIdClick, 
                petData: petData,
              ),
            );
          
          case AppRoutes.contact:
            return MaterialPageRoute(builder: (context) => const Contact());

          case AppRoutes.buyMe:
            // Asegurarse `settings.arguments` es un Map<String, dynamic>
            Map<String, dynamic>? arguments =
                settings.arguments as Map<String, dynamic>?;

            final String photoPet = arguments?['photoPet'] ?? '';
            final int idPet = arguments?['idPet'] ?? 0;

            return MaterialPageRoute(
              builder: (context) => BuyMe(
                // Usar ?? para proporcionar valores predeterminados si las variables no están presentes
                userData: arguments?['userData'] ?? 'Invitado',
                photoPet: photoPet,
                idPet: idPet
              ),
            );

          // case AppRoutes.buyMe:
          //   String? photoPet = settings.arguments as String?;
          //   return MaterialPageRoute(
          //       builder: (context) => BuyMe(photoPet: photoPet ?? ''));

          default:
            return MaterialPageRoute(builder: (context) => const LogInPage());
        }
      },
    );
  }
}
