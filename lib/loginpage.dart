//import "dart:html";

import "package:flutter/material.dart";
//import "package:projnew/drawer.dart";
import "package:projnew/prodWidget.dart";
import "model.dart";
import "homepage.dart";
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        title: Text("Welcome $name to VRM Jewellers",style:TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold)),
      ),
      body:ListView.builder(itemCount:Model.item.length,
      itemBuilder: (context, index) {
        return ProductWidget(item:Model.item[index],item2: Model.item2[index],item3: Model.item3[index],item4:Model.item4[index],item5:Model.item5[index],);
      },
     ),

  );
}
}

       

        