// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:hyfy/screens/udateGenderScreen.dart';
import 'package:hyfy/utilitys/localStorage.dart';

import '../utilitys/constants.dart';

class UpdateNameScreen extends StatelessWidget {
  const UpdateNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Name update screen',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

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
                    " I'm ",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Ysabeau'),
                    textAlign: TextAlign.start,
                  ),
                  Container(height: 60.0),
                  Image.asset(
                    'assets/images/updatename.png',
                    height: 100,
                    width: 300,
                  ),
                  Container(
                    padding: EdgeInsets.all(60),
                    child: TextFormField(
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                          gapPadding: 10,
                        ),
                        labelText: 'name',
                      ),
                      controller: myController,
                    ),
                  )
                ],
              ),
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
                  if (myController.text.isEmpty) {
                    EasyLoading.showError('Please enter a valid name');
                  } else {
                    EasyLoading.show();
                    try {
                      var data = jsonEncode({
                        "name": myController.text,
                      });
                      final response = await http.put(
                          Uri.parse(ApiConstants.baseUrl +
                              ApiConstants.updateUserEndpoint),
                          headers: <String, String>{
                            "Content-Type": "application/json",
                            "token": await getValue('token')
                          },
                          body: data);
                      if (response.statusCode == 200) {
                        EasyLoading.dismiss();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateGenderScreen(),
                          ),
                        );
                      } else {
                        EasyLoading.showError(
                            jsonDecode(response.body)['message']);
                        EasyLoading.dismiss();
                        throw Exception('signin failed');
                      }
                    } catch (e) {
                      print(e);
                    }
                  }
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
