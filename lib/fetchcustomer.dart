
import 'dart:io';
import 'dart:typed_data';
// import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:signin/adddata.dart';
// ignore: depend_on_referenced_packages
import 'package:signin/addrecord.dart';
import 'package:signin/login.dart';
import 'package:signin/routes.dart';
TextEditingController SearchController=TextEditingController();
FocusNode FocusNodeSearch= new FocusNode();
 var details;
class fetchcustomer extends StatefulWidget {
  const fetchcustomer({super.key});

  @override
  State<fetchcustomer> createState() => _FetchcustClassState();

}

class _FetchcustClassState extends State<fetchcustomer> {
 List<String> images=[];
Future getImage() async{
    final image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null) return;
    Uint8List imagebyte=await image!.readAsBytes();
    String _base64=base64.encode(imagebyte);

    print(_base64);
    final imagetemp=File(image.path);
    print(imagetemp);
    // setState(() {
    //   this._image=imagetemp;
    // });
  } File? _image;
 
     List vdetails=[];
     
     //var name=vdetails['name'];

  @override
  void initState() {
    super.initState();
    fetchData();
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      
       extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.0), // here the desired height
          child: AppBar(
        
         title:  Row(
           children: [
          
            // TextFormField(
              
            //   decoration: InputDecoration(
            //     fillColor: Colors.white,
            //     hintText: "Search",
            //     labelText: "Search"
            //   ),
            // ),
             //Text("Customer Detail List",style: TextStyle(fontSize: 35,color: Colors.orange,fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(onPressed: (){Navigator.pushNamed(context, MyRoute.fetchprod);}, child: Text("Product",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.orange,fontSize: 25,decoration: TextDecoration.underline,decorationColor: Colors.orange,
                    ),)),
                  ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextButton(onPressed: (){Navigator.pushNamed(context, MyRoute.fetchlabourobj);}, child: Text("Labour",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.orange,fontSize: 25,decoration: TextDecoration.underline,decorationColor: Colors.orange,),)),
                 ),
              Divider(thickness:0.5,color: Colors.orange,),TextButton(onPressed:  (){}, child: Text("Customer",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.orange,fontSize: 25,decoration: TextDecoration.underline,decorationColor: Colors.orange,)))
                ],
              ),
            ),
            Padding(
          padding: const EdgeInsets.fromLTRB(600,70,0,0),
          child: ElevatedButton(onPressed:
          navigateToAdd
          , style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,
                 
                  textStyle: TextStyle(color:Colors.orange,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),child: Padding(
            padding: const EdgeInsets.only(left:0),
            child: Text("+ New Customer ?",style:TextStyle(color:Colors.black,),),
          )))
           ],
         ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 200.2,
        toolbarOpacity: 0.9,
        
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(70),
              bottomLeft: Radius.circular(70)),
        ),
        elevation: 0.00,
        backgroundColor: Colors.black,
          iconTheme: IconThemeData(
    color: Colors.orange, 
      ), 
        
      ),
      ),
         body:
        
       Container(
        
             width:double.infinity,
        decoration:const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter,colors:[Colors.orange,Color.fromARGB(255, 240, 173, 39),Colors.orange],
          transform: GradientRotation(3.14/6))
        ),
       child:RefreshIndicator(
        
          onRefresh: fetchData,
          
          child: ListView.builder(
            
            itemCount:1,itemBuilder: (context, index)  {
              final data=vdetails[index] ;
              
             //final item=vdetails[index] as Map;
    
          return SingleChildScrollView(
           
            child: Container( 
              
               child: Column(
             
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
             children: 
             [  FractionalTranslation(
              translation: Offset(6.0,-10.490),
              child: Align(
                child: CircleAvatar(
                  
                  radius: 25.0,
                  //maxRadius: 30,
                  backgroundColor:Colors.white,
                  //child: Text("A"),
                ),
                alignment: FractionalOffset(0.5,0.8),
              ),
            ),
             // height: 100,
           Padding(
             padding: const EdgeInsets.fromLTRB(250,20,250,0),
             child: TextFormField(
              controller: SearchController,
              decoration: InputDecoration(
              hintText: "Search by name,date and vehicle number",
               hintStyle: TextStyle(
                             color: FocusNodeSearch.hasFocus ? Colors.blue : Colors.black
                             ),
                             
                              focusedBorder:OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black
        )
      ),
              border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              suffixIcon: Icon(Icons.search,color: Colors.black,)
              
             ),
               //onChanged:fetchData(),
               ),
           
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
//              child:InkWell(child: Icon(Icons.search,color: Color.fromARGB(255, 193, 12, 12)),
//                             onTap: (){  fetchData();
//       //action code when clicked
//                             print("The icon is clicked");
//   },
// )),
             child:  ElevatedButton(child: Text('Search',style: TextStyle(color: Colors.white),),onPressed: () =>{
                             fetchData(),
                             },style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                       
                        textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),),
           
             
               
               
               
          
             
             ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal:50),
               child: Card(color:Colors.black,
                elevation: 2.9,
                                      shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2),
                                      //side: const BorderSide(width: 1, color: Colors.black)
                                      ),
                                 
                                       child:  Container(

                                        
               width:double.infinity,
                       decoration:const BoxDecoration(
                         gradient: LinearGradient(begin: Alignment.topCenter,colors:[Color.fromARGB(255, 241, 184, 61),Color(0xFFFF9800)],
                         transform: GradientRotation(3.14/2))
                       ),
                                      child: Padding(
                                        padding:EdgeInsets.symmetric(horizontal:30,vertical:100),
                                        child: Column(
                                          //var data = vdetails[index];
                        children: [
                          ListView.builder(
            
            itemCount:vdetails.length,itemBuilder: (context, index) {
              final data=vdetails[index] ;
                            
                          
                         
                       return Row(
                            children: [
                              Text(data['name']),
                          
                          
                           Text(data['last']),
                            ]); 
                         
              } ) ]
               )
               )
               )
               ),
             )
               
             ]    
          )
         )
    );
            }
          )
       )
       )
    );
              
             
            }
      
  Future<void>fetchbyId(String id)async{
  final url='http://192.168.1.4:8000/api/srecord/$id';
    final uri=Uri.parse(url);
    final response=await http.get(uri);
  details=response.body;
    if(response.statusCode==200){
      Navigator.pushNamed(context,MyRoute.viewobj);
    //   final json=jsonDecode(response.body) as Map;
    //   final result=json['vdetails'] as List;
    //   setState(() {
    //     vdetails=result;
    //   });
    // };
  }
  }
  Future<void>fetchData()async{
    var data=SearchController.text;
  final url='http://192.168.1.4:8000/api/view?search='+ data;
    final uri=Uri.parse(url);
    final response=await http.get(uri);
    if(response.statusCode==200){
      final json=jsonDecode(response.body) as Map;
      final result=json['vdetails'] as List;
      setState(() {
        vdetails=result;
      });
    };
  }
   Future<void>deleteById(String id)async{
final url='http://192.168.1.4:8000/api/delete/$id';
    final uri=Uri.parse(url);
    final response=await http.delete(uri);
    showSuccessMessage('deleted successfully');
    if(response.statusCode==200){
      final filtered=vdetails.where((element) => element['id'].toString()!=id).toList();
      setState(() {
        vdetails=filtered;
      });
   }else{
    showErrorMessage('Deletion failed');
   }
   }
   void showSuccessMessage(String msg){
  final snackbar=SnackBar(content: Text(msg));
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
void showErrorMessage(String msg){
  final snackbar=SnackBar(content: Text(msg,style:const TextStyle(color: Colors.white),),backgroundColor: Colors.red,);
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

   
  

Future<void> navigateToEdit(Map data)async{
    final route=MaterialPageRoute(
      builder: (context) => MyAdd(vdata:data),);
     await Navigator.push(context,route);
  }
   void navigateToAdd(){
    final route=MaterialPageRoute(
      builder: (context) =>const MyAdd(),);
      Navigator.push(context,route);
  }
  }
