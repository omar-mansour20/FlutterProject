
import 'package:flutter/foundation.dart';

class HotelModel {
  String? id;
  String? name;
  String? descreption;
  int? price;
  int? favorite;
  int? quantity;
  int? availableQuantity;
  Uint8List? image;

  HotelModel(
      {this.id,
      this.name,
      this.descreption,
      this.price,
      this.favorite,
      this.image,
      this.availableQuantity,
      this.quantity});

  // named constructor
  HotelModel.fromJson(Map map) {
    id = map['id'].toString();
    name = map['name'];
    descreption = map['descreption'];
    price = map['price'];
    image = map['image'];
    quantity = map['quantity'];
    availableQuantity = map['availableQuantity'];
    favorite = map['favorite'];
  }
}

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

