// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:hyfy/screens/enableLocationWarningScreen.dart';
import 'package:hyfy/utilitys/localStorage.dart';

import '../utilitys/constants.dart';

class GAuthUpdateAboutScreen extends StatelessWidget {
  const GAuthUpdateAboutScreen({super.key});

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
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    ageController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Column(
              children: [
                const Text(
                  " Tell us about",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w200,
                      fontFamily: 'Ysabeau'),
                  textAlign: TextAlign.start,
                ),
                const Text(
                  " yourself",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w200,
                      fontFamily: 'Ysabeau'),
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70, top: 20),
                  child: TextFormField(
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gapPadding: 10,
                      ),
                      labelText: 'name',
                    ),
                    controller: nameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70, top: 10),
                  child: TextFormField(
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gapPadding: 10,
                      ),
                      labelText: 'localtion',
                    ),
                    controller: locationController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70, top: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gapPadding: 10,
                            ),
                            labelText: 'age',
                          ),
                          controller: ageController,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 110,
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gapPadding: 10,
                            ),
                            labelText: 'gender',
                          ),
                          controller: genderController,
                        ),
                      ),
                    ],
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
                    if (nameController.text.isEmpty ||
                        ageController.text.isEmpty ||
                        ageController.text.isEmpty ||
                        locationController.text.isEmpty ||
                        genderController.text.isEmpty) {
                      EasyLoading.showError('Please enter a valid name');
                    } else {
                      EasyLoading.show();
                      try {
                        var data = jsonEncode({
                          "name": nameController.text,
                          "location": locationController.text,
                          "age": ageController.text,
                          "gender": genderController.text,
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
                              builder: (context) =>
                                  EnableLocationWarningScreen(),
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
          ],
        ),
      ),
    );
  }
}
