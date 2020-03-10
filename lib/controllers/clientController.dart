import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/Client.dart';

class ClientController {
  Future<Database> getDatasabe() async {
    final pathDatabase = await getDatabasesPath();
    final localeDatabase = join(pathDatabase, "goodlook.db");

    Database db = await openDatabase(localeDatabase,
        version: 1, onCreate: (Database db, int version) async {});
    return db;
  }
}
