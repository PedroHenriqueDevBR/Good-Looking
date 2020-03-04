import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQFLite {
  static final userDB =
      "CREATE TABLE user (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, login TEXT NOT NULL UNIQUE, password TEXT NOT NULL);";
  static final clientDB =
      "CREATE TABLE client (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, phone TEXT, email TEXT, address TEXT, observations TEXT);";
  static final serviceDB =
      "CREATE TABLE service (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, description TEXT, total_cost REAL, price REAL);";
  static final registerDB =
      "CREATE TABLE register (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, created_at TEXT NOT NULL, service_date TEXT, hour_service TEXT, description TEXT, done BLOB, amount_paid INTEGER);";

  getDatasabe() async {
    final pathDatabase = await getDatabasesPath();
    final localeDatabase = join(pathDatabase, "goodlook.db");

    var response =
        openDatabase(localeDatabase, version: 1, onCreate: (db, dbLastVersion) {
      db.execute(userDB);
      db.execute(clientDB);
      db.execute(serviceDB);
      db.execute(registerDB);
    });

    print("Database is open" + response.toString());
  }
}
