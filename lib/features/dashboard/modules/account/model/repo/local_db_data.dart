import 'package:hotel_reservation_project/features/dashboard/modules/account/model/repo/parent_data.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/model/account_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo extends ParentRepo {
  DatabaseRepo._init();
  //same constructor

  static DatabaseRepo? _singletonePatternObject;
  static late Database _database;

  static Future<DatabaseRepo> get instance async {
    if (_singletonePatternObject == null) {
      await _initDatabase();
      _singletonePatternObject = DatabaseRepo._init();
    }
    return _singletonePatternObject!;
  }

  // create the db
  static Future<void> _initDatabase() async {
    // to get the path of the local db folder
    final String databasePath = await getDatabasesPath();

    // the final path
    final String path = databasePath + "/users.db";

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: createTables,
    );
  }

  // create the table for th db
  static Future<void> createTables(Database db, _) async {
    await db.execute("""
CREATE TABLE user (
id INTEGER PRIMARY KEY AUTOINCREMENT, 
name TEXT NOT NULL, 
email TEXT,
phone INTEGER,
password TEXT )
""");
  }

  //                                                the three functionalities

  // delete
  @override
  Future<void> delete({required int id}) async {
    await _database.delete('user', where: 'id=?', whereArgs: [id]);
  }

  // check email
  Future<bool> checkEmail({required String email}) async {
    try {
      List<Map<String, dynamic>> existingUser = await _database.query(
        'user',
        where: 'email=?',
        whereArgs: [email],
      );
      return existingUser
          .isNotEmpty; // Return true if email exists, false otherwise
    } catch (e) {
      throw Exception('Failed to check if email exists: $e');
    }
  }

  // updatePassword
  @override
  Future<void> updatePassword(
      {required String email, String? newPassword}) async {
    await _database.update('user', {'password': newPassword},
        where: 'email=?', whereArgs: [email]);
  }

  // fetch
  @override
  Future<List<AccountModel>> fetch() async {
    return (await _database.query('user'))
        .map((e) => AccountModel.fromJson(e))
        .toList();
    // convert the list of map into list of our model
  }

  // fetchPassword
  @override
  Future<String?> getPassword({required String email}) async {
    try {
      List<Map<String, dynamic>> userData = await _database.query(
        'user',
        where: 'email = ?',
        whereArgs: [email],
      );
      if (userData.isNotEmpty) {
        Map<String, dynamic> m = userData.first;
        String password = m['password'];
        return password;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('failure to get the account by email: $e');
    }
  }

  // insert
  @override
  Future<void> insert(
      {required String name,
      String? email,
      int? phone,
      String? password}) async {
    await _database.insert('user',
        {'name': name, 'email': email, 'phone': phone, 'password': password});
  }
}
