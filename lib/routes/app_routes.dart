import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/cuibt/crew_space_x_cubit.dart';
import 'package:space_x/data/repository/crew_repository.dart';
import 'package:space_x/data/webservice/crew_webServices.dart';
import 'package:space_x/features/crew/crew_screen.dart';
import 'package:space_x/features/onboarding/onboarding_screen.dart';
import 'package:space_x/features/onboarding/splash_screen.dart';

import '../core/utils/strings.dart';

class AppRouter {
  late CrewRepository crewRepository;
  late CrewSpaceXCubit crewCubit;

  AppRouter() {
    crewRepository = CrewRepository(CrewWebServices());
    crewCubit = CrewSpaceXCubit(crewRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => crewCubit,
            child: const CrewScreen(),
          ),
        );
      // return MaterialPageRoute(builder: (_) => const SplashScreen());

      case onboardingScreenRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case onCrewScreenRoute:
        return MaterialPageRoute(builder: (_) => const CrewScreen());
    }
    return null;
  }
}
