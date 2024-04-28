
import 'package:flutter/material.dart';
import 'package:space_x/features/onboarding/splash_screen.dart';

import '../core/utils/strings.dart';

class AppRouter {

  Route? generateRoute(RouteSettings settings){

    switch ( settings.name ) {

      case splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());


    }
    return null;

  }

}