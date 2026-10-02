import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:safenest/screen/medicine_taken_screen.dart';
import 'package:safenest/screen/splash_screen.dart';
import 'firebase_options.dart';
//import 'screen/reminder_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      //home: UpcomingMedicines(),
    ),
  );
}