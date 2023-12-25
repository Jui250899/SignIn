import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signin/routes.dart';


class regidrawer extends StatelessWidget {
  const regidrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSko83aLfknBdvmIIyu7hXpsjxrxKj3vdoySZI0QzLA22t0IKMNRKiBJy9DwGuivWEw54g&usqp=CAU";
    return Drawer(backgroundColor: Colors.orangeAccent,
      child: Container(
        color: Color.fromARGB(255, 247, 142, 4),
        child: ListView(
          children: [
            DrawerHeader(
              
              padding:EdgeInsets.zero,
              child:UserAccountsDrawerHeader(margin:EdgeInsets.zero,accountName: 
              Text("TATA MOTORS ",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black),),
              accountEmail:Text("tataservices@gmail.com",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black)
              ), currentAccountPicture: CircleAvatar(
                 backgroundImage: NetworkImage(imageUrl),
                 backgroundColor: Colors.deepOrange,
              )
            ),
            ),
            ListTile(onTap:() {
               Navigator.pushNamed(context,MyRoute.fetchdataobj);
               
            },
            
            leading:Icon(CupertinoIcons.home),
            iconColor: Colors.white,
            title: Text("Home",style: TextStyle(color:Colors.white),),
            ),
            ListTile(onTap:(){

            },
            leading:Icon(CupertinoIcons.profile_circled),
            iconColor: Colors.white,
            title: Text("Profile",style: TextStyle(color: Colors.white),),
            ),
             ListTile(onTap:(){

            },
            leading:Icon(CupertinoIcons.mail),
            iconColor: Colors.white,
            title: Text("Contact",style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
