import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projnew/myobj.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAHZGuvbEJLVWhQ1I5rdoV8-m6Uu56NFCY5A&usqp=CAU";
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
              padding:EdgeInsets.zero,
              child:UserAccountsDrawerHeader(margin:EdgeInsets.zero,accountName: 
              Text("Nita Ambani",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white),),
              accountEmail:Text("nitaambani09@gmail.com",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white)
              ), currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
              )
            ),
            ),
            ListTile(onTap:() {
              Navigator.pushNamed(context,MyObj.objdrawer);
            },
            leading:Icon(CupertinoIcons.home),
            iconColor: Colors.white,
            title: Text("Home",style: TextStyle(color: Colors.white),),
            ),
            ListTile(onTap:(){
         Navigator.pushNamed(context,MyObj.profileobj);
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
