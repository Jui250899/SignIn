import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  final Map? vdata;
  const ViewPage({super.key,this.vdata});

  @override
  State<ViewPage> createState() => _ViewPageState();
  
}

class _ViewPageState extends State<ViewPage> {
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
   bool isView=false;
  @override
  void initState() {
   
    super.initState();
    final vdata=widget.vdata;
    if(vdata!=null){
      isView=true;
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
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        
      ),
    body: 
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 150),
      child: SingleChildScrollView(
     child:Container(
             width:double.infinity,
        decoration:const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter,colors:[Color.fromARGB(255, 247, 126, 5),Color.fromARGB(255, 241, 184, 61),Color(0xFFFF9800)],
          transform: GradientRotation(3.14/2))
        ),
      
              child: Column(
                children:<Widget> [
                  
                    Center(
                      child: Padding(padding:EdgeInsets.symmetric(horizontal:150,vertical:500),
                      child:Text(namec.text,
                      ),
                    ),
                    )
                       
     
    
   // Text("User Id:$id"),

  
                    
  ],
)
    )
      )
    )
    );
  }
}

