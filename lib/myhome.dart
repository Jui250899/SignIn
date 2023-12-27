//import 'dart:js';

import 'package:flutter/material.dart';
//import 'package:signin/adddata.dart';
import 'package:signin/mydrawer.dart';
import 'package:signin/addrecord.dart';
import 'package:signin/routes.dart';
//import 'package:signin/regi.dart';
//import 'package:signin/routes.dart';
class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
          preferredSize: Size.fromHeight(200.0), // here the desired height
          child: AppBar(
        backgroundColor: Colors.black,
      //  title: Padding(
          // padding: const EdgeInsets.only(left: 1000),
          // child: ElevatedButton(onPressed:
          // navigateToAdd
          // , style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,
                 
          //         textStyle: TextStyle(color:Colors.orange,
          //         fontSize: 16,
          //         fontWeight: FontWeight.bold)),child: Padding(
          //   padding: const EdgeInsets.only(left:10),
          //   child: Text("New Customer ?",style:TextStyle(color:Colors.black,),),
          // )
          
                      
                    ),
      ),
      
      
     
      body:Container(
        
        width:double.infinity,
        decoration:const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter,colors:[Color.fromARGB(255, 247, 126, 5),Color.fromARGB(255, 241, 184, 61),Color(0xFFFF9800)],
          transform: GradientRotation(3.14/2))
        ),
      
    
      //   title: Text("Sign In"),
        
      // ),
      
      // body: Padding(
        
         padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 100),
      
          
            
            child: Padding(
             padding: const EdgeInsets.all(100.0),
             child: Column(
             
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
             children: 
             [  FractionalTranslation(
              translation: Offset(0.0,-6.590),
              child: Align(
                child: CircleAvatar(
                  
                  radius: 25.0,
                  //maxRadius: 30,
                  backgroundColor:Colors.black,
                  //child: Text("A"),
                ),
                alignment: FractionalOffset(0.5,0.8),
              ),
            ),
              Padding(
                  padding: const EdgeInsets.all(0.0),
                
                 //child: Text("Welcome to TATA MOTORS",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w900,color: Colors.black),),
               ),
               ShaderMask(
          shaderCallback: (Rect bounds) {
            return RadialGradient(
              center: Alignment.topLeft,
              radius: 1.0,
              colors: [Colors.grey.shade500, Colors.grey.shade800,Colors.black,Colors.grey.shade900],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: Text(
            'Welcome to TATA MOTORS',
            style: TextStyle(
              fontSize: 50.0,
              color: Colors.white,
              fontWeight:FontWeight.w900
            ),
          ),
        ),
              //  Padding(
              //      padding: const EdgeInsets.all(7),
              //   child: Image.asset("assets/images/setting.png",fit:BoxFit.fill),
              //   ),
              
               
                  // Center(child: Center(child: Image.asset("assets/images/tata.jpg",fit:BoxFit.fill,
                  // height: 300,width:550),
                  // ))
                  
      //             ,
      //             ),
      //             // Padding(
      //             //   padding: const EdgeInsets.all(8),
      //             //   child: ElevatedButton(onPressed: (){
      //             // Navigator.pushNamed(context,MyRoute.loginroute);
      //             //   }, child: Text("Sign In")),
      //             // )
                  
                ],
              ),
            ),
          ),
         drawer:const MyDrawer()
      );
    
    
    
  }
 
}
