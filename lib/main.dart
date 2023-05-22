import 'package:flutter/material.dart';

import 'components/splashscreen.dart';

main() {
  runApp(Vingle());
}

class Vingle extends StatelessWidget {
  const Vingle({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
