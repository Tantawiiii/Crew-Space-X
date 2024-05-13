import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/no_internet.png",width: 350,height: 350,),
            const Text(
              "Can't connect .. check internet...",
              style: TextStyle(
                fontSize: 22,
                color: Colors.amberAccent,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ) ,
      ),
    );
  }
}
