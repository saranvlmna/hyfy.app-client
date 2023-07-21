// ignore_for_file: file_names

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:hyfy/providers/googleAuthProvider.dart';
import 'package:hyfy/screens/updateMobileScreen.dart';
import 'package:hyfy/utilitys/localStorage.dart';

import '../utilitys/constants.dart';
import 'homeScreen.dart';
import 'mobileAuthScreen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/authimg.png',
                    height: 70,
                    width: 300,
                  ),
                  const Text(
                    " Continue with",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Ysabeau'),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: 300,
              ),
              SizedBox(
                width: 260,
                height: 35,
                child: ElevatedButton(
                  onPressed: () async {
                    EasyLoading.instance
                      ..displayDuration = const Duration(milliseconds: 2000)
                      ..indicatorType = EasyLoadingIndicatorType.chasingDots
                      ..loadingStyle = EasyLoadingStyle.light
                      ..indicatorSize = 40
                      ..radius = 20
                      ..userInteractions = false
                      ..dismissOnTap = false
                      ..maskType = EasyLoadingMaskType.black;
                    EasyLoading.show();
                    User? user =
                        await Authentication.signInWithGoogle(context: context);
                    var userData = jsonEncode({
                      "name": user?.providerData[0].displayName,
                      "email": user?.providerData[0].email,
                      "mobile": user?.providerData[0].phoneNumber,
                      "photo": user?.providerData[0].photoURL,
                      "providerId": user?.providerData[0].providerId,
                      "uid": user?.providerData[0].uid,
                      "refreshToken": user?.refreshToken,
                      "tenantId": user?.tenantId,
                      // ignore: equal_keys_in_map
                      "uid": user?.uid,
                      "signUpMethod": "google"
                    });
                    final response = await http.post(
                        Uri.parse(ApiConstants.baseUrl +
                            ApiConstants.singninEndpoint),
                        headers: <String, String>{
                          "Content-Type": "application/json"
                        },
                        body: userData);
                    if (response.statusCode == 200) {
                      EasyLoading.dismiss();
                      await setValue('token',
                          jsonDecode(response.body)['data']['accessToken']);
                      if (jsonDecode(response.body)['data']['user']
                          ['mobileVerified']) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      } else {
                        EasyLoading.dismiss();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateMobileScreen(),
                          ),
                        );
                      }
                    } else {
                      EasyLoading.showError(
                          jsonDecode(response.body)['message']);
                      EasyLoading.dismiss();
                      throw Exception('signin failed');
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
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 260,
                height: 35,
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MobileAuthScreen()));
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
            ],
          ),
        ),
      ),
    );
  }
}
