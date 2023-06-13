// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import 'otpVerify.dart';

class MobileAuthScreen extends StatelessWidget {
  const MobileAuthScreen({super.key});

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
            Container(height: 40.0),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    "My number is",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Ysabeau'),
                    textAlign: TextAlign.start,
                  ),
                  Container(height: 50.0),
                  Container(
                    padding: EdgeInsets.all(60),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Field is required.';
                        return null;
                      },
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(30),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                          gapPadding: 10,
                        ),
                        labelText: 'Phone number',
                      ),
                      controller: myController,
                    ),
                  )
                ],
              ),
            ),
            Container(height: 20.0),
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
                    EasyLoading.showError('Please enter a valid phone number');
                  }else{
                  EasyLoading.show();
                  final response = await http.post(
                      Uri.parse('https://hyfyserver.vercel.app/auth/signin'),
                      headers: <String, String>{
                        "Content-Type": "application/json"
                      },
                      body: {
                        "mobile": myController.text,
                        "signUpMethod": "mobile"
                      });
                  if (response.statusCode == 200) {
                    EasyLoading.dismiss();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpVerifyScreen(
                          token: myController.text,
                        ),
                      ),
                    );
                  } else {
                    EasyLoading.showError(response.body);
                    EasyLoading.dismiss();
                    throw Exception('mobile updation failed');
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
            Container(height: 150),
          ],
        ),
      ),
    );
  }
}