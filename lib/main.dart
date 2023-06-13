import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hyfy/components/splashscreen.dart';

void main() async {
  runApp(const hyfy());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyD1_mO_lONg1U1XP5yeMhYKFzFrUKfBFN0",
      appId: "1:775701750336:android:ea3fdc49b20df90f4475a5",
      messagingSenderId: "XXX",
      projectId: "hyfydatingapp",
    ),
  );
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
