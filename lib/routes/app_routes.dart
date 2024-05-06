import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/data/models/CrewModel.dart';
import 'package:space_x/data/repository/crew_repository.dart';
import 'package:space_x/data/webservice/crew_webServices.dart';
import 'package:space_x/features/crew/screens/crew_screen.dart';
import 'package:space_x/features/crew/screens/details_crew_screen.dart';
import 'package:space_x/features/onboarding/onboarding_screen.dart';

import '../core/utils/strings.dart';
import '../features/crew/cubit/crew_space_cubit.dart';

class AppRouter {
  late CrewRepository crewRepository;
  late CrewSpaceCubit crewCubit;

  AppRouter() {
    crewRepository = CrewRepository(CrewWebServices());
    crewCubit = CrewSpaceCubit(crewRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onCrewScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => crewCubit,
            child: const CrewScreen(),
          ),
        );
      // return MaterialPageRoute(builder: (_) => const SplashScreen());

      case onboardingScreenRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case onDetailsCrewScreenRoute:
        final crew =  settings.arguments as CrewModel;
        return MaterialPageRoute(builder: (_) =>  DetailsCrewScreen(crew: crew,));
    }
    return null;
  }
}
