import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:loader_overlay/loader_overlay.dart';
import 'dart:math' as math;

import '../providers/auth_provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context);
    return LoaderOverlay(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF0D1127),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/otp.png',
                ),
                // const SizedBox(height: 20),
                const Text(
                  'Verification Code',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  width: 300,
                  child: Text(
                    'We have sent a One-Time Password to your mobile number ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                // otp input boxes
                OTPTextField(
                  length: 4,
                  width: 250,
                  fieldWidth: 50,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) async {
                    context.loaderOverlay.show();
                    Response res = await http.post(
                      Uri.parse('http://192.168.1.2:3000/user/new'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        'user': user.username,
                      }),
                    );
                    if (res.statusCode == 200) {
                      print("user created");
                      // ignore: use_build_context_synchronously
                      context.loaderOverlay.hide();
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, '/logged_in');
                    } else {
                      print("error");
                      // ignore: use_build_context_synchronously
                      context.loaderOverlay.hide();
                    }
                  },
                  otpFieldStyle: OtpFieldStyle(
                    backgroundColor: const Color.fromRGBO(106, 153, 244, 1),
                    borderColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
