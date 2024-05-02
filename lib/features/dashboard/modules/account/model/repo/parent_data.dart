import 'package:hotel_reservation_project/features/dashboard/modules/account/model/account_model.dart';


// abestract class 
abstract class ParentRepo { 
  Future<void> insert({required String name, String? address}); //insert

  Future<List<AccountModel>> fetch(); // fetch

  Future<void> delete({required int id}); //delete
}