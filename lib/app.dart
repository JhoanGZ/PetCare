import 'package:flutter/material.dart';
import 'package:petcare_app/config/app_routes.dart';
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
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.home:
            return MaterialPageRoute(builder: (context) => Home(userValid: settings.arguments as String,));

          case AppRoutes.registerStepOne:
            return MaterialPageRoute(builder: (context) => const RegisterStepOne()); 

          case AppRoutes.registerStepTwo:
            return MaterialPageRoute(builder: (context) => const RegisterStepTwo());

          case AppRoutes.registerStepThree:
            return MaterialPageRoute(builder: (context) => const RegisterStepThree());  

          case AppRoutes.terms:
            return MaterialPageRoute(builder: (context) => const Terms());

          case AppRoutes.userProfile:
            return MaterialPageRoute(builder: (context) => const UserProfile());

          case AppRoutes.userSavedPets:
            return MaterialPageRoute(builder: (context) => const UserSavedPets());

          case AppRoutes.retrievePass:
            return MaterialPageRoute(builder: (context) => const RetrievePass());

          case AppRoutes.retrievePassChange:
            return MaterialPageRoute(builder: (context) => const RetrievePassChange());

          case AppRoutes.adoptionRequest:
            return MaterialPageRoute(builder: (context) => const AdoptionRequest());

          case AppRoutes.adoptionConfirm:
            return MaterialPageRoute(builder: (context) => const AdoptionConfirm());

          case AppRoutes.adoptionAccept:
            return MaterialPageRoute(builder: (context) => const AdoptionAccept()); 

          case AppRoutes.donationConfirm:
            return MaterialPageRoute(builder: (context) => const DonationConfirm()); 

          case AppRoutes.ngoProfile:
            return MaterialPageRoute(builder: (context) => const NgoProfile()); 

          case AppRoutes.petProfile:
            return MaterialPageRoute(builder: (context) => const PetProfile());

          case AppRoutes.contact:
            return MaterialPageRoute(builder: (context) => const Contact());
            
          case AppRoutes.buyMe:
            return MaterialPageRoute(builder: (context) => const BuyMe()); 

          default:
            return MaterialPageRoute(builder: (context) => const LogInPage());
            //return MaterialPageRoute(builder: (context) => const RegisterStepOne());
        }
      },
    );
  }
}
