import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/*

CREATE TABLE `client` (
	`id_client`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`name`	TEXT,
	`address`	TEXT,
	`phone`	TEXT,
	`mail`	TEXT
);

CREATE TABLE `service` (
	`id_service`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`name`	TEXT,
	`description`	TEXT,
	`price`	REAL,
	`cost`	REAL
);

CREATE TABLE `employee` (
	`id_employee`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`name`	TEXT,
	`phone`	TEXT,
	`mail`	TEXT,
	`commission`	REAL
);

CREATE TABLE `demand` (
	`id_demand`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`created_date`	TEXT,
	`service_date`	TEXT,
	`service_hour`	TEXT,
	`client`	INTEGER,
	`employees`	INTEGER,
	`services`	INTEGER
);

* */


class SQFLite {

  _createClientDatabase() {
    return "CREATE TABLE `client` ("
        "`id_client`	INTEGER PRIMARY KEY AUTOINCREMENT,"
        "`name`	TEXT,"
        "`address`	TEXT,"
        "`phone`	TEXT,"
        "`mail`	TEXT);";
  }

  _openDataBase() async {
    final pathDatabase = await getDatabasesPath();
    final databaseLocate = join(pathDatabase, 'goodlookapp.db');

    var db = await openDatabase(
      databaseLocate,
      version: 1,
      onCreate: (db, dbLastVersion) {
        String sql = 'create table if not exists note ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT, '
            'title VARCHAR, '
            'description TEXT'
            ')';
        db.execute(sql);
      },
    );

    return db;
  }


}