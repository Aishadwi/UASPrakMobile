import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uasmobile/login_page.dart';
import 'package:uasmobile/splashscreen.dart';

late final FirebaseApp app;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyB63E2yxQAGKKhACV76p0wJkb34EO3O9wY",
      appId: "1:237153152073:android:3aec5efafa649a389ae398",
      messagingSenderId: "hai",
      projectId: "dental-care-d7df2",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AR Dental Care',
      theme:
          ThemeData(colorScheme: ColorScheme.light(primary: Color(0xffEAF2FE))),
      home: AnimatedSplashScreen(
          splash: SplashScreen(),
          nextScreen: LoginPage(),
          duration: 3000,
          splashIconSize: double.infinity,
          splashTransition: SplashTransition.fadeTransition),
    );
  }
}
