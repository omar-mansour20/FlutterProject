// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hotel_reservation_project/features/dashboard/modules/home/model/home_model.dart';
// import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/parent_data.dart';

// class FirebaseRepo extends ParentRepo {
//   static FirebaseRepo instance = FirebaseRepo._init();
//   //static FirebaseRepo? _singletonePatternObject;
//   // an object for the memory

//   FirebaseRepo._init();


//   // delete
//   @override
//   Future<void> delete({required int id}) async {
//      CollectionReference hotels = FirebaseFirestore.instance.collection('hotels');
//     await hotels.doc(id.toString()).delete();
//   }


//   // fetch
//   @override
//   Future<List<HotelModel>> fetch() async {
//     return await FirebaseFirestore.instance.collection('hotels').get().then((QuerySnapshot querySnapshot) {
//       return querySnapshot.docs.map((e) {
//         final Map data = e.data() as Map;

//         Map m = {
//           'name': data.containsKey('name') ? data['name'] : "no name",
//           'address': data.containsKey('address') ? data['address'] : "no address",
//           'id': e.reference.id,
//         };

//         return HotelModel.fromJson(m);
//       }).toList();
//     });
//   }


//   // insert
//   @override
//   Future<void> insert(
//       {required String name,
//       String? address,
//       String? roomCategory,
//       String? descreption,
//       int? price}) async {

        
//     CollectionReference hotels = FirebaseFirestore.instance.collection('hotels');
//     await hotels
//         .add({'name':name, 'address':address,'roomCategory':roomCategory,'descreption':descreption,'price':price })
//         .then((value) => print("hotel Added"))
//         .catchError((error) => print("Failed to add hotel: $error"));
//   }
// }