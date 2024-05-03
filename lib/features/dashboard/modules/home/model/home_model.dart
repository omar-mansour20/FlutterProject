class HotelModel{
  String? id ;
  String? name ;
  String? address ;
  String? roomCategory;
  String? descreption;
  int? price;

   HotelModel({this.id,this.name,this.address,this.roomCategory,this.descreption,this.price});

  // named constructor
  HotelModel.fromJson(Map map){
    id = map['id'].toString();
    name = map['name'];
    address = map['address'];
    roomCategory = map['roomCategory'];
    descreption = map['descreption'];
    price = map['price'];
  }
}