import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class objectFourth extends StatelessWidget {
  const objectFourth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          children: [
            Image.asset("assets/images/platring.png",
              height:300,
              width: 300,
              fit: BoxFit.cover,
            ),
            Text("Platinum Ring ",style: TextStyle(fontSize: 40),)
          ],
        ),
      )
      ,
    );
  }
}