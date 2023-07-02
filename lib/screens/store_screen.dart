import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/exciting_offers.dart';
import '../widgets/existing_offer.dart';
import '../widgets/stores_near_you.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFF0D1325),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width * .5,
            top: MediaQuery.of(context).size.width * .05,
            child: Image.asset(
              'assets/ball.png',
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.width * .7,
            ),
          ),
          Positioned(
            left: -MediaQuery.of(context).size.width * .3,
            top: MediaQuery.of(context).size.width * .7,
            child: Image.asset(
              'assets/ball.png',
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height * .9,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.1,
                    left: MediaQuery.of(context).size.width * 0.03,
                    right: MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(27),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 50.0,
                        sigmaY: 50.0,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * .04,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Credeem',
                                  style: GoogleFonts.montserrat(
                                    color: const Color(0xFFF6FFFC),
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2.02,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02,
                                ),
                                Text(
                                  'Welcome back,',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  'Divyang!',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02,
                                ),
                                Container(
                                  width: 200,
                                  height: 40,
                                  decoration: ShapeDecoration(
                                    color: const Color(0x14FFFCFC),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Transaction History >',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://avatars.githubusercontent.com/u/41837037?v=4"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const ExistingOffer(),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: EdgeInsets.all(
                    MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: const SearchBox(),
                ),
                const StoresNearYou(),
                const SizedBox(
                  height: 18,
                ),
                const ExcitingOffers(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF2F2F30),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Icon(
            Icons.search,
            color: Colors.white.withOpacity(0.6499999761581421),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search For Stores',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.6499999761581421),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
