import 'package:flutter/material.dart';
//import 'package:signin/addlabour.dart';
import 'package:signin/addproduct.dart';
import 'package:signin/routes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
TextEditingController SearchController=TextEditingController();
class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyLabourState();
  
}
class _MyLabourState extends State<MyProduct> {
 List productDetails=[];
     //var name=vdetails['name'];

  @override
  void initState() {
    super.initState();
    fetchProductData();
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
           //  Text("Labour Detail List",style: TextStyle(fontSize: 30,color: Colors.orange,fontWeight: FontWeight.bold)),
           Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(onPressed: (){Navigator.pushNamed(context, MyRoute.fetchprod);}, child: Text("Product",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.orange,fontSize: 25,decoration: TextDecoration.underline,),)),
                  ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextButton(onPressed: (){Navigator.pushNamed(context, MyRoute.fetchlabourobj);}, child: Text("Labour",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.orange,fontSize: 25,decoration: TextDecoration.underline,),)),
                 ),
             Padding(
               padding: const EdgeInsets.all(7.0),
               child: TextButton(onPressed:  (){Navigator.pushNamed(context,MyRoute.fetchdataobj);}, child: Text("Customer",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.orange,fontSize: 25,decoration: TextDecoration.underline,))),
             )
                ],
              ),
            ),
            Padding(
          padding: const EdgeInsets.fromLTRB(600,70,0,0),
          child: ElevatedButton(onPressed:
          navigateToAddProduct
          , style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,
                 
                  textStyle: TextStyle(color:Colors.orange,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),child: Padding(
            padding: const EdgeInsets.only(left:0),
            child: Text("+ New Product ?",style:TextStyle(color:Colors.black,),),
          )))
           ],
         ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 200.2,
        toolbarOpacity: 0.8,
        
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(70),
              bottomLeft: Radius.circular(70)),
        ),
        elevation: 0.00,
        backgroundColor: Colors.black,
         
      ), 
        
      ),
      
         body:
        
       Container(
        
             width:double.infinity,
        decoration:const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter,colors:[Color.fromARGB(255, 247, 126, 5),Color.fromARGB(255, 241, 184, 61),Color(0xFFFF9800)],
          transform: GradientRotation(3.14/2))
        ),
       child:RefreshIndicator(
        
          onRefresh: fetchProductData,
          
          child: ListView.builder(
            
            itemCount:1,itemBuilder: (context, index)  {
             
              
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
              hintText: "Search",
              border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              suffixIcon: Icon(Icons.search)
              
             ),
               //onChanged:fetchData(),
               ),
           
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child:  ElevatedButton(child: Text('Search'),onPressed: () =>{
                             fetchProductData(),
                             },style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                       
                        textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),),
           ),
               Padding(
                     padding: const EdgeInsets.all(100.0),
                     child: DataTable(
                      showCheckboxColumn: false,
                      
                        border: TableBorder.all(width:1),
                      columnSpacing:80,
                      columns: const [
                        DataColumn(label: Text('Product ID',style: TextStyle(fontWeight: FontWeight.w900),),),
                         DataColumn(label: Text('Product Name',style: TextStyle(fontWeight: FontWeight.w900),),),
                        DataColumn(label: Text('Product Price',style: TextStyle(fontWeight: FontWeight.w900)),),
                        
                        DataColumn(label: Text('Action',style: TextStyle(fontWeight: FontWeight.w900))),
                        DataColumn(label: Text('Action',style: TextStyle(fontWeight: FontWeight.w900))),
                        // DataColumn(label: Text('Action')),
                            
                                   
                      ],
                     
                               
                         
                      rows: List.generate(
                      
                        productDetails.length,
                        
                        (index) {
                          
                          
                          var data = productDetails[index];
                          final id=data['id'].toString();
                        // final name=data['name'].toString();
                            
                          return DataRow(
                          
                          
                            // onLongPress: () {
                            //   fetchbyId(id);
                            // },
                            cells: <DataCell>[
                              DataCell(   
                                     CircleAvatar(radius:18.4,backgroundColor: Colors.black,child: Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           
                                                           child: Text('${index+1}'),
                                                         )),
                                   
                              ),
                                 
                            DataCell(
                              
                              Text(data['Product'].toString()),
                            ),
                            DataCell(
                              Text(data['Price'].toString()),
                            ),
                           
                           
                             DataCell(
                             ElevatedButton(child: Text('Edit'),onPressed: () =>{
                              navigateToEditProduct(data),
                             },style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                       
                        textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),),
                             ),
                              
                           
                           
                                
                             
                            DataCell
                            (ElevatedButton(child: Text('Delete'),onPressed: () =>{
                              deleteProductById(id)
                             },
                             style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 238, 79, 30),
                       
                        textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),)
                              
                            ),
                        //      DataCell(
                        //      ElevatedButton(child: Text('View'),onPressed: (){
                        //     fetchbyId(id);
                        //      },
                        //      style: ElevatedButton.styleFrom(backgroundColor: Colors.green,
                       
                        // textStyle: TextStyle(
                        // fontSize: 12,
                        // fontWeight: FontWeight.bold)),)
                              
                        //     ),
                          ]
                          );
                          
                        },
                      ).toList(),
                      showBottomBorder: true,
                     
                     
                     ),
                    
                   ),
                  //  Padding(
                  //    padding: const EdgeInsets.all(8.0),
                  //    child: ElevatedButton(onPressed: (){
                  //     fetchData();
                  //    }, child:Text("Back")),
                  //  )
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
  Future<void>fetch(String id)async{
  final url='http://192.168.1.4:8000/api/srecord/$id';
    final uri=Uri.parse(url);
    final response=await http.get(uri);
    //details=response.body;
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
  Future<void>fetchProductData()async{
    //var data=SearchController.text;
  final url='http://192.168.1.4:8000/api/viewproduct';
    final uri=Uri.parse(url);
    final response=await http.get(uri);
    if(response.statusCode==200){
      final json=jsonDecode(response.body) as Map;
      final result=json['productDetails'] as List;
      setState(() {
        productDetails=result;
      });
    };
  }
  
   Future<void>deleteProductById(String id)async{
final url='http://192.168.1.4:8000/api/productdelete/$id';
    final uri=Uri.parse(url);
    final response=await http.delete(uri);
    showSuccessMessage('deleted successfully');
    if(response.statusCode==200){
      final filtered=productDetails.where((element) => element['id'].toString()!=id).toList();
      setState(() {
        productDetails=filtered;
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

   
  

Future<void> navigateToEditProduct(Map data)async{
    final route=MaterialPageRoute(
      builder: (context) => AddProduct(pdata:data),);
     await Navigator.push(context,route);
  }
   void navigateToAddProduct(){
    final route=MaterialPageRoute(
      builder: (context) =>const AddProduct(),);
      Navigator.push(context,route);
  }
}