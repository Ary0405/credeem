import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1127),
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 0,
            child: Lottie.asset(
              'assets/confetti.json',
              repeat: false,
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/success.json',
                  width: 200,
                  fit: BoxFit.cover,
                  repeat: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Credit Swap Complete!',
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/logged_in');
                      // no splash
                    },
                    child: Lottie.asset(
                      'assets/done.json',
                      width: 100,
                      fit: BoxFit.cover,
                      repeat: false,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
