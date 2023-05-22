// ignore_for_file: file_names

import 'package:flutter/material.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "Google Auth & Mobile auth",
        textScaleFactor: 2,
      )),
    );
  }
}
