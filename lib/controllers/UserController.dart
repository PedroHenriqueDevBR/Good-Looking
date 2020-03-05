import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/User.dart';

class UserController {
  var USER_TABLE = "user";

  static final userDB =
      "CREATE TABLE user (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, login TEXT NOT NULL UNIQUE, password TEXT NOT NULL);";

  Future<Database> getDatasabe() async {
    final pathDatabase = await getDatabasesPath();
    final localeDatabase = join(pathDatabase, "goodlook.db");

    var db = await openDatabase(localeDatabase, version: 1,
        onCreate: (db, dbLastVersion) {
      db.execute(userDB);
    });

    return db;
  }

  createUser(User user) async {
    Database db = await getDatasabe();
    Map<String, dynamic> data = {
      "name": user.getName(),
      "login": user.getLogin(),
      "password": user.getPass()
    };

    var response = await db.insert(USER_TABLE, data);
    return response;
  }

  getUser(int id) {}
}
