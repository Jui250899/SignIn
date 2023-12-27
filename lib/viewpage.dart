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
   
    
        
          SingleChildScrollView(
         
          
             child: Card(
               child: Container(
                       width:1500,
                       height: 1000,
                  decoration: BoxDecoration(
                     //borderRadius: BorderRadius.circular(100.0),
                    gradient: LinearGradient(begin: Alignment.topCenter,colors:[Color.fromARGB(255, 247, 126, 5),Color.fromARGB(255, 246, 177, 28),Color(0xFFFF9800)],
                    transform: GradientRotation(3.14/2))
                  ),
                
                        
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 100,horizontal:50),
                            child: Center( 
                             
                                
                                child: Column(
                                  children:[
                                    Center(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left:500),
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
                                            padding: const EdgeInsets.only(left:500),
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
                                            padding: const EdgeInsets.only(left:500),
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
                                            padding: const EdgeInsets.only(left:500),
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
                                            padding: const EdgeInsets.only(left:500),
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
                                            padding: const EdgeInsets.only(left:500),
                                            child: Text("kms                     :",style: TextStyle(fontWeight: FontWeight.w800,fontSize:17),),
                                          ),
                                           Padding(
                                             padding: const EdgeInsets.only(left:65.0),
                                             child: Text(vehicledetails['vdetails']['kms'].toString(),style: TextStyle(fontSize:17)),
                                           ),
                                          
                                                                     ]
                                                                         ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(5.0),
                                       child: Row( children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left:500),
                                            child: Text("Regular               :",style: TextStyle(fontWeight: FontWeight.w800,fontSize:17),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:68.0),
                                            child: Text(vehicledetails['vdetails']['regular'].toString(),style: TextStyle(fontSize:17)),
                                          ),
                                           ]),
                                     ),
                                          // Padding(
                                          //   padding: const EdgeInsets.all(5.0),
                                          //   child: Row( children: [
                                          //                                         Padding(
                                          //   padding: const EdgeInsets.only(left:500),
                                          //   child: Text("Image:",style: TextStyle(fontWeight: FontWeight.w800,fontSize:17),),
                                          //                                         ),
                                          //                                          Padding(
                                          //                                            padding: const EdgeInsets.only(left:8.0),
                                          //                                            child: Text(vehicledetails['vdetails']['_image'].toString(),style: TextStyle(fontSize:17)),
                                          //                                          ),
                                                                                   
                                          //                                 ]
                                          //                                     ),
                                          // ),
                                ]
                                    
                                                   
                                    
                                     
                                       
                                        ),
                              ),
                          ),
                          ),
             ),
                              
                  ),
         
                        
                       
                         //  child: Text(vehicledetails['vdetails']['last'].toString(),
                        
                         
    
    );
                      
              
    
    
  }
}

