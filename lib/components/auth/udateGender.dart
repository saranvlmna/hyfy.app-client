// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vingle/components/auth/authScreen.dart';
import 'package:vingle/components/auth/otpVerify.dart';

class UpdateGenderScreen extends StatelessWidget {
  const UpdateGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(height: 60.0),
                  Image.asset(
                    'assets/images/updategender.png',
                    height: 250,
                    width: 300,
                    alignment: Alignment.topRight,
                  ),
                ],
                // const Text(
                //   "Gender",
                //   style: TextStyle(
                //       fontSize: 30,
                //       fontWeight: FontWeight.w200,
                //       fontFamily: 'Ysabeau'),
                //   textAlign: TextAlign.start,
                // ),
              ),
            ),
            SizedBox(
              width: 230,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthScreen()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  backgroundColor: const Color.fromARGB(255, 246, 246, 246),
                  elevation: 20.0,
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(color: Color(0xffCB3333)),
                ),
              ),
            ),
            Container(height: 60.0),
          ],
        ),
      ),
    );
  }
}
