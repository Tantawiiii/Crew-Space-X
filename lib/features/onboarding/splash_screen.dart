import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:space_x/core/utils/colors_code.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCode.blue500,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Lottie.asset(
          'assets/anim/anim_rocket.json',
          repeat: false,
        fit: BoxFit.fitHeight,
          onLoaded: (composition) {
            Future.delayed(const Duration(milliseconds: 2700), () {
              Navigator.pushReplacementNamed(context, '/onboarding_screen');
            });
          },
        ),
      ),
    );
  }
}
