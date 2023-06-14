// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../home/homeScreen.dart';

class EnableNotificationWarningScreen extends StatelessWidget {
  const EnableNotificationWarningScreen({super.key});

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
                    "Enable notification",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Ysabeau'),
                    textAlign: TextAlign.start,
                  ),
                  Container(height: 40.0),
                  Image.asset(
                    'assets/images/notification.png',
                    alignment: Alignment.topRight,
                  ),
                  Container(
                    padding: const EdgeInsets.all(30),
                    child: const Text(
                      'Get push-notification when you get the match or receive a message. ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Ysabeau'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(height: 80.0),
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
                            builder: (context) => HomeScreen()));
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
            // Container(height: 20.0),
            // Container(height: 50.0),
          ],
        ),
      ),
    );
  }
}
