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
             iconTheme: IconThemeData(
    color: Colors.orange, 
      ), 
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
      
      
     
      body:
        Container(

    //       decoration:BoxDecoration(image: const DecorationImage(
    //   image: NetworkImage('data:image/jpeg;base64,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'),
    //   fit: BoxFit.cover,
    // ),),
          
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
               [
               FractionalTranslation(
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
                colors: [Colors.grey.shade900,const Color.fromARGB(255, 30, 29, 29), Color.fromARGB(255, 12, 10, 10),const Color.fromARGB(255, 105, 100, 100),Color.fromARGB(255, 24, 23, 23)],
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
                //      padding: const EdgeInsets.only(left: 100),
                //   child: Image.asset("assets/images/carnew.jpg",fit:BoxFit.fill),
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
// class Clip1clipper extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size) {
//    Path path=Path();
//    path.lineTo(0,size.height);
//    var firstStart=Offset(size.width/5,size.height);
//     var firstEnd=Offset(size.width/2.25,size.height-50.0);


   
//    path.quadraticBezierTo(firstStart.dx,firstStart.dy, firstEnd.dx,firstEnd.dy);
//    var secondStart=Offset(size.width-(size.width/3.24), size.height-105);
//    var secondEnd=Offset(size.width, size.height-10);
//     path.quadraticBezierTo(secondStart.dx,secondStart.dy, secondEnd.dx,secondEnd.dy);
//     path.lineTo(size.width,size.height);
//    return path;
//   }
  
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper)  =>false;

//   }

