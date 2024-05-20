import 'package:hotel_reservation_project/features/dashboard/modules/account/model/account_model.dart';


// abestract class 
abstract class ParentRepo { 
  Future<void> insert({required String name, String? email, int phone ,String? password}); //insert

  Future<List<AccountModel>> fetch(); // fetch


  Future<String?> getPassword({required String email}); // fetch

  Future<void> delete({required int id}); //delete

  Future<void> updatePassword({required String email,String newPassword}); //delete
  Future<void> checkEmail({required String email}); //delete
}