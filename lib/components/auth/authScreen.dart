// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 20, right: 100),
              child: const Text(
                " Continue with",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w200,
                    fontFamily: 'Ysabeau'),
              ),
            ),
            Center(
              child: Image.asset(
                'assets/images/authimg.png',
                height: 250,
                width: 300,
                alignment: Alignment.topLeft,
              ),
            ),
            Container(
              child: const Text("Google SignIn"),
            ),
            Container(child: Text("Mobile SignIn")),
          ],
        ),
      ),
    );
  }
}
