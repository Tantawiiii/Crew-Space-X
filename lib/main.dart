import 'package:flutter/material.dart';
import 'package:space_x/routes/app_routes.dart';

void main() {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Space-X App',
      initialRoute: AppRouter.splash,
      routes: AppRouter.routes,
    );
  }
}

