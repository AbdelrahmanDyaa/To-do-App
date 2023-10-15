import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/view/screens/home_screen.dart';
import 'package:todo_app/view_model/utils/images.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      splash: AppImage.logo,
      splashIconSize: 200,
      nextScreen: HomePage(),
      splashTransition: SplashTransition.slideTransition,
     // pageTransitionType: PageTransitionType.scale,
    );
  }
}


