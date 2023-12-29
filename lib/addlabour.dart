import 'dart:convert';
//import 'dart:io';
//import 'dart:typed_data';
import "package:http/http.dart" as http;


import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:signin/routes.dart';

//import 'package:signin/regi.dart';
//import 'package:signin/registration.dart';
//import 'package:signin/routes.dart';

FocusNode FocusNodeprice= new FocusNode();

FocusNode FocusNodename= new FocusNode();


class MyLabourAdd extends StatefulWidget {
  final Map? ldata;
  const MyLabourAdd({super.key,this.ldata,});

  @override
  State<MyLabourAdd> createState() => _MySignUpState();
  
  
}

class _MySignUpState extends State<MyLabourAdd> {
  TextEditingController labournamecontroller=TextEditingController();
  TextEditingController labourpricecontroller=TextEditingController();
   
   bool isEdit=false;
  @override
  void initState() {
   
    super.initState();
    final ldata=widget.ldata;
    if(ldata!=null){
      isEdit=true;
      final lname=ldata['l_name'];
      final lprice=ldata['l_price'];
      
      labournamecontroller.text=lname;
      labourpricecontroller.text=lprice;
      
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(100.0), // here the desired height
          child: AppBar(
        
        backgroundColor: Colors.black,
         title: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(
            isEdit?'Edit Labour':'Add Labour',style: TextStyle(color:Colors.orange,fontWeight: FontWeight.w800,fontSize: 25),
               ),
         ),
      ),
      ),
    body: 
  SingleChildScrollView(
        
    //  child:Padding(
    //    padding: const EdgeInsets.symmetric(horizontal:0,vertical:0),
       child: Center(
        
         child: Container(
         
          height: 850,
          
                 width:double.infinity,
            decoration:const BoxDecoration(
             // color: Colors.amber,
              gradient: LinearGradient(begin: Alignment.center,colors:[Color.fromARGB(255, 247, 126, 5),Color.fromARGB(255, 241, 184, 61),Color(0xFFFF9800)],
              transform: GradientRotation(3.14/2)),shape:BoxShape.rectangle
            ),
          
                  
                    child: Column(
                      children: [
                        
                          Padding(padding:EdgeInsets.fromLTRB(450,330,450,0),
                          child:
                          TextFormField(
                             controller: labournamecontroller,
                             focusNode: FocusNodename,
                             decoration: InputDecoration(
                            
                              labelText: "Labour Name",
                              labelStyle: TextStyle(
                              color: FocusNodename.hasFocus ? Colors.blue : Colors.grey.shade900
      ),
                              hintText: "Enter Labour Name",
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
        
          color: Colors.grey.shade900
        )
      ),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          
                               icon:Icon(Icons.man,color: FocusNodename.hasFocus?Colors.blue:Colors.black,)
                            ),
                          ),
                          ), 
                         
                           Padding(padding:EdgeInsets.fromLTRB(450,20,450,0),
                          child:
                          TextFormField(
                             controller: labourpricecontroller,
                             focusNode: FocusNodeprice,
                             decoration: InputDecoration(
                             labelText: "Price",
                             labelStyle: TextStyle(
                             color: FocusNodeprice.hasFocus ? Colors.blue : Colors.grey.shade900
                             ),
                              hintText: "Price",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Colors.black
        )
      ),
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          
                               icon:Icon(Icons.money,color: FocusNodeprice.hasFocus?Colors.blue:Colors.black,)
                            ),
                          ),
                          ),
                          
                         
                           
                            
                               Padding(
                                 padding: const EdgeInsets.fromLTRB(490,20,450,0),
                                 child: ElevatedButton(child: Text(isEdit?'Update Labour':'Add Labour',style: TextStyle(fontSize: 15),),onPressed:(){isEdit?updateData(labournamecontroller.text,labourpricecontroller.text):SubmitData(labournamecontroller.text,labourpricecontroller.text);},
                                 style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                                 ),
                               )    
                           
                           //  ElevatedButton(onPressed:SubmitData(),
                              
                           //                     , child: Text("Register")),
                           ]
                    ),
                  )
         ),
       ),
     
      
    
    );

     
    
   
    
    
  }
  Future<void>SubmitData(
    String l_name,
      String l_price,
      
      )async
{
  

   final body={
   
    "l_name":l_name,
    "l_price":l_price,
    


   };
   print(body);
   
   const url='http://192.168.1.4:8000/api/addlabour';
   final uri=Uri.parse(url);
   final response =await http.post(uri,body:jsonEncode(body),
   headers:{'Content-type':'application/json'},
   );
  

    if (response.body=='SuccessFully Added') {
      showSuccessMessage("Added");
      print('added successfully');
      setState(() {
         Navigator.pushNamed(context,MyRoute.fetchlabourobj);
      });
     
    } else {
      print('failed');
    }

}
Future<void>updateData(
      String l_name,
      String l_price,
     )async{
  final pdata=widget.ldata;
  if(pdata==null){
    print('you can not update without  data');
    return;
  }
 final id=pdata['id'].toString();
 
   final body={
   
    "l_name":l_name,
    "l_price":l_price,
   

   };
   final url='http://192.168.1.4:8000/api/labourupdate/$id';
   print(url);
   final uri=Uri.parse(url);
   final response =await http.post(uri,body:jsonEncode(body),
   headers:{'Content-type':'application/json'},
   );
   print(id);
   print(response.statusCode);
   print(response.body);
   if(response.statusCode==200){
    print("updation success");
   showSuccessMessage("data updated successfully");
setState(() {
  Navigator.pushNamed(context,MyRoute.fetchlabourobj);
});
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