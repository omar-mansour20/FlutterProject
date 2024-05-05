import 'package:hotel_reservation_project/features/dashboard/modules/home/model/home_model.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/parent_data.dart';
import 'package:sqflite/sqflite.dart';

class HotelDatabaseRepo extends ParentRepo{
  HotelDatabaseRepo._init();
  //same constructor  

  static HotelDatabaseRepo? _singletonePatternObject;
  static late Database _database;

  static Future<HotelDatabaseRepo> get instance async {
    if (_singletonePatternObject == null) {
      await _initDatabase();
      _singletonePatternObject = HotelDatabaseRepo._init();
    }
    return _singletonePatternObject!;
  }

  // create the db
  static Future <void>_initDatabase() async{
    // to get the path of the local db folder
    final String databasePath = await getDatabasesPath();

    // the final path
    final String path = databasePath + "/hotels.db";

    _database = await  openDatabase(
      path,
      version: 1,
      onCreate: createTables,
    );
  }
  
  // create the table for th db
  static Future<void> createTables(Database db, _) async {
    await db.execute("""
CREATE TABLE hotel (
id INTEGER PRIMARY KEY AUTOINCREMENT, 
name TEXT NOT NULL, 
address TEXT,
roomCategory TEXT,
descreption TEXT,
price INTEGER )
""");

  

  }


  //                                                the three functionalities 


  // delete
  @override
  Future<void> delete({required int id}) async {
    await _database.delete('hotel', where: 'id=?', whereArgs: [id]);
  } 


  // fetch
  @override
  Future<List<HotelModel>> fetch() async {
    return (await _database.query('hotel')).map((e) => HotelModel.fromJson(e)).toList();
    // convert the list of map into list of our model
  }


  // insert
  @override
  Future<void> insert ({required String name,
   String? address,
   String? roomCategory,
   String? descreption,
   int? price}) async {
    await _database.insert('hotel', {'name':name,'address':address,'roomCategory':roomCategory,'descreption':descreption,'price':price});
  }

}