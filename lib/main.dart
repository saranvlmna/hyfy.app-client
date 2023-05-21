import 'package:flutter/material.dart';

import 'components/splashscreen.dart';

main() {
  runApp(Vingle());
}

class Vingle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
