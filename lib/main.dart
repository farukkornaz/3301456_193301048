import 'package:flutter/material.dart';

import 'pages/SplashScreen.dart';

void main(){
  runApp(const AryaManga());
}

class AryaManga extends StatelessWidget {
  const AryaManga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}

