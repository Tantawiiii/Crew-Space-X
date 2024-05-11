import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            const Text(
              "Can't connect .. check internet...",
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset("assets/images/no_internet.png"),
          ],
        ) ,
      ),
    );
  }
}
