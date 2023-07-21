// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:hyfy/screens/updateDobScreen.dart';

import '../utilitys/constants.dart';
import '../utilitys/localStorage.dart';
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
                  Image.asset(
                    'assets/images/girllove.png',
                    height: 250,
                    width: 300,
                    alignment: Alignment.topRight,
                  ),
                  Container(height: 80.0),
                  Row(
                    children: [
                      IconButton(
                        icon: const Text('male',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w200,
                                fontFamily: 'Ysabeau')),
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
                                "opponentGender": "male"
                              }));
                          if (response.statusCode == 200) {
                            EasyLoading.dismiss();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateDobScreen(),
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
                        icon: const Text('female',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w200,
                                fontFamily: 'Ysabeau')),
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
                                "opponentGender": "female"
                              }));
                          if (response.statusCode == 200) {
                            EasyLoading.dismiss();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateDobScreen(),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
