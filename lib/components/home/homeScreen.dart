// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hyfy/components/auth/authScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  get dateController => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const AuthScreen()));
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              backgroundColor: const Color.fromARGB(255, 246, 246, 246),
              elevation: 20.0,
            ),
            child: const Text(
              'HyFy Home Screen',
              style: TextStyle(color: Color(0xffCB3333)),
            ),
          ),
        ),
      ),
    );
  }
}

void setState(Null Function() param0) {}
