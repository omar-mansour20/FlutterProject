import 'dart:typed_data';

import 'package:hotel_reservation_project/features/dashboard/modules/home/model/home_model.dart';

// abestract class 
abstract class ParentRepo { 
  Future<void> insert({required String name,
   String? descreption,
   int? price,
   int? quantity,
    int? availableQuantity,
    Uint8List? image,
   }); //insert

  Future<List<HotelModel>> fetch(); // fetch

  Future<void> delete({required int id}); //delete
}