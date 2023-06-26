// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hyfy/components/auth/displayedGender.dart';
import 'package:http/http.dart' as http;

import '../utilitys/constants.dart';
import '../utilitys/localStorage.dart';

class UpdateGenderScreen extends StatelessWidget {
  const UpdateGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(height: 60.0),
            const Text(
              "What is your gender",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w200,
                  fontFamily: 'Ysabeau'),
              textAlign: TextAlign.start,
            ),
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
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/gendermale.png'),
                        iconSize: 100,
                        onPressed: () async {
                          EasyLoading.instance
                            ..displayDuration =
                                const Duration(milliseconds: 2000)
                            ..indicatorType =
                                EasyLoadingIndicatorType.chasingDots
                            ..loadingStyle = EasyLoadingStyle.light
                            ..indicatorSize = 40
                            ..radius = 20
                            ..userInteractions = false
                            ..dismissOnTap = false
                            ..maskType = EasyLoadingMaskType.black;
                          EasyLoading.show();
                          final response = await http.put(
                              Uri.parse(ApiConstants.baseUrl +
                                  ApiConstants.updateUserEndpoint),
                              headers: <String, String>{
                                "Content-Type": "application/json",
                                "token": await getValue('token')
                              },
                                body: jsonEncode({
                                "gender": "male"
                              }));
                          if (response.statusCode == 200) {
                            EasyLoading.dismiss();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DisplayedGenderScreen(),
                              ),
                            );
                          } else {
                            EasyLoading.showError(
                                jsonDecode(response.body)['message']);
                            EasyLoading.dismiss();
                            throw Exception('action failed');
                          }
                        },
                        padding: const EdgeInsets.only(left: 40),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 50)),
                      IconButton(
                        icon: Image.asset('assets/images/genderfemale.png'),
                        iconSize: 100,
                        onPressed: () async {
                          EasyLoading.instance
                            ..displayDuration =
                                const Duration(milliseconds: 2000)
                            ..indicatorType =
                                EasyLoadingIndicatorType.chasingDots
                            ..loadingStyle = EasyLoadingStyle.light
                            ..indicatorSize = 40
                            ..radius = 20
                            ..userInteractions = false
                            ..dismissOnTap = false
                            ..maskType = EasyLoadingMaskType.black;
                          EasyLoading.show();
                          final response = await http.put(
                              Uri.parse(ApiConstants.baseUrl +
                                  ApiConstants.updateUserEndpoint),
                              headers: <String, String>{
                                "Content-Type": "application/json",
                                "token": await getValue('token')
                              },
                              body: jsonEncode({
                                "gender": "female"
                              }));
                          if (response.statusCode == 200) {
                            EasyLoading.dismiss();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DisplayedGenderScreen(),
                              ),
                            );
                          } else {
                            EasyLoading.showError(
                                jsonDecode(response.body)['message']);
                            EasyLoading.dismiss();
                            throw Exception('action failed');
                          }
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
