// ignore_for_file: file_names

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hyfy/components/auth/googleAuthScreen.dart';
import 'package:hyfy/components/auth/otpVerify.dart';
import 'package:hyfy/components/auth/updateMobile.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

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
                    " Continue with",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Ysabeau'),
                    textAlign: TextAlign.start,
                  ),
                  Container(height: 50.0),
                  Image.asset(
                    'assets/images/authimg.png',
                    height: 250,
                    width: 300,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 260,
              height: 35,
              child: ElevatedButton(
                onPressed: () async {
                  User? user =
                      await Authentication.signInWithGoogle(context: context);
                  if (user != null) {
                    var userData = jsonEncode({
                      "name": user.providerData[0].displayName,
                      "email": user.providerData[0].email,
                      "mobile": user.providerData[0].phoneNumber,
                      "photo": user.providerData[0].photoURL,
                      "providerId": user.providerData[0].providerId,
                      "uid": user.providerData[0].uid,
                      "refreshToken": user.refreshToken,
                      "tenantId": user.tenantId,
                      // ignore: equal_keys_in_map
                      "uid": user.uid,
                      "signUpMethod": "google"
                    });
                    final response = await http.post(
                        Uri.parse(
                            'https://359b-2402-3a80-1cb1-b9f-f903-d2a2-95b3-f0ad.ngrok-free.app/auth/signin'),
                        headers: <String, String>{
                          "Content-Type": "application/json"
                        },
                        body: userData);
                    print(response);
                    if (response.statusCode == 200) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => UpdateMobileScreen(
                            user: user,
                          ),
                        ),
                      );
                    }
                    throw Exception('Failed to user creation');
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  backgroundColor: const Color.fromARGB(255, 246, 246, 246),
                  elevation: 20.0,
                ),
                child: const Text(
                  'Google signin',
                  style: TextStyle(color: Color(0xffCB3333)),
                ),
              ),
            ),
            Container(height: 20.0),
            SizedBox(
              width: 260,
              height: 35,
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OtpVerifyScreen()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  backgroundColor: const Color.fromARGB(255, 246, 246, 246),
                  elevation: 20.0,
                ),
                child: const Text(
                  'Phone number',
                  style: TextStyle(color: Color(0xffCB3333)),
                ),
              ),
            ),
            Container(height: 50.0),
          ],
        ),
      ),
    );
  }
}
