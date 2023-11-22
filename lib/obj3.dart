import 'package:flutter/material.dart';
//import 'model.dart';

//import "package:projnew/model.dart";
class ObjThird extends StatelessWidget {
  const ObjThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     body: Center(
        child: Column(
          
          children: [
          
            Image.asset("assets/images/bangles.png",
            height: 300,
            width: 300,
            fit: BoxFit.fitWidth,
          ),
            
          Text("Golden Bangles",style:TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.black,),)
      
          ],


    
        ),
     ),
      );
     
    
  }
}