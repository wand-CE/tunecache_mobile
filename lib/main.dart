import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'AppRoutes.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homePage,
      // Trocar initialRoute para loginPage quando terminar desenvolvimento
      routes: AppRoutes.define(),
    ),
  );
}
