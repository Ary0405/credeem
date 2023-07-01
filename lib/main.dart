import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/screens/logged_in_screen.dart';
import 'package:loyalty_app/screens/login_screen.dart';
import 'package:loyalty_app/screens/onboarding_screen.dart';
import 'package:loyalty_app/screens/otp_screen.dart';
import 'package:loyalty_app/screens/select_store_screen.dart';
import 'package:loyalty_app/screens/settings_screen.dart';
import 'package:loyalty_app/screens/store_details_screen.dart';
import 'package:loyalty_app/screens/success_screen.dart';
import 'package:loyalty_app/screens/waiting_screen.dart';
// import 'package:loyalty_app/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loyalty App',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(primary: const Color(0xFF151517)),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const OnboardingScreen(),
      routes: {
        '/settings': (context) => const SettingsScreen(),
        '/store_details': (context) => const StoreDetailsScreen(),
        '/select_store': (context) => const SelectStoreScreen(),
        '/success': (context) => const SuccessScreen(),
        '/waiting' :(context) => const WaitingScreen(),
        '/login' :(context) => const LoginScreen(),
        '/otp' :(context) => const OtpScreen(),
        '/logged_in' :(context) => const LoggedInScreen(),
      },
    );
  }
}
