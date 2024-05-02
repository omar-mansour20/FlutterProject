class AccountModel {
  String? id ;
  String? name ;
  String? address ;

  //constructor
  AccountModel({this.id,this.name,this.address});

  // named constructor
  AccountModel.fromJson(Map map){
    id = map['id'].toString();
    name = map['name'];
    address = map['address'];
  }
}