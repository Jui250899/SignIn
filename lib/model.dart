class Model{
static final item=[Item(
  id: "AD121",
  name: "Necklace",
  material: "platinum",
  price:200000 ,
  image: "https://4.imimg.com/data4/XM/CH/MY-9812108/platinum-designer-necklace-1000x1000.png"
)];
static final item2=[Item(
  id: "AD122",
  name: "Ring",
  material: "Gold",
  price:50000 ,
  image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYFu6RmpaBcELK6g-_Oe6x0DZ5uVUL_GHdmg&usqp=CAU"
)];
static final item3=[Item(
  id: "AD123",
  name: "Bangles",
  material: "Gold",
  price:60000 ,
  image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMxKO6dlOyBfvZZhTDO0IjdPW-zIb0pnjlpg&usqp=CAU"
)];
static final item4=[Item(
  id: "hr4554",
 name: "Ring", 
 material: "Platinum", 
 price: 200000, 
 image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtz0gFE0hGMxGsdsInDtjW_uueF_DpYHALZA&usqp=CAU"
)];
static final item5=[Item(id: "12fvgg", 
name:"Nosepin", 
material: "Golden", 
price: 1200, 
image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPFeOWKvJ6-UWAypDjeFmxQLptDgm6OrpMaw&usqp=CAU")];
}
class Item{
  final String id;
  final String name;
  final String material;
  final num price;
  final String image;

  Item({required this.id, required this.name, required this.material, required this.price, required this.image});

}
