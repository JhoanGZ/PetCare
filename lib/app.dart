// ignore_for_file: avoid_web_libraries_in_flutter, unused_import
import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
import 'package:petcare_app/models/storage_transfer.dart';
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

class PetCareApp extends StatelessWidget {
  const PetCareApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.home:
            // Asegúrate de que `settings.arguments` es un Map<String, dynamic>
            Map<String, dynamic>? arguments =
                settings.arguments as Map<String, dynamic>?;

            return MaterialPageRoute(
              builder: (context) => Home(
                // Usar ?? para proporcionar valores predeterminados si las variables no están presentes
                userName: arguments?['userName'] ?? 'Invitado',
                userToken: arguments?['userToken'] ?? 'null',
                foundationId: arguments?['foundationId'] ?? 'null',
              ),
            );

          case AppRoutes.registerStepOne:
            return MaterialPageRoute(
              builder: (context) => RegisterStepOne(
                dataStorage: DataRegistrationTransfer(),
              ),
            );

          case AppRoutes.registerStepTwo:
            final DataRegistrationTransfer? storageData =
                settings.arguments as DataRegistrationTransfer?;
            return MaterialPageRoute(
              builder: (context) => RegisterStepTwo(
                dataStorage: storageData ?? DataRegistrationTransfer(),
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
            return MaterialPageRoute(builder: (context) => const UserProfile());

          case AppRoutes.userSavedPets:
            return MaterialPageRoute(
                builder: (context) => const UserSavedPets());

          case AppRoutes.retrievePass:
            return MaterialPageRoute(
                builder: (context) => const RetrievePass());

          case AppRoutes.retrievePassChange:
            return MaterialPageRoute(
                builder: (context) => const RetrievePassChange());

          case AppRoutes.adoptionRequest:
            String? itemID = settings.arguments as String?;

            return MaterialPageRoute(
              builder: (context) => AdoptionRequest(itemID: itemID ?? ''),
            );

          case AppRoutes.adoptionConfirm:
            return MaterialPageRoute(
                builder: (context) => const AdoptionConfirm());

          case AppRoutes.adoptionAccept:
            return MaterialPageRoute(
                builder: (context) => const AdoptionAccept());

          case AppRoutes.donationConfirm:
            return MaterialPageRoute(
                builder: (context) => const DonationConfirm());

          case AppRoutes.ngoProfile:
            final Map<String, dynamic> args =
                settings.arguments as Map<String, dynamic>;
            final String foundationId = args['foundationId'];
            final String userName = args['userName'];
            final String foundationIdClick = args['foundationIdClick'];

            return MaterialPageRoute(
              builder: (context) => NgoProfile(
                foundationId: foundationId,
                userName: userName,
                foundationIdClick: foundationIdClick,
              ),
            );

          case AppRoutes.petProfile:
            final Map<String, dynamic> args =
                settings.arguments as Map<String, dynamic>;
            final String foundationId = args['foundationId'];
            final String userName = args['userName'];

            return MaterialPageRoute(
              builder: (context) => PetProfile(
                foundationId: foundationId,
                userName: userName,
              ),
            );

          case AppRoutes.contact:
            return MaterialPageRoute(builder: (context) => const Contact());

          case AppRoutes.buyMe:
            String? photoPet = settings.arguments as String?;

            return MaterialPageRoute(
                builder: (context) => BuyMe(photoPet: photoPet ?? ''));

          default:
            return MaterialPageRoute(builder: (context) => const LogInPage());
        }
      },
    );
  }
}
