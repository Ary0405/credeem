import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/screens/logged_in_screen.dart';
import 'package:loyalty_app/screens/select_store_screen.dart';
import 'package:loyalty_app/screens/settings_screen.dart';
import 'package:loyalty_app/screens/store_details_screen.dart';
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
      home: const LoggedInScreen(),
      routes: {
        '/settings': (context) => const SettingsScreen(),
        '/store_details': (context) => const StoreDetailsScreen(),
        '/select_store': (context) => const SelectStoreScreen(),
      },
    );
  }
}
