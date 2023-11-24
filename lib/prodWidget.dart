import "package:flutter/material.dart";
import "package:projnew/model.dart";
import "package:projnew/myobj.dart";

class ProductWidget extends StatefulWidget {
  final Item item;
  final Item item2;
  final Item item3;
  final Item item4;
  final Item item5;
  const ProductWidget({super.key ,required this.item,required this.item2,required this.item3,required this.item4,required this.item5})
  :assert(item !=Null && item2 !=Null && item3 !=Null && item4 !=Null && item5 !=Null) ;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
 // super(GlobalKey: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children:<Widget>[
         Card(
    
        child:ListTile(
          onTap: (){
            Navigator.pushNamed(context,MyObj.Obj);
          },
                 leading:
                 
                   Image.network(widget.item.image,height: 150,),
                   title:Text(widget.item.name,style: TextStyle(fontSize:20,fontWeight: FontWeight.w500),),
                   subtitle: Text(widget.item.material,style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                   trailing: Text("\$${widget.item.price}",
                   textScaleFactor: 1.5,
                   style: TextStyle(color: Colors.blue,
                   fontWeight: FontWeight.bold),
                   ),
      )
        
      
      ),
      Card(
        child:ListTile(
          onTap: () {
            Navigator.pushNamed(context,MyObj.Obj2);
          },
                 leading:
                 
                   Image.network(widget.item2.image,height: 150,),
                   title:Text(widget.item2.name,style: TextStyle(fontSize:20,fontWeight: FontWeight.w500),),
                   subtitle: Text(widget.item2.material,style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                   trailing: Text("\$${widget.item2.price}",
                   textScaleFactor: 1.5,
                   style: TextStyle(color: Colors.blue,
                   fontWeight: FontWeight.bold),
                   ),
                      
                
                
        )
        
      
      
      ),
       Card(
        child:ListTile(
          onTap: () {
            Navigator.pushNamed(context,MyObj.Obj3);
          },
                 leading:
                 
                   Image.network(widget.item3.image,height: 150,),
                   title:Text(widget.item3.name,style: TextStyle(fontSize:20,fontWeight: FontWeight.w500),),
                   subtitle: Text(widget.item3.material,style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                   trailing: Text("\$${widget.item3.price}",
                   textScaleFactor: 1.5,
                   style: TextStyle(color: Colors.blue,
                   fontWeight: FontWeight.bold),
                   ) 
        )
        
      
      
      ),
Card(
  child: ListTile(
    onTap: () {
      Navigator.pushNamed(context,MyObj.obj4);

    },
    leading: Image.network(widget.item4.image,height:150),
    title: Text(widget.item4.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
    subtitle: Text(widget.item4.material,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
    trailing: Text("\$${widget.item4.price}",
    textScaleFactor: 1.5,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
  ),
),
Card(
  child: ListTile(
    onTap: () {
      Navigator.pushNamed(context,MyObj.obj5);
    },
    leading: Image.network(widget.item5.image,height: 150,),
    title: Text(widget.item5.name,style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
    subtitle: Text(widget.item5.material,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
    trailing: Text("\$${widget.item5.price}",
    textScaleFactor: 1.5,style: TextStyle(color:Colors.blue,fontWeight: FontWeight.bold),),
  )
)
      ],
    );
    
      
       
  }
}