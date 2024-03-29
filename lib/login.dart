import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:signin/addrecord.dart';
import 'package:signin/regidrawer.dart';
import 'dart:ui' as ui;

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

  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      'hello-html',
      (int viewId) => IFrameElement()
        ..width = '640'
        ..height = '360'
        ..src = 'https://www.youtube.com/embed/xg4S67ZvsRs'
        ..style.border = 'none');

    return Scaffold(
      
      appBar:AppBar(
      backgroundColor: Colors.black,
      ),
                    
        
      
        body:  Container(
             width:double.infinity,
        decoration:const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter,colors:[Colors.white,Colors.white24,Colors.white30],
          transform: GradientRotation(3.14/2))
        ),
            child:Form(
            key:_MyFormkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
            
                child: Container(
                  // decoration:BoxDecoration(
                   
                  //   //borderRadius:BorderRadius.only(topLeft: Radius.circular(0),
                  //   ),),
                  
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(350,150,350,200),
                      child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                        clipBehavior:Clip.antiAliasWithSaveLayer,
                      
                        elevation: 100,
                         child: Container(
                       
                  decoration: BoxDecoration(
                     //borderRadius: BorderRadius.circular(100.0),
                    gradient: LinearGradient(begin: Alignment.topCenter,colors:[Color.fromARGB(255, 12, 201, 167),Color.fromARGB(255, 9, 226, 230),Colors.cyanAccent.shade700],
                    transform: GradientRotation(3.14/2))
                  ),
                
                        child: Column(
                          children: [
                          //  const HtmlElementView(viewType: 'hello-html', creationParams: {
                          //   'src': 'https://www.youtube.com/watch?v=KAJAaWWsXKg'
                          //  }, ),
                            Container(
                              padding:EdgeInsets.symmetric(horizontal:100,vertical: 50),
                              decoration: BoxDecoration(
                               
                                
                               
                                )
                              ),

                              //Image.network('https://upload.wikimedia.org/wikipedia/commons/4/41/Sunflower_from_Silesia2.jpg'),
                            
                               Padding(padding:EdgeInsets.symmetric(horizontal:100),
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
                              
                                Padding(padding:EdgeInsets.symmetric(horizontal:85),
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
                          padding: const EdgeInsets.fromLTRB(125,10,100,0),
                          child: ElevatedButton(
                                  onPressed: ()=>
                                  loginscreen(ec.text.toString(), pw.text.toString()),
                                  //moveToNext(context),
                                  
                                 //Navigator.pushNamed(context,loginscreen(ec.text.toString(), pw.text.toString()));
                                
                                  child: Text("Login",style: TextStyle(color:Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                                ),
                        ),
                          Padding(padding:EdgeInsets.symmetric(horizontal:140,vertical: 50),
                        child:
                                         Row(
                         children: [
                           Text(
                             
                             "Do not have an Account ?  ",
                            style: TextStyle(fontWeight: FontWeight.w800),
                             
                           
                              ),Padding(
                                padding: const EdgeInsets.all(15.0),
                                 child: ElevatedButton( child: Text("Sign Up",style: TextStyle(color: Colors.white),),onPressed: (){
                      
                      Navigator.pushNamed(context,MyRoute.signinroute);
                              
                         },style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                                     
                                      textStyle: TextStyle(
                                      fontSize: 12,
                                      )),),  
                          
                              )
                         ],
                                         ),
                        ),
                                  ]
                                  
                        
                           
                              
                            ),
                      ),
                    )
                      
                    ),
                    )
                    
                    
                    ),
                    
                  
                     
                        
              
            
                )
              
        // drawer:const regidrawer(),
       
   
    )
    );
  }
 
} 

