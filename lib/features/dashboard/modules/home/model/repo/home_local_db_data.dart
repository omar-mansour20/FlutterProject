import 'dart:typed_data';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/home_model.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/parent_data.dart';

class HotelDatabaseRepo extends ParentRepo {
  HotelDatabaseRepo._init();

  static HotelDatabaseRepo? _singletonPatternObject;
  static late Database _database;

  static Future<HotelDatabaseRepo> get instance async {
    if (_singletonPatternObject == null) {
      await _initDatabase();
      _singletonPatternObject = HotelDatabaseRepo._init();
    }
    return _singletonPatternObject!;
  }

  // create the db
  static Future<void> _initDatabase() async {
    final String databasePath = await getDatabasesPath();
    final String path = join(databasePath, "hotels.db");

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: createTables,
    );
  }

  // create the table for the db
  static Future<void> createTables(Database db, int version) async {
    await db.execute("""
CREATE TABLE hotel (
id INTEGER PRIMARY KEY AUTOINCREMENT, 
name TEXT NOT NULL, 
image BLOB,
description TEXT,
price INTEGER,
quantity INTEGER,
availableQuantity INTEGER,
favorite INTEGER
)
""");
  }

  // delete
  @override
  Future<void> delete({required int id}) async {
    await _database.delete('hotel', where: 'id=?', whereArgs: [id]);
  }

  // fetch
  @override
  Future<List<HotelModel>> fetch() async {
    final List<Map<String, dynamic>> maps = await _database.query('hotel');
    return maps.map((e) => HotelModel.fromJson(e)).toList();
  }

  // fetch favorite hotels
  Future<List<HotelModel>> fetchFavoriteHotels() async {
    final List<Map<String, dynamic>> maps = await _database.query('hotel', where: 'favorite=?', whereArgs: [1]);
    return maps.map((e) => HotelModel.fromJson(e)).toList();
  }

  // insert
  @override
  Future<HotelModel> inserthotel({
  required String name,
  String? description,
  int? price,
  int? quantity,
  int? availableQuantity,
  Uint8List? image,
}) async {
  try {
    await _database.insert('hotel', {
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
    final List<Map<String, dynamic>> insertedHotelMaps = await _database.query('hotel', where: 'name = ?', whereArgs: [name]);
    return HotelModel.fromJson(insertedHotelMaps.first);
  } catch (e) {
    print('Error inserting hotel: $e');
    // Handle the error appropriately
    rethrow;
  }
}


  Future<void> newQuantity(int qnt, int id) async {
    await _database.update(
      'hotel',
      {'availableQuantity': qnt},
      where: 'id=?',
      whereArgs: [id],
    );
  }

  Future<void> updateFavorite(int value, int id) async {
    await _database.update(
      'hotel',
      {'favorite': value},
      where: 'id=?',
      whereArgs: [id],
    );
  }

  Future<void> deleteHotel(int id) async {
    await _database.delete('hotel', where: 'id=?', whereArgs: [id]);
  }
  
  @override
  Future<void> insert({required String name, String? descreption, int? price, int? quantity, int? availableQuantity, Uint8List? image}) {
    // TODO: implement insert
    throw UnimplementedError();
  }
}
