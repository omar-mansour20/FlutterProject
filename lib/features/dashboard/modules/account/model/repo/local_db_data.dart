import 'package:hotel_reservation_project/features/dashboard/modules/account/model/repo/parent_data.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/model/account_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo extends ParentRepo{
  DatabaseRepo._init();
  //same constructor  

  static DatabaseRepo? _singletonePatternObject;
  static late Database _database;

  static Future<DatabaseRepo> get instance_of_memory_object async {
    if (_singletonePatternObject == null) {
      await _initDatabase();
      _singletonePatternObject = DatabaseRepo._init();
    }
    return _singletonePatternObject!;
  }

  // create the db
  static Future <void>_initDatabase() async{
    // to get the path of the local db folder
    final String databasePath = await getDatabasesPath();

    // the final path
    final String path = databasePath + "/accounts.db";

    _database = await  openDatabase(
      path,
      version: 1,
      onCreate: createTables,
    );
  }
  
  // create the table for th db
  static Future<void> createTables(Database db, _) async {
    await db.execute("""
CREATE TABLE account (
id INTEGER PRIMARY KEY AUTOINCREMENT, 
name TEXT NOT NULL, 
address TEXT )
""");
  }


  //                                                the three functionalities 


  // delete
  @override
  Future<void> delete({required int id}) async {
    await _database.delete('account', where: 'id=?', whereArgs: [id]);
  } 


  // fetch
  @override
  Future<List<AccountModel>> fetch() async {
    return (await _database.query('account')).map((e) => AccountModel.fromJson(e)).toList();
    // convert the list of map into list of our model
  }


  // insert
  @override
  Future<void> insert({required String name, String? address}) async {
    await _database.insert('account', {'name':name,'address':address});
  }

}