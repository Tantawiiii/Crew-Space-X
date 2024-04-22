
import 'package:flutter/material.dart';
import 'package:space_x/features/onboarding/onboarding_screen.dart';

import '../features/onboarding/splash_screen.dart';

class AppRouter {

  static String get splash => "/splash_screen";
  static String get onboarding => "/onboarding_screen";

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    onboarding: (context) => const OnboardingScreen(),
  };

}