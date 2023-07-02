import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/data/stores_data.dart';

class StoresNearYou extends StatelessWidget {
  const StoresNearYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.04,
          ),
          child: Text(
            'Stores Near You',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        SizedBox(
          height: 200,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: storeData
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/store_details',
                          arguments: e,
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.04,
                        ),
                        child: Container(
                          width: 200,
                          // padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment(0.00, -1.00),
                                end: Alignment(0, 1),
                                colors: [Color(0xFF212C5D), Color(0xFF161F38)],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 8,
                                left: MediaQuery.of(context).size.width * .32,
                                child: Container(
                                  width: 65,
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 8,
                                    top: 8,
                                    bottom: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0x8C151515),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Text(
                                          e.points.toString(),
                                          style: GoogleFonts.poppins(
                                            color: const Color(0xFFA3DDC9),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/green_coin.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: const ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Image.network(
                                          e.logoUrl,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 13,
                                    ),
                                    Text(
                                      e.name,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '${e.perksAvailable} Perks Available',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFFB8B8B8),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList()),
        )
      ],
    );
  }
}
