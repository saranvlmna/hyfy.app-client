// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'enableNotificationWarningScreen.dart';

class EnableLocationWarningScreen extends StatelessWidget {
  const EnableLocationWarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 100,),
                  const Text(
                    "Enable location",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Ysabeau'),
                    textAlign: TextAlign.start,
                  ),
                  Image.asset(
                    'assets/images/enablelocation.png',
                    alignment: Alignment.topRight,
                  ),
                  Container(
                    padding: const EdgeInsets.all(30),
                    child: const Text(
                      'Enable location to know the distance between you and your mate ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Ysabeau'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.only(right: 25, bottom: 25),
              child: SizedBox(
                width: 60,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const EnableNotificationWarningScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    backgroundColor: const Color.fromARGB(255, 246, 246, 246),
                    elevation: 30.0,
                  ),
                  child: Image.asset('assets/images/next.png',
                      width: 300, height: 150, fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
