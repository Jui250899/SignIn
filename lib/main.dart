import 'package:flutter/material.dart';
import 'package:signin/addlabour.dart';
import 'package:signin/addproduct.dart';
import 'package:signin/fetchcustomer.dart';
import 'package:signin/fetchdata.dart';
import 'package:signin/fetchproduct.dart';
//import 'package:signin/mydrawer.dart';
import 'package:signin/myhome.dart';
import 'package:signin/fetchlabour.dart';
import 'package:signin/login.dart';
import 'package:signin/routes.dart';
import 'package:signin/signup.dart';
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
        MyRoute.addroute:(context) => MyAdd(),
        MyRoute.signinroute:(context) => MySignIn(),
        MyRoute.fetchdataobj:(context)=> FetchDataClass(),
        MyRoute.homeroute:(context)=>MyHome(),
        MyRoute.viewobj:(context) => ViewPage(),
        MyRoute.fetchlabourobj:(context) => MyLabour(),
        MyRoute.addlabourobj:(context) => MyLabourAdd(),
        MyRoute.fetchprod:(context) => MyProduct(),
        MyRoute.addprod:(context) => AddProduct(),
       //MyRoute.fetchcustomer:(context) => fetchcustomer()
      
      }
      
    );
    
  }
   
}
