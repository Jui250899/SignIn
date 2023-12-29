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

FocusNode FocusNodeProductname= new FocusNode();

FocusNode FocusNodeProductPrice= new FocusNode();


class AddProduct extends StatefulWidget {
  final Map? pdata;
  const AddProduct({super.key,this.pdata,});

  @override
  State<AddProduct> createState() => _MySignUpState();
  
  
}

class _MySignUpState extends State<AddProduct> {
  TextEditingController Prodcontroller=TextEditingController();
  TextEditingController Pricecontroller=TextEditingController();
   
   bool isEdit=false;
  @override
  void initState() {
   
    super.initState();
    final pdata=widget.pdata;
    if(pdata!=null){
      isEdit=true;
      final Product=pdata['Product'];
      final Price=pdata['Price'];
      
      



      Prodcontroller.text=Product;
      Pricecontroller.text=Price;
      


    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(100.0), // here the desired height
          child: AppBar(
        
        backgroundColor: Colors.black,
         title: Text(
          isEdit?'Edit Product':'Add Product',style: TextStyle(color:Colors.orange,fontWeight: FontWeight.w400),
      ),
      ),
      ),
    body: 
  SingleChildScrollView(
        
     child:Padding(
       padding: const EdgeInsets.symmetric(horizontal:0,vertical:0),
       child: Center(
         child: Container(
               height: 850,
                 width:double.infinity,
            decoration:const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter,colors:[Color.fromARGB(255, 247, 126, 5),Color.fromARGB(255, 241, 184, 61),Color(0xFFFF9800)],
              transform: GradientRotation(3.14/2))
            ),
          
                  
                    child: Column(
                      children: [
                        
                          Padding(padding:EdgeInsets.fromLTRB(450,330,450,0),
                          child:
                          TextFormField(
                             controller: Prodcontroller,
                          focusNode: FocusNodeProductname,
                            decoration: InputDecoration(
                            
                              labelText: "Product Name",
                              labelStyle: TextStyle(
                              color: FocusNodeProductname.hasFocus ? Colors.blue : Colors.grey.shade900
      ),
                              hintText: "Enter Product Name",
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
        
          color: Colors.grey.shade900)
        ),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          
                               icon:Icon(Icons.man,color: FocusNodeProductname.hasFocus?Colors.blue:Colors.black,)
                            ),
                          ),
                          
                         ),
                           Padding(padding:EdgeInsets.fromLTRB(450,20,450,0),
                          child:
                          TextFormField(
                             controller: Pricecontroller,
                           focusNode: FocusNodeProductPrice,
                            decoration: InputDecoration(
                              labelText: "Price",
                              labelStyle: TextStyle(
                              color: FocusNodeProductPrice.hasFocus ? Colors.blue : Colors.grey.shade900
      ),
                              hintText: "Price",
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
        
          color: Colors.grey.shade900)
        ),
                             
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          
                               icon:Icon(Icons.money,color: FocusNodeProductPrice.hasFocus?Colors.blue:Colors.black,)
                            ),
                          ),
                          ),
                          
                         
                           
                            
                               Padding(
                                 padding: const EdgeInsets.fromLTRB(490,20,450,0),
                                 child: ElevatedButton(onPressed:(){isEdit?updateData(Prodcontroller.text,Pricecontroller.text):SubmitData(Prodcontroller.text,Pricecontroller.text);},style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                                 child: Text(isEdit?'Update':'Add',style: TextStyle(fontSize: 15),)),
                               )    
                           
                           //  ElevatedButton(onPressed:SubmitData(),
                              
                           //                     , child: Text("Register")),
                           ]
                    ),
                  )
         ),
       ),
     )
      
    );

     
    
   
    
    
  }
  Future<void>SubmitData(
    String Product,
      String Price,
      
      )async
{
  

 


   final body={
   
    "Product":Product,
    "Price":Price,
    


   };
   print(body);
   
   const url='http://192.168.1.4:8000/api/addproduct';
   final uri=Uri.parse(url);
   final response =await http.post(uri,body:jsonEncode(body),
   headers:{'Content-type':'application/json'},
   );
   final message = jsonDecode(response.body);
     print(message);

    if (message=='Product Added !!') {
      showSuccessMessage("Added");
      print('added successfully');
      Navigator.pushNamed(context,MyRoute.addprod);
    } else {
      print('failed');
    }

}
Future<void>updateData(
      String Product,
      String Price,
     )async{
  final pdata=widget.pdata;
  if(pdata==null){
    print('you can not update without  data');
    return;
  }
 final id=pdata['id'].toString();
 
   final body={
   
    "Product":Product,
    "Price":Price,
   

   };
   final url='http://192.168.1.4:8000/api/productupdate/$id';
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