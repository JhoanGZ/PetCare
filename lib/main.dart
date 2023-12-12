import 'package:flutter/material.dart';
import 'package:petcare_app/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  const delay = 2;
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: delay));
  runApp(const PetCareApp());
  FlutterNativeSplash.remove();
}
