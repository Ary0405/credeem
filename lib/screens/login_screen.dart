import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'dart:math' as math;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1127),
      body: Center(
        // stack with trophy image and login curved container
        child: Stack(
          children: [
            // trophy image
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Transform.scale(
                scale: 0.8,
                child: Image.asset(
                  'assets/cart-blue.png',
                ),
              ),
            ),
            Positioned(
              top: 700,
              left: 0,
              right: 0,
              child: Transform.scale(
                child: Image.asset(
                  'assets/cart-blue.png',
                ),
                  scale: 1.7,
              ),
            ),
            // login curved container
            Positioned(
              bottom: -50,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(27),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 20.0,
                      sigmaY: 20.0,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.45,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      // column with logo, tagline, and login form
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            SizedBox(child: Image.asset('assets/credeem-logotag.png', fit: BoxFit.cover), height: 70,),
                            const SizedBox(height: 20),
                            // const Text(
                            //   'Login to continue',
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.bold,
                            //     color: Color.fromRGBO(255, 255, 255, 0.8),
                            //   ),
                            // ),
                            // const SizedBox(height: 20),
                            // phone number input
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 0.25),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(113, 99, 186, .1),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                
                                child: InternationalPhoneNumberInput(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  hintText: 'Phone Number',
                                  cursorColor: Colors.white,
                                  inputDecoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Phone Number',
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 0.6),
                                    ),
                                  ),
                                  
                                  onInputChanged: (PhoneNumber number) {
                                    print(number.phoneNumber);
                                  },
                                  selectorConfig: const SelectorConfig(
                                    selectorType:
                                        PhoneInputSelectorType.BOTTOM_SHEET,
                                    leadingPadding: 10,
                                    useEmoji: true,
                                  ),
                                  ignoreBlank: false,
                                  selectorTextStyle:
                                      const TextStyle(color: Colors.white),
                                  initialValue: PhoneNumber(isoCode: 'IN'),
                                  textFieldController: TextEditingController(),
                                  formatInput: false,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(),
                                  onSaved: (PhoneNumber number) {
                                    print('On Saved: $number');
                                  },
                                  spaceBetweenSelectorAndTextField: 0,
                                  inputBorder: InputBorder.none,
                                ),
                              ),
                            ),

                            //gradient login button
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/otp');
                              },
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                color: Color.fromRGBO(106, 153, 244, 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Get OTP',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 5,
              left: 10,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
