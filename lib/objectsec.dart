import 'package:flutter/material.dart';
//import 'model.dart';

//import "package:projnew/model.dart";
class NewObject extends StatelessWidget {
  const NewObject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     body: Center(
        child: Column(
          
          children: [
          
            Image.asset("assets/images/rings.png",
            height: 300,
            width: 300,
            fit: BoxFit.fitWidth,
          ),
            
          Text("Golden ring",style:TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.black,),)
      
          ],


    
        ),
     ),
      );
     
    
  }
}