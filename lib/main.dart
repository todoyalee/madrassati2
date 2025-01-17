import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:madrassati/ui/screens/signup/signup_screen.dart';
import 'package:madrassati/ui/screens/startup_screen.dart';
//import 'features/candidate/ui/screens/homepage/applicant_main_screen.dart';
import 'package:madrassati/ui/screens/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:madrassati/ui/screens/test/one/HomeScreen.dart';
import 'package:madrassati/ui/screens/onBoarding/onBoarding_scree.dart';
import 'package:madrassati/ui/screens/onBoarding/test/on.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MADRASSATI',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/startup': (context) => const StartupScreen(),
        '/signup': (context) => const SignupScreen(),
        '/APage': (context) => const HomeScreen(),
        '/onBoarding': (context) => const OnboardingScreen(),
        '/onBoarding2': (context) => BoardingPage(),
        //'/home': (context) => const ApplicantMainPage(),
      },
    );
  }
}
