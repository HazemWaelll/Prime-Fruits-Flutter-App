import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:prime_fruits/components/Bottom_Bar.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset('assets/images/ThanksgivingBasket.json')
      ),
      nextScreen: const BottomBar(),
      splashIconSize: 200,
      duration: 2000,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}