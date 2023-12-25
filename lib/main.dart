import 'package:flutter/material.dart';
import 'package:signin/fetchdata.dart';
//import 'package:signin/mydrawer.dart';
import 'package:signin/myhome.dart';
import 'package:signin/regi.dart';
import 'package:signin/routes.dart';
import 'package:signin/signin.dart';
import 'package:signin/addrecord.dart';
import 'package:signin/viewpage.dart';
void main()
{
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoute.loginroute:(context) => MyLogin(),
        MyRoute.signuproute:(context) => MySignUp(),
        MyRoute.signinroute:(context) => MySignIn(),
        MyRoute.fetchdataobj:(context)=> FetchDataClass(),
        MyRoute.homeroute:(context)=>MyHome(),
        MyRoute.viewobj:(context) => ViewPage(),
      
      }
    );
    
  }
  
}