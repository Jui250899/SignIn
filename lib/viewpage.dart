import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:signin/fetchdata.dart';

class ViewPage extends StatefulWidget {
  final Map? vdata;
  
  const ViewPage({super.key,this.vdata});

  @override
  State<ViewPage> createState() => _ViewPageState();
  
}

class _ViewPageState extends State<ViewPage> {
var vehicledetails=jsonDecode(details);
   
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0), // here the desired height
          child:AppBar(
        backgroundColor: Colors.black,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             ShaderMask(
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  center: Alignment.topLeft,
                  radius: 1.0,
                  colors: [const Color.fromARGB(255, 230, 184, 116), Color.fromARGB(255, 232, 161, 103),Color.fromARGB(219, 243, 147, 2),Color.fromARGB(255, 237, 206, 118)],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: Text(
                'User Details',
                style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.white,
                  fontWeight:FontWeight.w600
                ),
              ),
            ),
            
          
          ],
        ))
      ),
   body: 
   
    
        
         
         
          
             Card(
               child: Container(
                       
                  decoration: BoxDecoration(
                     //borderRadius: BorderRadius.circular(100.0),
                    gradient: LinearGradient(begin: Alignment.topCenter,colors:[Colors.orange,Colors.orange.shade800,Colors.orange.shade400],
                    transform: GradientRotation(3.14/2))
                  ),
                
                        
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 100,horizontal:50),
                            child: Center( 
                             
                                
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(260,20,240,20),
                                  child: Card(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    
                                    elevation:10,
                                      child: Container(
                                                       width:1500,
                                                       height: 400,
                                                  decoration: BoxDecoration(
                                                     //borderRadius: BorderRadius.circular(100.0),
                                                    gradient: LinearGradient(begin: Alignment.topCenter,colors:[Colors.orange.shade300,Color.fromARGB(255, 245, 186, 26),Color.fromARGB(255, 237, 206, 5)],
                                                    transform: GradientRotation(3.14/2))
                                                  ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(20,60,20,10),
                                      child: Column(
                                        children:[
                                          Center(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left:150),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Text("User Name        :",style: TextStyle(fontWeight: FontWeight.w600,fontSize:17),),
                                                  )),
                                              Padding(
                                                padding: const EdgeInsets.only(left:60.0),
                                                child: Text(vehicledetails['vdetails']['name'].toString(),style: TextStyle(fontSize:17),),
                                              ),
                                                
                                                 SizedBox(width: 4,),
                                                  Text(vehicledetails['vdetails']['last'].toString(),style: TextStyle(fontSize:17)),
                                               ]
                                            ),
                                          ),
                                            
                                          
                                        
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row( children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left:150),
                                                  child: Text("Email                  :",style: TextStyle(fontWeight: FontWeight.w800,fontSize:17),)
                                                ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:67.0),
                                                    child: Text(vehicledetails['vdetails']['email'].toString(),style: TextStyle(fontSize:17)),
                                                  ),
                                                
                                        ]
                                            ),
                                      ),
                                           Padding(
                                             padding: const EdgeInsets.all(5.0),
                                             child: Row( children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left:150),
                                                  child: Text("Vno                     :",style: TextStyle(fontWeight: FontWeight.w800,fontSize:17),),
                                                ),
                                                 Padding(
                                                   padding: const EdgeInsets.only(left:65.0),
                                                   child: Text(vehicledetails['vdetails']['Vno'].toString(),style: TextStyle(fontSize:17)),
                                                 ),
                                              
                                                                           ]
                                                                               ),
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.all(5.0),
                                             child: Row( children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left:150),
                                                  child: Text("Vmake                :",style: TextStyle(fontWeight: FontWeight.w800,fontSize:17),),
                                                ),
                                                 Padding(
                                                   padding: const EdgeInsets.only(left:65.0),
                                                   child: Text(vehicledetails['vdetails']['Vmake'].toString(),style: TextStyle(fontSize:17)),
                                                 ),
                                                
                                                                           ]
                                                                               ),
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.all(5.0),
                                             child: Row( children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left:150),
                                                  child: Text("Telephone No    :",style: TextStyle(fontWeight: FontWeight.w800,fontSize:17),),
                                                ),
                                                 Padding(
                                                   padding: const EdgeInsets.only(left:64.0),
                                                   child: Text(vehicledetails['vdetails']['tel'].toString(),style: TextStyle(fontSize:17)),
                                                 ),
                                                 
                                                                           ]
                                                                               ),
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.all(5.0),
                                             child: Row( children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left:150),
                                                  child: Text("kms                     :",style: TextStyle(fontWeight: FontWeight.w800,fontSize:17),),
                                                ),
                                                 Padding(
                                                   padding: const EdgeInsets.only(left:65.0),
                                                   child: Text(vehicledetails['vdetails']['kms'].toString()+'kms/'+vehicledetails['vdetails']['E'].toString(),style: TextStyle(fontSize:17)),
                                                 ),
                                                
                                                                           ]
                                                                               ),
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.all(5.0),
                                             child: Row( children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left:150),
                                                  child: Text("Customer complaints :",style: TextStyle(fontWeight: FontWeight.w800,fontSize:17),),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:18.0),
                                                  child: Text(vehicledetails['vdetails']['regular'].toString(),style: TextStyle(fontSize:17)),
                                                ),
                                                 ]),
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.all(5.0),
                                             child: Row( children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left:150),
                                                  child: Text("Items                   :",style: TextStyle(fontWeight: FontWeight.w800,fontSize:17),),
                                                ),
                                                 Padding(
                                                   padding: const EdgeInsets.only(left:60.0),
                                                   child: Text(vehicledetails['vdetails']['item'].toString(),style: TextStyle(fontSize:17)),
                                                 ),
                                                
                                                // Padding(
                                                //   padding: const EdgeInsets.all(5.0),
                                                //   child: Row( children: [
                                                //                                         Padding(
                                                //   padding: const EdgeInsets.only(left:300),
                                                //   child: Text("Items:",style: TextStyle(fontWeight: FontWeight.w800,fontSize:17),),
                                                //                                         ),
                                                //                                          Padding(
                                                //                                            padding: const EdgeInsets.only(left:8.0),
                                                //                                            child: Text(vehicledetails['vdetails']['item'].toString(),style: TextStyle(fontSize:17)),
                                                //                                          ),
                                                                                         
                                                //                                 ]
                                                //                                     ),
                                                // ),
                                      ]
                                          
                                                         
                                          
                                           
                                             
                                              ),
                                    ),]
                                      )
                                    )
                                                              ),
                                ),
                          ),
                          ),
             ),
                              
                  ),
         
                        
                       
                         //  child: Text(vehicledetails['vdetails']['last'].toString(),
                        
                         
    
    
    )
    );
                      
              
    
    
  }
}

