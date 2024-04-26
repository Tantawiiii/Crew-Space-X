import 'package:flutter/material.dart';
import 'package:space_x/routes/app_routes.dart';

void main() {

  runApp( SpaceX(appRouter: AppRouter(),));

}

class SpaceX extends StatelessWidget {
  const SpaceX({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,

    );
  }
}

