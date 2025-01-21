import 'package:flutter/material.dart';
import 'package:islami/cores/services/localstorage.dart';
import 'package:islami/feautures/layout/pages/QuranDetails.dart';
import 'package:islami/feautures/onboarding/pages/on-boardingscreen.dart';
import 'package:islami/feautures/splash%20screens/pages/splash%20screen%201.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await LocalStorageServices.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen1.routeName,
        routes: {
    SplashScreen1.routeName:(BuildContext context) {
    return const SplashScreen1();
    },
          OnBoardingScreen.routeName:(BuildContext context) {
            return const OnBoardingScreen();
          },
          QuranDetails.routeName:(BuildContext context) {
    return const QuranDetails();
    },
      }
    );
  }
}


