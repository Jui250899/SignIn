import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class objectFifth extends StatelessWidget {
  const objectFifth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/nosepin.png",
              height:300,
              width:300,
              fit: BoxFit.cover,),
              Text(" Golden Nosepin ",style:TextStyle(fontSize: 50))
            ],
          ),
        ),
      ),
    );
  }
}