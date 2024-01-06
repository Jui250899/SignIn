import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signin/routes.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSko83aLfknBdvmIIyu7hXpsjxrxKj3vdoySZI0QzLA22t0IKMNRKiBJy9DwGuivWEw54g&usqp=CAU";
    return Drawer(//backgroundColor: Colors.orangeAccent,
      child: Container(
        color: Colors.orange.shade700,
        child: ListView(
          children: [
            DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
              padding:EdgeInsets.zero,
              child:UserAccountsDrawerHeader(decoration: BoxDecoration(color: Colors.black),     margin:EdgeInsets.zero,accountName: 
              Text("TATA MOTORS ",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.orange.shade400),),
              accountEmail:Text("tataservices@gmail.com",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.orange.shade400)
              ), currentAccountPicture: CircleAvatar(
                 backgroundImage: NetworkImage(imageUrl),
                 backgroundColor: Colors.white,
              )
            ),
            ),
            ListTile(onTap:() {
               Navigator.pushNamed(context,MyRoute.loginroute);
               
            },
            
            leading:Icon(CupertinoIcons.arrow_left),
            iconColor: Colors.black,
            title: Text("SignIn",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
            ),
            ListTile(onTap:(){

            },
            // leading:Icon(CupertinoIcons.profile_circled),
            // iconColor: Colors.white,
            // title: Text("Profile",style: TextStyle(color: Colors.white),),
            // ),
            //  ListTile(onTap:(){

            // },
            // leading:Icon(CupertinoIcons.mail),
            // iconColor: Colors.white,
            // title: Text("Contact",style: TextStyle(color: Colors.white),),
             )
          ],
        ),
      ),
    );
  }
}
