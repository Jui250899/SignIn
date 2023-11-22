import 'package:flutter/material.dart';
//import 'model.dart';

//import "package:projnew/model.dart";
class MyObject extends StatelessWidget {
  const MyObject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     body: Center(
        child: Column(
          
          children: [
          
            Image.asset("assets/images/new.png",
            height: 500,
            width: 500,
            fit: BoxFit.fitWidth,
          ),
            
          Text("Platinum necklace ",style:TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.black,),)
      
          ],


    
        ),
     ),
      );
     
    
  }
}