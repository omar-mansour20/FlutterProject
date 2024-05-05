class AccountModel {
  String? id ;
  String? name ;
  String? email ;
  int? phone;
  String? password;
  

  //constructor
  AccountModel({this.id,this.name,this.email,this.phone,this.password});

  // named constructor
  AccountModel.fromJson(Map map){
    id = map['id'].toString();
    name = map['name'];
    email = map['email'];
    phone = map['phone'];
    password = map['password'];
  }
}