
import 'package:flutter/material.dart';
import 'package:space_x/features/onboarding/splash_screen.dart';

class AppRouter {

  Route? generateRoute(RouteSettings settings){

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
    return null;

  }

}