import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ultrasound/auth/logout.dart';
import 'package:ultrasound/auth/main_page.dart';
import 'package:ultrasound/auth/verify.dart';
import 'package:ultrasound/firebase_options.dart';
import 'package:ultrasound/screens/labeller.dart';
import 'package:ultrasound/screens/landing_pg.dart';
import 'package:ultrasound/screens/loading_screen.dart';
import 'package:ultrasound/screens/registration.dart';
import 'package:ultrasound/services/sheet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DataSheetApi.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MainPage(),
      routes: {
        MainPage.routeName: (context) => MainPage(),
        LoadingScreen.routeName: (context) => const LoadingScreen(),
        Verification.routeName: (context) => const Verification(),
        Logout.routeName: (context) => const Logout(),
        RegistrationPage.routeName: (context) => const RegistrationPage(),
        LandingPage.routeName: (context) => const LandingPage(),
        Labeller.routeName: (context) => Labeller(),
      },
    );
  }
}
