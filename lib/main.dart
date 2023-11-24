//import 'dart:html';

//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:projnew/drawerobj.dart';
import 'package:projnew/loginpage.dart';
import 'package:projnew/myobj.dart';
import 'package:projnew/obj3.dart';
import 'package:projnew/object.dart';
import 'package:projnew/objectFifth.dart';
import 'package:projnew/objectFourth.dart';
import 'package:projnew/routes.dart';

import 'homepage.dart';
import 'objectsec.dart';
import 'profileobj.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => HomePage(),
        MyRoute.loginroute:(context)=>LoginPage(),
        MyObj.Obj:(context) => MyObject(),
        MyObj.Obj2:(context) => NewObject(),
        MyObj.Obj3:(context) => ObjThird(),
        MyObj.obj4:(context) => objectFourth(),
        MyObj.obj5:(context) => objectFifth(),
        MyObj.objdrawer:(context) => objDrawer(),
        MyObj.profileobj:(context) => ProfileObj(),
      },
      debugShowCheckedModeBanner:false,
    );
  }
}
 