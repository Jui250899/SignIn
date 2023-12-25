import 'dart:convert';
//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
 TextEditingController nameController=TextEditingController();
  TextEditingController lastController=TextEditingController();
   TextEditingController emailController=TextEditingController();
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
  
class AddTodoList extends StatefulWidget {
  final Map? vdata;
  const AddTodoList({super.key,
  this.vdata,});

  @override
  State<AddTodoList> createState() => _AddTodoListState();
}

class _AddTodoListState extends State<AddTodoList> {
 
  bool isEdit=false;
  @override
  void initState() {
   
    super.initState();
    final vdata=widget.vdata;
    if(vdata!=null){
      isEdit=true;
      var name=vdata['name'];
      var last=vdata['last'];
      final email=vdata['email'];
      final date=vdata['date'];
      final Vno=vdata['Vno'];
      final Vmake=vdata['Vmake'];
      final tel=vdata['tel'];
      final kms=vdata['kms'];
      final E=vdata['E'];
      //  final item=vdata['item'];
      //  final regular=vdata['regular'];
      // // final front=vdata['front'];
      // // final right=vdata['right'];
      // // final left=vdata['left'];
      // // final rear=vdata['rear'];
      // // final dashboard=vdata['dashboard'];
      // // final dickey=vdata['dickey'];
      



      nameController.text=name;
      lastController.text=last;
      emailController.text=email;
      dateController.text=date;
      vnoController.text=Vno;
      vmakeController.text=Vmake;
      telController.text=tel;
      kmsController.text=kms;
      eController.text=E;
      // itemController.text=item;
      // regController.text=regular;
      // frontController.text=front;
      // rightController.text=right;
      // leftController.text=left;
      // rearController.text=rear;
      // dashboardController.text=dashboard;
      // dickeyController.text=dickey;
      


    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEdit?'Edit':'Add data',
        ),
      ),
      
      body:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal:50,vertical:10),
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
        
        child: ListView(children: [
          
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: nameController,
              decoration:const InputDecoration(
                hintText: 'Name',
             ),
              
            ),
      ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                  controller: lastController,
              decoration:const InputDecoration(
                hintText: 'Last',
             ),
              
            ),
          ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextField(
                   controller: emailController,
              decoration:const InputDecoration(
                hintText: 'Email',
             ),
              
                     ),
           ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                  controller: dateController,
              decoration:const InputDecoration(
                hintText: 'date',
             ),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                  controller: vnoController,
              decoration:const InputDecoration(
                hintText: 'vno',
             ),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                  controller: vmakeController,
              decoration:const InputDecoration(
                hintText: 'vmake',
             ),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                  controller: telController,
              decoration:const InputDecoration(
                hintText: 'tel',
             ),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                  controller: kmsController,
              decoration:const InputDecoration(
                hintText: 'kms',
             ),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                  controller: eController,
              decoration:const InputDecoration(
                hintText: 'E',
             ),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                  controller: itemController,
              decoration:const InputDecoration(
                hintText: 'item',
             ),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                  controller: regController,
              decoration:const InputDecoration(
                hintText: 'regular',
             ),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                  controller: frontController,
              decoration:const InputDecoration(
                hintText: 'front',
             ),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                  controller: rightController,
              decoration:const InputDecoration(
                hintText: 'right',
             ),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                  controller: leftController,
              decoration:const InputDecoration(
                hintText: 'left',
             ),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                  controller: rearController,
              decoration:const InputDecoration(
                hintText: 'rear',
             ),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                  controller: dashboardController,
              decoration:const InputDecoration(
                hintText: 'dashboard',
             ),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                  controller: dickeyController,
              decoration:const InputDecoration(
                hintText: 'dickey',
             ),
              
            ),
          ),
        
       
         const SizedBox(height: 20),
          
          Material(child: ElevatedButton(onPressed:isEdit?updateData:SubmitData,
           child: Text(isEdit?'Update':'Submit',style: TextStyle(fontSize: 15),)))
        ],
        ),
      ),
    )
      )
    );
    }
    
Future<void>updateData()async{
  final vdata=widget.vdata;
  if(vdata==null){
    print('you can not update without todo data');
    return;
  }
  final id=vdata['id'] ;
  var name=nameController.text;
  final last=lastController.text;
  final email=emailController.text;
  final date=dateController.text;
  final Vno=vnoController.text;
  final Vmake=vmakeController.text;
  final tel=telController.text;
  final kms=kmsController.text;
  final E=eController.text;
  final item=itemController.text;
   final regular=regController.text;
   final front=frontController.text;
   final right=rightController.text;
   final left=leftController.text;
   final rear=rearController.text;
   final dashboard=dashboardController.text;
   final dickey=dickeyController.text;

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
    "right":right,
    "left":left,
    "rear":rear,
    "dashboard":dashboard,
    "dickey":dickey,


   };
   final url='http://192.168.1.3:8000/api/update/$id';
   print(url);
   final uri=Uri.parse(url);
   final response =await http.put(uri,body:jsonEncode(body),
   headers:{'Content-Type':'application/json'},
   );
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
}


Future<void>SubmitData()async
{
  //final id=vdata['id'];
  final Cname=nameController.text;
  final cdescription=lastController.text;
  final cemail=emailController.text;
  final cdate=dateController.text;
  final cvno=vnoController.text;
  final cvmake=vmakeController.text;
  final ctel=telController.text;
  final ckms=kmsController.text;
  final ce=eController.text;
  // final citem=itemController.text;
  //  final creg=regController.text;
  //  final cfront=frontController.text;
  //  final cright=rightController.text;
  //  final cleft=leftController.text;
  //  final crear=rearController.text;
  //  final cdash=dashboardController.text;
  //  final cdickey=dickeyController.text;

   final body={
   
    "name":Cname,
    "last":cdescription,
    "email":cemail,
    "date":cdate,
    "Vno":cvno,
    "Vmake":cvmake,
    "tel":ctel,
    "kms":ckms,
     "E":ce,
    // "items":citem,
    // "regular":creg,
    // "front":cfront,
    // "right":cright,
    // "left":cleft,
    // "rear":crear,
    // "dashboard":cdash,
    // "dickey":cdickey,


   };
   final url='http://192.168.1.3:8000/api/insertdata';
   final uri=Uri.parse(url);
   final response =await http.post(uri,body:jsonEncode(body),
   headers:{'Content-Type':'application/json'},
   );
   print(response.statusCode);
   print(response.body);
   if(response.statusCode==200){
    print("creation success");
   showSuccessMessage("data created successfully");

   }
   else{
    print("failed");
    showErrorMessage("data creation failed");
   }
}

void showSuccessMessage(String msg){
  final snackbar=SnackBar(content: Text(msg));
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
void showErrorMessage(String msg){
  final snackbar=SnackBar(content: Text(msg,style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,);
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
 
}