import 'package:hotel_reservation_project/features/dashboard/modules/home/model/home_model.dart';

// abestract class 
abstract class ParentRepo { 
  Future<void> insert({required String name,
   String? address,
   String? roomCategory,
   String? descreption,
   int? price}); //insert

  Future<List<HotelModel>> fetch(); // fetch

  Future<void> delete({required int id}); //delete
}