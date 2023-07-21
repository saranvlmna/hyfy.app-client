// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../utilitys/constants.dart';
import '../utilitys/localStorage.dart';
import 'otpVerifyScreen.dart';

class UpdateMobileScreen extends StatelessWidget {
  const UpdateMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mobile number update',
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
            Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Image.asset(
                  'assets/images/updatemobile.png',
                  height: 70,
                  width: 300,
                ),
                const Text(
                  "Enter your",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                const Text(
                  "Mobile number",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70, top: 20),
                  child: TextFormField(
                    maxLength: 10,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gapPadding: 20,
                      ),
                      labelText: 'Phone number',
                    ),
                    controller: myController,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 260,
              height: 35,
              child: Padding(
                padding: const EdgeInsets.only(left: 100),
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
                      EasyLoading.showError(
                          'Please enter a valid phone number');
                    } else {
                      EasyLoading.show();
                      try {
                        var data = jsonEncode({
                          "mobile": myController.text,
                        });
                        final response = await http.put(
                            Uri.parse(ApiConstants.baseUrl +
                                ApiConstants.updateMobileEndpoint),
                            headers: <String, String>{
                              "Content-Type": "application/json",
                               "token":await getValue('token')
                            },
                            body: data);
                        if (response.statusCode == 200) {
                          EasyLoading.dismiss();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OtpVerifyScreen(),
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
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
