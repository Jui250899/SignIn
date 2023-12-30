import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:signin/addrecord.dart';
import 'package:signin/regidrawer.dart';

import 'package:signin/routes.dart';
TextEditingController pw=TextEditingController();
TextEditingController ec=TextEditingController();
TextEditingController cpw=TextEditingController();
TextEditingController namec=TextEditingController();
FocusNode FocusNodeEmail= new FocusNode();
FocusNode FocusNodePassword= new FocusNode();
bool _isObscure = true;
class MyLogin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyFormState();
  }

}
class MyFormState extends State<MyLogin>{
  
  var _MyFormkey=GlobalKey<FormState>();
 moveToNext(BuildContext context)async{
final form=_MyFormkey.currentState;
if(form !=null && form.validate())
  {
   {                    
                            await Future.delayed(const Duration(seconds:1));
                     
           // Navigator.pushNamed(context,MyRoute.homeroute);
       //   Navigator.pushNamed(context,MyRoute.loginroute);
                              
                         
// }

}}
 }
Future<void>loginscreen(String email,String password)async{
  

 final  url="http://192.168.1.4:8000/api/signIn";
 final uri=Uri.parse(url);
 final body={"email":email,"password":password};
 final response=await http.post(uri,body:jsonEncode(body),
headers:{'Content-Type':'application/json'},
 );
final msg=jsonDecode(response.body);
print(msg['Login']);
if(msg['Login']=='successfully'){

   Navigator.pushNamed(context,MyRoute.fetchdataobj);
}
else{
  showErrorMessage('Please enter valid Data');
}

}
void showErrorMessage(String msg){
  final snackbar=SnackBar(content: Text(msg,style:const TextStyle(color: Colors.white),),backgroundColor: Colors.red,);
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar:AppBar(
      backgroundColor: Colors.black,
      ),
                    
        
      
        body:  Container(
             width:double.infinity,
        decoration:const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter,colors:[Color.fromARGB(255, 247, 126, 5),Color.fromARGB(255, 241, 184, 61),Color(0xFFFF9800)],
          transform: GradientRotation(3.14/2))
        ),
            child:Form(
            key:_MyFormkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
            
                child: Container(
                  decoration:BoxDecoration(
                   
                    borderRadius:BorderRadius.only(topLeft: Radius.circular(60),
                    ),),
                  
                    child: Column(
                      children: [
                        Container(
                          padding:EdgeInsets.symmetric(horizontal:100,vertical: 100),
                          decoration: BoxDecoration(
                           
                            
                           
                            )
                          ),
                        
                           Padding(padding:EdgeInsets.symmetric(horizontal:350),
                            child: TextFormField(cursorColor: Colors.black,
                                                controller: ec,
                                                validator:(String? msg){
                            if(msg!=null && msg.isEmpty){
                            return "Please Enter Email";
                            }
                            RegExp Emailex=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                             if(!Emailex.hasMatch(msg!)){
                                              return "Please Enter A Valid Email";
                                             }
                            return null;
                            
                                                },
                                                  decoration: InputDecoration(hoverColor: Colors.black,
                                                  labelText: "Email",
                                                  hintText: "Aspirewebs101@gmail.com",
                                                  labelStyle: TextStyle(
                             color: FocusNodeEmail.hasFocus ? Colors.blue : Colors.grey.shade900
                             ),
                             
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
          color: Colors.black
        )
      ),
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                                 
                                                   icon:Icon(Icons.mail,color: Colors.black,),
                                                 fillColor: Colors.grey
                                                ),
                                              ),
                          ),
                          
                            Padding(padding:EdgeInsets.symmetric(horizontal:330),
                             child: Padding(
                               padding: const EdgeInsets.all(15.0),
                               child: TextFormField(
                                controller: pw,
                                 obscureText: _isObscure,
                                              validator:(String? msg){
                                if(msg!.isEmpty){
                                return "Please Enter Password";
                                }
                                else if(msg.length<6){
                                  return "Password is too short";
                                }
                                return null;
                                               },
                                                 
                                                  decoration: InputDecoration(
                                                   
                                                   labelText:"Password",
                               hintText: "Password",
                                labelStyle: TextStyle(
                             color: FocusNodePassword.hasFocus ? Colors.blue : Colors.grey.shade900
                             ),
                             
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Colors.black
        )
      ),
                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                               icon: Icon(
                                 Icons.lock,
                                color: Colors.black,
                               ),
                                                    suffix: IconButton(
                                                      icon: _isObscure
                                                          ? const Icon(
                                                              Icons.visibility_off,
                                                              color: Colors.grey,
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
                                            ),
                             ),
                          
                         ),
            Padding(
                      padding: const EdgeInsets.symmetric(horizontal:200),
                      child: ElevatedButton(
                              onPressed: ()=>
                              loginscreen(ec.text.toString(), pw.text.toString()),
                              //moveToNext(context),
                              
                             //Navigator.pushNamed(context,loginscreen(ec.text.toString(), pw.text.toString()));
                            
                              child: Text("Login"),
                            ),
                    ),
                      Padding(padding:EdgeInsets.symmetric(horizontal:400),
                    child:
                   Row(
                     children: [
                       Text(
                         
                         "Do not Have an Account ?  ",
                        style: TextStyle(fontWeight: FontWeight.w800),
                         
                       
                          ),Padding(
                            padding: const EdgeInsets.all(10.0),
                             child: ElevatedButton( child: Text("Sign Up"),onPressed: (){

Navigator.pushNamed(context,MyRoute.signinroute);
                          
   },style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
               
                textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold)),),  
                      
                          )
                     ],
                   ),
                    ),
            ]
            
                    
                       
                          
                        )
                      
                    ),
                    )
                    
                    
                    ),
                    
                  
                     
                        
              
            
                )
              
        // drawer:const regidrawer(),
       
   
    );
  }
 
}



