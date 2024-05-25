import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/model/account_model.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/model/repo/parent_data.dart';

class FirebaseRepo extends ParentRepo {
  static FirebaseRepo instance = FirebaseRepo._init();
  //static FirebaseRepo? _singletonePatternObject;
  // an object for the memory

  FirebaseRepo._init();

  @override
  Future<List<AccountModel>> fetch() async {
      return await FirebaseFirestore.instance.collection('accounts').get().then((QuerySnapshot querySnapshot) {
      return querySnapshot.docs.map((e) {
        final Map data = e.data() as Map;
        Map m = {
          'id': data['id'],
          'name': data['name'],
          'email': data['email'],
          'phone': data['phone'],
          'password': data['password'],
        };
        return AccountModel.fromJson(m);
      }).toList();
    });
  }

  @override
  Future<void> delete({required int id}) async {
    CollectionReference accounts =
        FirebaseFirestore.instance.collection('accounts');
    await accounts.doc(id.toString()).delete();
  }

  @override
  Future<void> insert(
      {required String name,
      String? email,
      int? phone,
      String? password}) async {
    CollectionReference accounts =
        FirebaseFirestore.instance.collection('accounts');
    await accounts
        .add({
          'name': name,
          'email': email,
          'phone': phone,
          'password': password
        })
        .then((value) => print("Account Added"))
        .catchError((error) => print("Failed to add account: $error"));;
  }



  @override
  Future<void> checkEmail({required String email}) {
    // TODO: implement checkEmail
    throw UnimplementedError();
  }
  @override
  Future<String?> getPassword({required String email}) {
    // TODO: implement getPassword
    throw UnimplementedError();
  }
  @override
  Future<void> updatePassword({required String email, String? newPassword}) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }
  // no more default constructor
  // to make the constructor private and

  // static FirebaseRepo get instance_of_memory_object {
  //   _singletonePatternObject ??=FirebaseRepo._init();
  //   // only if the object=null -> will invoke the constructor

  //   return _singletonePatternObject!;
  // }
}
