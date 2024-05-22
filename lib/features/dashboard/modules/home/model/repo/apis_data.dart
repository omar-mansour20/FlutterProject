import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/home_model.dart';

class API_Repo {
 final Dio _dio = Dio();

  String baseUrl = "https://78ba-156-203-152-215.negrok-free.app/";
  Future<List<HotelModel>> fetch() async {
    final List<Map<String, dynamic>> maps = (await _dio.get(baseUrl + 'hotel')) as List<Map<String, dynamic>>;
    return maps.map((e) => HotelModel.fromJson(e)).toList();
  
  }

  Future<List<HotelModel>> fetchFavoriteHotels() async {
      final List<Map<String, dynamic>> maps = (await _dio.get('${baseUrl}hotel')) as List<Map<String, dynamic>>;
      return maps.map((e) => HotelModel.fromJson(e)).toList();
    }

 @override
 Future<HotelModel> addhotel({
  required String name,
  String? description,
  int? price,
  int? quantity,
  int? availableQuantity,
  Uint8List? image,
}) async {
  try {
    await _dio.post(baseUrl + 'hotel', data: {
      'name': name,
      'description': description ?? '',
      'price': price ?? 0,
      'quantity': quantity ?? 0,
      'availableQuantity': availableQuantity ?? 0,
      'image': image,
      'favorite': 0
    });
    print('Hotel inserted successfully');

    // Fetch and return the inserted hotel model
    final List<Map<String, dynamic>> insertedHotelMaps = (await _dio.get(baseUrl + 'hotel')) as List<Map<String, dynamic>>;
    return HotelModel.fromJson(insertedHotelMaps.first);
  } catch (e) {
    print('Error inserting hotel: $e');
    // Handle the error appropriately
    rethrow;
  }
}

Future<void> newQuantity(int qnt, int id) async {
  await _dio.patch(baseUrl + 'hotel/$id', data: {'availableQuantity': qnt});
}

Future<void> updateFavorite(int value, int id) async {
  await _dio.patch(baseUrl + 'hotel/$id', data: {'favorite': value});
}

Future<void> deleteHotel(int id) async {
  await _dio.delete(baseUrl + 'hotel/$id');
}




}
