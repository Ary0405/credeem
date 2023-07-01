import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 0,
            child: Lottie.asset(
              'assets/confetti.json',
            ),
          ),
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/success.json',
                  width: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'The Transaction Is Successfull',
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Lottie.asset(
                    'assets/done.json',
                    width: 150,
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
