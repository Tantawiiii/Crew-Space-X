import 'package:flutter/material.dart';
import 'package:space_x/routes/app_routes.dart';

void main() {

  runApp(const SpaceX());

}

class SpaceX extends StatelessWidget {
  const SpaceX({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,

    );
  }
}

