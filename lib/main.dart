import 'package:flutter/material.dart';

main() {
  runApp(Vingle());
}

class Vingle extends StatelessWidget {
  const Vingle({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F1F1),
    );
  }
}
