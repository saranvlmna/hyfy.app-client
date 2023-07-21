import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hyfy/screens/splashscreen.dart';
import 'package:hyfy/utilitys/theme.dart';

void main() async {
  runApp( hyfy(
     appTheme: AppTheme(),
  ));
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
  const hyfy({super.key,
  required this.appTheme,});

    final AppTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: appTheme.light,
        darkTheme: appTheme.dark,
         themeMode: ThemeMode.light,
      home: const hyfyApp(),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
    );
  }
}

class hyfyApp extends StatefulWidget {
  const hyfyApp({super.key});
  @override
  SplashScreen createState() => SplashScreen();
}
