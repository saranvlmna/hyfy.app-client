// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vingle/components/auth/authScreen.dart';

class DisplayedGenderScreen extends StatelessWidget {
  const DisplayedGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(height: 40.0),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    "Who would you",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Ysabeau'),
                    textAlign: TextAlign.start,
                  ),
                  const Text(
                    "like date",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Ysabeau'),
                    textAlign: TextAlign.start,
                  ),
                  Container(height: 300.0),
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/gendermale.png'),
                        iconSize: 100,
                        onPressed: () {},
                        padding: const EdgeInsets.only(left: 40),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 50)),
                      IconButton(
                        icon: Image.asset('assets/images/genderfemale.png'),
                        iconSize: 100,
                        onPressed: () {},
                      )
                    ],
                  ),
                ],
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
            Container(height: 20.0),
            Container(height: 50.0),
          ],
        ),
      ),
    );
  }
}
