import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcare_app/config/app_urls.dart';

Future<void> sendDonationPet(
    GlobalKey<FormState> formKey,
    String donationAmount,
    String idPet,
    String idUser,
    BuildContext context) async {
  print('Se recibe dato en donation_pet_service:$donationAmount');
  print('Se recibe dato en donation_pet_service:$idPet');
  print('Se recibe dato en donation_pet_service:$idUser');
  
  try {
    final response = await http.post(
      Uri.parse('${AppUrls.baseUrlLocal}/api/login'), //FIXME:LUIGUI, asignar EP
      body: {'amount': donationAmount.toString()},
    );

    if (response.statusCode >= 200 || response.statusCode <= 300) {
      print('Donation amount sent successfully');
    } else {
      print('Failed to send donation amount');
    }
  } catch (e) {
    print('Error sending donation amount: $e');
  }
}
