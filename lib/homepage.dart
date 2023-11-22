import "package:flutter/material.dart";
import "package:projnew/drawer.dart";
//import "package:projnew/loginpage.dart";
import "package:projnew/routes.dart";
String? name="";
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //const HomePage({super.key});
bool changedButton=false;
final _formkey=GlobalKey<FormState>();
moveToNext(BuildContext context)async{
final form=_formkey.currentState;
if(form !=null && form.validate())
  {
                           
                           setState(() {
                                 changedButton=true;
                           });
                            await Future.delayed(const Duration(seconds:1));
                          await  Navigator.pushNamed(context,MyRoute.loginroute);
                          setState(() {
                            changedButton=false;
                          });
  
}
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            children: [
              Text("Login Page",style: TextStyle(color: const Color.fromARGB(255, 32, 3, 3),fontWeight:FontWeight.bold,
              fontSize: 30),)
            ],
          ),
        ),
      ),
      body: Center(
        child:Form(
        key: _formkey,
        child:Column(
          children: [
            Column(
              children:[
                Image.asset("assets/images/logo.png",
                       height: 300,
                       width: 1200,
                       fit: BoxFit.fitWidth,
                       alignment: Alignment.center,
             ) ,
             
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("Welcome  $name to VRM ",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 199, 122, 148)),
                       
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter UserName",
                    labelText: "UserName",
                    icon: Icon(
                      Icons.man,
                    ),
                  ),
                   validator: (String? value) {
    if(value !=null && value.isEmpty)
    {
return "Please enter Username";
    }
    else {
      return null;
    }
   } ,
       
                  onChanged: (Value){
                    name=Value;
                     setState((){});
                  },
                 
            ),
               ),
             ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  labelText: "Password",
                  icon: Icon(
                    Icons.password,
                  )
                ),
                validator: (String? value) {
                  if(value !=null && value.isEmpty)
                  {
              return "Please enter Password";
                  }
                  else if(value!=null && value.length<6) {
                    return "Password is too short";
                  }
                  else {
                    return null;
                  }
                 }, ),
              ),
   SizedBox(
                            height: 50,
                         ),
                         Material(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(changedButton?50:8),
                          child: ElevatedButton(
                            onPressed: ()=>moveToNext(context),
                            child: AnimatedContainer(duration: Duration(milliseconds: 10),
                            width:changedButton?100:100,
                            height: 50,
                            alignment: Alignment.center,
                            child:changedButton
                              ? Icon(
                              Icons.done,
                              color: Colors.white,

                            )
                            :Text("login",style: TextStyle(color: Colors.white,
                            fontWeight:FontWeight.bold,fontSize: 20)
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: changedButton?BoxShape.circle:BoxShape.rectangle,
                            ),
                            )
                            )
                         )
                        /* ElevatedButton(
                          onPressed: () =>moveToNext(context),
                          child: Text("login"),
                          style: TextButton.styleFrom(),
                          )*/
           /* Padding(
              
        
             padding: const EdgeInsets.all(8.0),
             child: Material(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(6),
             // child:InkWeltexl(
               // onTap:(){(Navigator.pushNamed(cont),
            
            child:AnimatedContainer(
                duration: Duration(seconds:1),
               
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(children: [
                    
                    Text("Login",style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold,),),
                  
                  ],
                    
                  ),
                )
              ]),
                ),
              //);}
             // ),
           ))*/

              ],
            )
                  
          ],
        ),
        ),

      ),
    drawer:MyDrawer()
    );

  
  
  }
}