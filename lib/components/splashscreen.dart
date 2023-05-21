import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF6F1F1),
      drawer: Drawer(child: Column(children: const [Text('vingle')])),
    ));
  }
}
