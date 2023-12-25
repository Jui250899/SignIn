
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

//import 'package:signin/adddata.dart';
// ignore: depend_on_referenced_packages
import 'package:signin/addrecord.dart';
import 'package:signin/routes.dart';

class FetchDataClass extends StatefulWidget {
  const FetchDataClass({super.key});

  @override
  State<FetchDataClass> createState() => _FetchDataClassState();

}

class _FetchDataClassState extends State<FetchDataClass> {
// Future getImage() async{
//     final image=await ImagePicker().pickImage(source: ImageSource.gallery);
//     if(image==null) return;
//     Uint8List imagebyte=await image!.readAsBytes();
//     String _base64=base64.encode(imagebyte);

//     print(_base64);
//     final imagetemp=File(image.path);
//     print(imagetemp);
//     // setState(() {
//     //   this._image=imagetemp;
//     // });
//   } File? _image;
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

     List vdetails=[];
     

  @override
  void initState() {
    super.initState();
    fetchData();
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("list"),
        
      ),
         body:  Container(
          
             width:double.infinity,
        decoration:const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter,colors:[Color.fromARGB(255, 247, 126, 5),Color.fromARGB(255, 241, 184, 61),Color(0xFFFF9800)],
          transform: GradientRotation(3.14/2))
        ),
       child:RefreshIndicator(
          onRefresh: fetchData,
          
          child: ListView.builder(
            
            itemCount:1,itemBuilder: (context, index)  {
              final data=vdetails[index] as Map;
             //final item=vdetails[index] as Map;
    
          return SingleChildScrollView(
           
            child: Container( 
              
             // height: 100,
              
              
                   child: DataTable(
                      border: TableBorder.all(width: 1),
                    columnSpacing: 20,
                    columns: const [
                       DataColumn(label: Text('USERid'),),
                      DataColumn(label: Text('FIRST NAME'),),
                      DataColumn(label: Text('LAST NAME'),),
                      DataColumn(label: Text('EMAIL')),
                      DataColumn(label: Text('DATE')),
                      DataColumn(label: Text('VNO')),
                      DataColumn(label: Text('VMAKE')),
                      DataColumn(label: Text('TELEPHONE')),
                      DataColumn(label: Text('KMS')),
                      DataColumn(label: Text('E')),
                      DataColumn(label: Text('ITEM')),
                      DataColumn(label: Text('REGULAR')),
                      DataColumn(label: Text('IMAGES')),
                      DataColumn(label: Text('Action')),
                      DataColumn(label: Text('Action')),
                      DataColumn(label: Text('Action')),
                              
                                 
                    ],
                   
                             
                       
                    rows: List.generate(
                    
                      vdetails.length,
                      
                      (index) {
                        
                        
                        var data = vdetails[index];
                        final id=data['id'].toString();
                        return DataRow(cells: [
                          
                            DataCell(
                           
                                 CircleAvatar(radius:18.4,backgroundColor: Colors.black,child: Padding(
                                                     padding: const EdgeInsets.all(8.0),
                                                     
                                                     child: Text('${index+1}'),
                                                   )),
                              
                          ),
                          
                          DataCell(
                            Text(data['name'].toString()),
                          ),
                          DataCell(
                            Text(data['last'].toString()),
                          ),
                          DataCell(
                            Text(data['email'].toString()),
                          ),
                           DataCell(
                            Text(data['date'].toString()),
                            
                          ),
                           DataCell(
                            Text(data['Vno'].toString()),
                            
                          ),
                           DataCell(
                            Text(data['Vmake'].toString()),
                            
                          ),
                           DataCell(
                            Text(data['tel'].toString()),
                            
                          ),
                           DataCell(
                            Text(data['kms'].toString()),
                            
                          ),
                           DataCell(
                            Text(data['E'].toString()),
                            
                          ),
                           DataCell(
                            Text(data['item'].toString()),
                            
                          ),
                           DataCell(
                            Text(data['regular'].toString()),
                            
                           ),
                           DataCell(
                             _image==null ?Image.asset('assets/images/mynew.jpg'):
                              Image.file(_image!),
                     //     Image.file(
                     //   vdetails[index],
                     //   fit: BoxFit.cover,
                     // )
                            ),
                    
                   
                            
                         
                           DataCell(
                           ElevatedButton(onPressed: () =>{
                            navigateToEdit(data),
                           },child:Text("Edit"),)
                            
                          ),
                         
                              
                            DataCell(
                           ElevatedButton(child: Text('Delete'),onPressed: () =>{
                            deleteById(id)
                           },
                           style: ElevatedButton.styleFrom(backgroundColor: Colors.red,
                     
                      textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),)
                            
                          ),
                           DataCell(
                           ElevatedButton(child: Text('View'),onPressed: (){
                           Navigator.pushNamed(context,MyRoute.viewobj);
                           },
                           style: ElevatedButton.styleFrom(backgroundColor: Colors.green,
                     
                      textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),)
                            
                          ),
                        ]
                        );
                        
                      },
                    ).toList(),
                    showBottomBorder: true,
                   
                   
                   ),
                 ),
               );
             
            }
          )
         )
    )
    );
              
             
            }
      
        
            
       
              
          
        
          
   
    
  Future<void>fetchData()async{
  final url='http://192.168.1.4:8000/api/view';
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
      builder: (context) => MySignUp(vdata:data),);
     await Navigator.push(context,route);
  }
  
  }
