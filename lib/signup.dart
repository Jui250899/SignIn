import 'package:flutter/material.dart';
import 'package:signin/regi.dart';
import 'package:signin/addrecord.dart';
import 'package:signin/routes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
TextEditingController pw=TextEditingController();
TextEditingController ec=TextEditingController();
TextEditingController cpw=TextEditingController();
TextEditingController namec=TextEditingController();

bool _isObscure = true;
var _MyFormKey=GlobalKey<FormState>();
class MySignIn extends StatefulWidget {
  const MySignIn({super.key});

  @override
  State<MySignIn> createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignIn> {
  Future<void> signUpscreen(String name,
      String email, String password, String confirm) async {
    
    final body = {
      'name':name,
      'email': email,
      'password': password,
      'confirm': confirm
    };
    //print(email);
    //print(password);
    const url = 'http://192.168.1.4:8000/api/signUp';
    //const url = 'http://192.168.1.4:8000/api/signin';
    //print(url);
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    // final message = jsonDecode(response.body);
    // print(message);

    if (response.body == "Successfully Registerd") {
      print('signUp successfully');
      Navigator.pushNamed(context,MyRoute.loginroute);
    } else {
      print('failed');
    }
  }
   
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Sign Up") ,
      ),
    body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:0,vertical:0),
          child: Container(
            //width:300,
             width:double.infinity,
        decoration:const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter,colors:[Color.fromARGB(255, 247, 126, 5),Color.fromARGB(255, 241, 184, 61),Color(0xFFFF9800)],
          transform: GradientRotation(3.14/2))
        ),
            child:Form(key:_MyFormKey,              
               child: Padding(padding:EdgeInsets.all(8.0),
                child:Column(
                  children:<Widget>[
                      
                  Center(
                    //child: Center(child: Image.asset("assets/images/newimage.jpg",
                 // fit: BoxFit.fill,
                // height: 300,width:800),
                // )
                  
                  
                  ),
                    Padding(padding:EdgeInsets.fromLTRB(250,160,250,0),
                    child:
                TextFormField(
                  controller: namec,
                  validator:(String? msg){
                      if(msg!.isEmpty){
                      return "Please Enter First Name";
                      }return null;
                  },
                  decoration: InputDecoration(
                  
                    labelText: "First Name",
                    hintText: "Enter First Name",
                   
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),

                     icon:Icon(Icons.person,color: Colors.black,)
                  ),
                ),
                
                ),
                 
               Padding(padding:EdgeInsets.fromLTRB(250,20,250,0),
                child:
                TextFormField(
                  controller: ec,
                  validator:(String? msg){
                      if(msg!.isEmpty){
                      return "Please Enter Email";
                      }
                       RegExp Emailex=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                   if(!Emailex.hasMatch(msg!)){
                    return "Please Enter A Valid Email";
                   }
                      return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Aspirewebs101@gmail.com",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
                 
                     icon:Icon(Icons.mail,color: Colors.black,)
                  ),
                ),
                
                ),
              
                Padding(padding:EdgeInsets.fromLTRB(250,20,250,0),
                child:
               TextFormField(
                controller: pw,
                 validator:(String? msg){
                      if(msg!.isEmpty){
                      return "Please Enter Password";
                      }
                      else if(msg.length<6){
                        return "Password is too short";
                      }
                      return null;
                  },
obscureText: _isObscure,
decoration: InputDecoration(
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(2),
     ),
 label: Text("Password"),
  hintText: "Password",
  icon: Icon(
    Icons.lock,
    color: Colors.black,
  ),
  suffix: IconButton(
    padding: const EdgeInsets.all(0),
    iconSize: 20.0,
    icon: _isObscure
        ? const Icon(
            Icons.visibility_off,
            color: Colors.black,
          )
        : const Icon(
            Icons.visibility,
            color: Colors.black,
          ),
    onPressed: () {
      setState(() {
        _isObscure = !_isObscure;
      });
    },
  ),
),
               )
               
                ),
                Padding(padding:EdgeInsets.fromLTRB(250,20,250,0),
                child:
                TextFormField(
                  controller: cpw,
                  //obscureText: true,
                  validator:(String? msg){
                      if(msg!=pw.text){
                        return "Password is not same as above";
                      }
                      return null;
                  },
                 obscureText: _isObscure,
decoration: InputDecoration(
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(2),
     ),
 label: Text("Confirm Password"),
  hintText: "Confirm Password",
  icon: Icon(
    Icons.lock,
    color: Colors.black,
  ),
  suffix: IconButton(
    padding: const EdgeInsets.all(0),
    iconSize: 20.0,
    icon: _isObscure
        ? const Icon(
            Icons.visibility_off,
            color: Colors.black,
          )
        : const Icon(
            Icons.visibility,
            color: Colors.black,
          ),
    onPressed: () {
      setState(() {
        _isObscure = !_isObscure;
      });
    },
  ),
),
               )
               
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(child: Text("Sign Up"),onPressed:(){
                    if(_MyFormKey.currentState!.validate()){
                      signUpscreen(namec.text.toString(),ec.text.toString(),pw.text.toString(),cpw.text.toString());};
                      
                   },style: ElevatedButton.styleFrom(backgroundColor: Colors.black)),
                )
               
    
            

                  ]
    )
    )
    )
    )
    )
    );
    
  }
}