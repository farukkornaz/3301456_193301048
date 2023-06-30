import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'MainPage.dart';

/*import 'MainPage.dart';*/

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(

      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/mushroom.png"),
          const Text(
            "Arya Manga",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.brown),
          ),
          const SizedBox(height: 80,),
        ],
      ),
      backgroundColor: Colors.lightGreen,
      nextScreen: HomePage(),
      splashIconSize: 300,
      duration: 300,
      splashTransition: SplashTransition.fadeTransition,);
  }
}
