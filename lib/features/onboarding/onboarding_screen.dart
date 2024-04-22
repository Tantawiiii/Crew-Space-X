import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_x/core/utils/colors_code.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back_spaceX.jpeg"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 52.0, right: 24.0, bottom: 24.0, left: 24.0),
          child: ListView(
            children: [
              Text(
                "Expedition\nEarth 1.0",
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  color: ColorsCode.whiteColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 52.0,
                  shadows: const [
                    Shadow(
                      color: Colors.blue,
                      blurRadius: 4.0,
                      offset: Offset(5.0, 2.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              Container(
                padding: const EdgeInsets.all(8.0),
                height: 157,
                width: 50,
                decoration: BoxDecoration(
                  color:  ColorsCode.whiteColor300.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
