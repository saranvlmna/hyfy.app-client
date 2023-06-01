import 'package:flutter/material.dart';
import 'package:hyfy/components/splashscreen.dart';

void main() {
  runApp(const hyfy());
}

class hyfy extends StatelessWidget {
  const hyfy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const hyfyApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class hyfyApp extends StatefulWidget {
  const hyfyApp({super.key});
  @override
  SplashScreen createState() => SplashScreen();
}
