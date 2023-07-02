import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/providers/auth_provider.dart';
import 'package:loyalty_app/screens/logged_in_screen.dart';
import 'package:loyalty_app/screens/login_screen.dart';
import 'package:loyalty_app/screens/onboarding_screen.dart';
import 'package:loyalty_app/screens/otp_screen.dart';
import 'package:loyalty_app/screens/select_store_screen.dart';
import 'package:loyalty_app/screens/settings_screen.dart';
import 'package:loyalty_app/screens/store_details_screen.dart';
import 'package:loyalty_app/screens/success_screen.dart';
import 'package:loyalty_app/screens/waiting_screen.dart';
import 'package:provider/provider.dart';
// import 'package:loyalty_app/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class NoGlowOnScroll extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(
            username: "",
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Creedem',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: const Color(0xFF151517)),
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: NoGlowOnScroll(),
            child: child ?? const SizedBox(),
          );
        },
        home: const OnboardingScreen(),
        routes: {
          '/settings': (context) => const SettingsScreen(),
          '/store_details': (context) => const StoreDetailsScreen(),
          '/select_store': (context) => const SelectStoreScreen(),
          '/success': (context) => const SuccessScreen(),
          '/waiting': (context) => const WaitingScreen(),
          '/login': (context) => const LoginScreen(),
          '/otp': (context) => const OtpScreen(),
          '/logged_in': (context) => const LoggedInScreen(),
        },
      ),
    );
  }
}
