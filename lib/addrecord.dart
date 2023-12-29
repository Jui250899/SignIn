import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import "package:http/http.dart" as http;


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signin/routes.dart';
//import 'package:signin/regi.dart';
//import 'package:signin/registration.dart';
//import 'package:signin/routes.dart';

FocusNode FocusNodeName= new FocusNode();
FocusNode FocusNodeRegular= new FocusNode();
FocusNode FocusNodeLastName= new FocusNode();
FocusNode FocusNodeEmail= new FocusNode();
FocusNode FocusNodeVmake= new FocusNode();
FocusNode FocusNodeVno=new FocusNode();
FocusNode FocusNodeDate =new FocusNode();
FocusNode FocusNodePhone= new FocusNode();
FocusNode FocusNodekms= new FocusNode();
FocusNode FocusNodeFuel= new FocusNode();

class MyAdd extends StatefulWidget {
  final Map? vdata;
  const MyAdd({super.key,this.vdata,});

  @override
  State<MyAdd> createState() => _MySignUpState();
  
  
}

class _MySignUpState extends State<MyAdd> {
  TextEditingController namec=TextEditingController();
  TextEditingController lastController=TextEditingController();
   TextEditingController ec=TextEditingController();
   TextEditingController dateController=TextEditingController();
    TextEditingController vnoController=TextEditingController();
     TextEditingController vmakeController=TextEditingController();
      TextEditingController telController=TextEditingController();
       TextEditingController kmsController=TextEditingController();
        TextEditingController regController=TextEditingController();
         TextEditingController frontController=TextEditingController();
          TextEditingController rightController=TextEditingController();
           TextEditingController leftController=TextEditingController();
            TextEditingController rearController=TextEditingController();
             TextEditingController dashboardController=TextEditingController();
              TextEditingController dickeyController=TextEditingController();
               TextEditingController createdatController=TextEditingController();
                TextEditingController updatedatController=TextEditingController();
                 TextEditingController itemController=TextEditingController();
                  TextEditingController eController=TextEditingController();
   bool isEdit=false;
  @override
  void initState() {
   
    super.initState();
    final vdata=widget.vdata;
    if(vdata!=null){
      isEdit=true;
      final name=vdata['name'].toString();
      final last=vdata['last'].toString();
      final email=vdata['email'].toString();
      final date=vdata['date'].toString();
      final Vno=vdata['Vno'].toString();
      final Vmake=vdata['Vmake'].toString();
      final tel=vdata['tel'].toString();
      final kms=vdata['kms'].toString();
      final E=vdata['E'].toString();
       // final item=vdata['item'].toString();
     final regular=vdata['regular'].toString();
       //final front=vdata['front'];
      // // final right=vdata['right'];
      // // final left=vdata['left'];
      // // final rear=vdata['rear'];
      // // final dashboard=vdata['dashboard'];
      // // final dickey=vdata['dickey'];
      



      namec.text=name;
      lastController.text=last;
      ec.text=email;
      dateController.text=date;
      vnoController.text=Vno;
      vmakeController.text=Vmake;
      telController.text=tel;
      kmsController.text=kms;
      eController.text=E;
   //itemController.text=item;
      regController.text=regular;
    // frontController.text=front;
      // rightController.text=right;
      // leftController.text=left;
      // rearController.text=rear;
      // dashboardController.text=dashboard;
      // dickeyController.text=dickey;
      


    }
  }
  bool checkboxValue1= false;
  bool checkboxValue2= false;
  bool checkboxValue3= false;
  bool checkboxValue4= false;
  bool checkboxValue5= false;
  bool checkboxValue6= false;
  bool checkboxValue7= false;
  bool checkboxValue8= false;
  File? _image;
 Future getImage() async{
 
    final image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null) return;
    Uint8List imagebyte=await image!.readAsBytes();
    String _base64=base64.encode(imagebyte);

    print(_base64);
    final imagetemp=File(image.path);
    setState(() {
      this._image=imagetemp;
    });
    print(imagetemp);
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(100.0), // here the desired height
          child: AppBar(
        
        backgroundColor: Colors.black,
         title: Text(
          isEdit?'Edit':'Add data',
      ),
      ),
      ),
    body: 
  SingleChildScrollView(
        
     child:Container(
      
             width:double.infinity,
        decoration:const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter,colors:[Color.fromARGB(255, 247, 126, 5),Color.fromARGB(255, 241, 184, 61),Color(0xFFFF9800)],
          transform: GradientRotation(3.14/2))
        ),
      
              child: Column(
                children:<Widget> [
                  
                    Padding(padding:EdgeInsets.symmetric(horizontal:250,vertical:10),
                    child:
                    TextFormField(
                       controller: namec,
                   
                      decoration: InputDecoration(
                      
                        labelText: "First Name",
                        hintText: "Enter First Name",
                       labelStyle: TextStyle(
                             color: FocusNodeName.hasFocus ? Colors.blue : Colors.grey.shade900
                             ),
                             
                              focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black
        )
      ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
      
                         icon:Icon(Icons.man,color: Colors.black,)
                      ),
                    ),
                    
                    ),
                    Padding(padding:EdgeInsets.symmetric(horizontal:250,vertical:10),
                    child:
                    TextFormField(
                       controller: lastController,
                    
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        hintText: "Enter Last Name",
                         labelStyle: TextStyle(
                             color: FocusNodeLastName.hasFocus ? Colors.blue : Colors.grey.shade900
                             ),
                             
                              focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black
        )
      ),
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
      
                         icon:Icon(Icons.man,color: Colors.black,)
                      ),
                    ),
                    
                    ),Padding(padding:const EdgeInsets.symmetric(horizontal:250,vertical:10),
                    child:
                    TextFormField(
                       controller: ec,
                     
                      // validator:(String? msg){
                      //     if(msg!.isEmpty){
                      //     return "Please Enter Email";
                      //     }return null;
                      // },
                      decoration: InputDecoration(
                        labelText: "Email",
                         labelStyle: TextStyle(
                             color: FocusNodeEmail.hasFocus ? Colors.blue : Colors.grey.shade900
                             ),
                             
                              focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black
        )
      ),
                       hintText:'email@gmail.com',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
                     
                         icon:Icon(Icons.mail,color: Colors.black,)
                      ),
                    ),
                    
                    ),
                  Padding(padding:EdgeInsets.symmetric(horizontal:250,vertical:10),
                    child:
                    TextFormField(
                      controller: dateController,
                    
                      decoration: InputDecoration(
                        labelText: "Date",
                        hintText: "mm/dd/yyyy",
                         labelStyle: TextStyle(
                             color: FocusNodeDate.hasFocus ? Colors.blue : Colors.grey.shade900
                             ),
                             
                              focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black
        )
      ),
                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
                      
                         icon:Icon(Icons.date_range,color: Colors.black,)
                      ),
                    ),
                   
                    ),
                    
                   
                    Padding(
                       padding:EdgeInsets.symmetric(horizontal:250,vertical:10),
                      child: Card(
                        
                                    elevation: 2.9,
                                    shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                    side: const BorderSide(width: 1, color: Colors.black)),
                                color: Colors.white,
                                     child:  Container(
             width:double.infinity,
        decoration:const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter,colors:[Color.fromARGB(255, 241, 184, 61),Color(0xFFFF9800)],
          transform: GradientRotation(3.14/2))
        ),
                                    child: Padding(
                                      padding:EdgeInsets.symmetric(horizontal:30,vertical:10),
                                      child: Column(
                                      
                      children: [
                        Text("Customer details "),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child:TextFormField(
                            controller: vnoController,decoration: InputDecoration(
                          hintText: "Vehicle Number",
                          labelText: "Vehicle Number"  ,
                           labelStyle: TextStyle(
                             color: FocusNodeVno.hasFocus ? Colors.blue : Colors.grey.shade900
                             ),
                             
                              focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black
        )
      ),
                           icon:Icon(Icons.format_list_numbered,color: Colors.black,)                ),)),
                          
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child:TextFormField( controller: vmakeController,decoration: InputDecoration(
                          hintText: "Vehicle Make",
                          labelText: "Vehicle Make" ,
                           labelStyle: TextStyle(
                             color: FocusNodeVmake.hasFocus ? Colors.blue : Colors.grey.shade900
                             ),
                             
                              focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black
        )
      ),
                           icon:Icon(Icons.car_rental,color: Colors.black,)                 ),)),
                          
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child:TextFormField( controller: telController,decoration: InputDecoration(
                         hintText: "0000000000",
                          labelText: "Phone Number"  ,
                           labelStyle: TextStyle(
                             color: FocusNodePhone.hasFocus ? Colors.blue : Colors.grey.shade900
                             ),
                             
                              focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black
        )
      ),
                           icon:Icon(Icons.phone,color: Colors.black,)                ),))
                      ]
                                      )
                                    )
                                    
                      ),
                    ),
                    
                      //child: Text("Vehicle Inventory"),
                    ),
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal:250,vertical:10),
                     child: Card(
                        
                                    elevation: 2.9,
                                    shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                    side: const BorderSide(width: 1, color: Colors.black)),
                                color: Colors.white,
                                     child:  Container(
             width:double.infinity,
        decoration:const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter,colors:[Color.fromARGB(255, 241, 184, 61),Color(0xFFFF9800)],
          transform: GradientRotation(3.14/2))
        ),
                                child: Padding(
                                   padding:EdgeInsets.symmetric(horizontal:50,vertical:10),
                                  child: Column(
                                  
                      children: [
                        Text("Vehicle Inventory:"),
                        
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:50,vertical:10),
                        child:TextFormField( controller: kmsController,decoration: InputDecoration(
                        hintText: "Kms",

                          labelText: "Kilometers"    ,
                           labelStyle: TextStyle(
                             color: FocusNodekms.hasFocus ? Colors.blue : Colors.grey.shade900
                             ),
                             
                              focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black
        )
      ),
                                        ),)
                          ),
                           Padding(
                        padding: const EdgeInsets.symmetric(horizontal:50,vertical:10),
                        child:TextFormField( controller: eController,decoration: InputDecoration(
                        hintText: "fuel",
                          labelText: "fuel" ,
                           labelStyle: TextStyle(
                             color: FocusNodeFuel.hasFocus ? Colors.blue : Colors.grey.shade900
                             ),
                             
                              focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black
        )
      ),   
                                        ),)
                          ),
                          
                          
                            //        Padding(padding: EdgeInsets.fromLTRB(0,0,0,0),
                            //  child:Container(
                             
                    
                            
                            //  child:DropdownButtonExample(),
                              
                            //  )
                            //  )
                      ]
                                  )
                                )
                                
                      ),
                    ),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:250,vertical:10),
                      child: Card(
                        elevation: 2.9,
                                      shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2),
                                      side: const BorderSide(width: 1, color: Colors.black)),
                                  color: Colors.white,
                                       child:  Container(
                                 width:double.infinity,
                            decoration:const BoxDecoration(
                              gradient: LinearGradient(begin: Alignment.topCenter,colors:[Color.fromARGB(255, 241, 184, 61),Color(0xFFFF9800)],
                              transform: GradientRotation(3.14/2))
                            ),
                      
                                      
                      child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal:50,vertical:10),
                         child:Column(children: [
                      Text("Select Items"),
                       
                             CheckboxListTile(
                                         value: checkboxValue1,
                                          activeColor: Colors.black,
                                         onChanged: (bool? value) {
                                           setState(() {
                                             checkboxValue1 = value!;
                                           });
                                         },
                                         title: const Text('Tom & Tommy'),
                                        
                                       ),
                           
                           
                         
                              const Divider(height: 0),
                              CheckboxListTile(
                                value: checkboxValue2,
                                 activeColor: Colors.black,
                                onChanged: (bool? value) {
                                  setState(() {
                                    checkboxValue2 = value!;
                                  });
                                },
                                title: const Text('Stepney'),
                                
                                
                               
                              ),
                              const Divider(height: 0),
                              CheckboxListTile(
                                value: checkboxValue3,
                                 activeColor: Colors.black,
                                onChanged: (bool? value) {
                                  setState(() {
                                    checkboxValue3 = value!;
                                  });
                                },
                                title: const Text('Tool kit'),
                                
                                
                              ),
                                const Divider(height: 0),
                              CheckboxListTile(
                                value: checkboxValue4,
                                 activeColor: Colors.black,
                                onChanged: (bool? value) {
                                  setState(() {
                                    checkboxValue4 = value!;
                                  });
                                },
                                title: const Text('Tape'),
                                
                                
                              ),
                              const Divider(height: 0),
                                const Divider(height: 0),
                              CheckboxListTile(
                                value: checkboxValue5,
                                 activeColor: Colors.black,
                                onChanged: (bool? value) {
                                  setState(() {
                                    checkboxValue5 = value!;
                                  });
                                },
                                title: const Text('Battery'),
                                
                                
                              ),
                                const Divider(height: 0),
                              CheckboxListTile(
                                value: checkboxValue6,
                                 activeColor: Colors.black,
                                onChanged: (bool? value) {
                                  setState(() {
                                    checkboxValue6 = value!;
                                  });
                                },
                                title: const Text('Mirror LH'),
                                
                                
                              ),
                                const Divider(height: 0),
                              CheckboxListTile(
                                value: checkboxValue7,
                                 activeColor: Colors.black,
                                onChanged: (bool? value) {
                                  setState(() {
                                    checkboxValue7= value!;
                                  });
                                },
                                title: const Text('Mirror RH'),
                                
                                
                              ),
                              const Divider(height: 0),
                              CheckboxListTile(
                                value: checkboxValue8,
                                 activeColor: Colors.black,
                                onChanged: (bool? value) {
                                  setState(() {
                                    checkboxValue8 = value!;
                                  });
                                },
                                title: const Text('Maths no fields'),
                                
                                
                              ),
                              
                               ]
                                     
                         )
                                    
                          
                                  ),
                          ),
                        ),
                        
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal:250,vertical:10),
                      child: Card(
                        elevation: 2.9,
                                      shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2),
                                      side: const BorderSide(width: 1, color: Colors.black)),
                                  color: Colors.white,
                                       child:  Container(
                                 width:double.infinity,
                            decoration:const BoxDecoration(
                              gradient: LinearGradient(begin: Alignment.topCenter,colors:[Color.fromARGB(255, 241, 184, 61),Color(0xFFFF9800)],
                              transform: GradientRotation(3.14/2))
                            ),
                               child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal:50,vertical:10),
                         child:Column(children: [
                      Text("Customer Complaint/Task To Do :"),
                      TextFormField(
                        controller: regController,
                        minLines: 1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          
                          hintText: "Regular:",
                          labelText: "Regular",
                           labelStyle: TextStyle(
                             color: FocusNodeRegular.hasFocus ? Colors.blue : Colors.grey.shade900
                             ),
                             
                              focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black
        )
      ),
                          
                        ),
                      )
                         ]
                
    )
     )
      )
              )
     
                                      
    ) ,
    
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal:250,vertical:10),
                      child: Card(
                        elevation: 2.9,
                                      shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2),
                                      side: const BorderSide(width: 1, color: Colors.black)),
                                  color: Colors.white,
                                       child:  Container(
                                 width:double.infinity,
                            decoration:const BoxDecoration(
                              gradient: LinearGradient(begin: Alignment.topCenter,colors:[Color.fromARGB(255, 241, 184, 61),Color(0xFFFF9800)],
                              transform: GradientRotation(3.14/2))
                            ),
                               child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal:50,vertical:10),
                         child:Column(children: [
                           _image==null ? Container():
                          Image.asset('assets/images/mynew.jpg'),
                         
                  //     Text("Vehicle Images"),
                 
                  //  ?Image.asset("assets/images/mynew.jpg",width: 100,height: 100,fit:BoxFit.cover)
                  //  :Text("Sorry failed to upload file"),
                      
                    
                      customButton(title: 'Pick image from device',icon: Icons.image_outlined,onClick: getImage,

                      
                      ),        
       
                           
    ]
      )
    )
    )
    )
    ),    
           ElevatedButton(onPressed:(){isEdit?updateData(namec.text.toString(),lastController.text.toString(),ec.text.toString(),
          dateController.text.toString(),vnoController.text.toString(),vmakeController.text.toString(),
          telController.text.toString(),kmsController.text.toString(),eController.text.toString(),regController.text.toString()):SubmitData(namec.text.toString(),lastController.text.toString(),ec.text.toString(),
          dateController.text.toString(),vnoController.text.toString(),vmakeController.text.toString(),
          telController.text.toString(),kmsController.text.toString(),eController.text.toString(),itemController.text.toString(),frontController.text.toString(),regController.text.toString());},
          style: ElevatedButton.styleFrom(backgroundColor:Colors.black),
           child: Text(isEdit?'Edit':'Add',style: TextStyle(fontSize: 15),))    
    
    //  ElevatedButton(onPressed:SubmitData(),
                        
    //                     , child: Text("Register")),
    ]
              )
     )
      )
    
    );

     
    
   
    
    
  }
  Future<void>SubmitData(String name,
      String last,
      String email,
      String date,
      String Vno,
      String Vmake,
      String tel,
      String kms,
      String E,
      String item,
      String front,
      String regular
      )async
{
  

 
//   final name=namec.text;
//   final last=lastController.text;
//   final email=ec.text;
//   final date=dateController.text;
//   final Vno=vnoController.text;
//   final Vmake=vmakeController.text;
//   final tel=telController.text;
//   final kms=kmsController.text;
// final ce=eController.text;
  // final citem=itemController.text;
   //inal creg=regController.text;
  //  final cfront=frontController.text;
  //  final cright=rightController.text;
  //  final cleft=leftController.text;
  //  final crear=rearController.text;
  //  final cdash=dashboardController.text;
  //  final cdickey=dickeyController.text;

   final body={
   
    "name":name,
    "last":last,
    "email":email,
    "date":date,
    "Vno":Vno,
    "Vmake":Vmake,
    "tel":tel,
    "kms":kms,
    "E":E,
    "items":item,
     "regular":regular,
     "front":front,
    // "right":cright,
    // "left":cleft,
    // "rear":crear,
    // "dashboard":cdash,
    // "dickey":cdickey,


   };
   print(body);
   print(name);
   const url='http://192.168.1.4:8000/api/insertdata';
   final uri=Uri.parse(url);
   final response =await http.post(uri,body:jsonEncode(body),
   headers:{'Content-type':'application/json'},
   );
   final message = jsonDecode(response.body);
    // print(message);

    if (message['Registered'] == "Successfully") {
      print('added successfully');
      Navigator.pushNamed(context,MyRoute.fetchdataobj);
    } else {
      print('failed');
    }

}
Future<void>updateData(
      String name,
      String last,
      String email,
      String date,
      String Vno,
      String Vmake,
      String tel,
      String kms,
      String E,
      //String item,
     // String front,
      String regular)async{
  final vdata=widget.vdata;
  if(vdata==null){
    print('you can not update without todo data');
    return;
  }
 final id=vdata['id'].toString();
 
   final body={
   
    "name":name,
    "last":last,
    "email":email,
    "date":date,
    "Vno":Vno,
    "Vmake":Vmake,
    "tel":tel,
    "kms":kms,
    "E":E,
   // "items":item,
    "regular":regular,
    // "front":front,
    // "right":right,
    // "left":left,
    // "rear":rear,
    // "dashboard":dashboard,
    // "dickey":dickey,


   };
   final url='http://192.168.1.4:8000/api/update/$id';
   print(url);
   final uri=Uri.parse(url);
   final response =await http.put(uri,body:jsonEncode(body),
   headers:{'Content-type':'application/json'},
   );
   print(id);
   print(response.statusCode);
   print(response.body);
   if(response.statusCode==200){
    print("updation success");
   showSuccessMessage("data updated successfully");

   }
   else{
    print("failed");
    showErrorMessage("data updation failed");
   }
}void showSuccessMessage(String msg){
  final snackbar=SnackBar(content: Text(msg));
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
void showErrorMessage(String msg){
  final snackbar=SnackBar(content: Text(msg,style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,);
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

}
Widget customButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}){
  return Container(
    width:280,
    child:ElevatedButton(onPressed:onClick,child: Row(
      children: [
        Icon(icon),
        Text((title)),
      ],
    ),)
  );
}

// class DropdownButtonExample extends StatefulWidget {
//   const DropdownButtonExample({super.key});

// @override
//    State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
//  }

//  class _DropdownButtonExampleState extends State<DropdownButtonExample> {
//    String dropdownValue = list.first;

//    @override
// Widget build(BuildContext context) {
//      return Container(
     
//        child: DropdownButton<String>(
//          value: dropdownValue,
//          icon: const Icon(Icons.arrow_drop_down_rounded),
      
//          style: const TextStyle(color: Colors.black),
       
//          onChanged: (String? value) {
         
//            setState(() {
//              dropdownValue = value!;
//            });
//          },
//          items: list.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//              value: value,
//              child: Text(value),
//            );
//          }).toList(),
//        ),
              
//      );
             
              
//   }
 





// }