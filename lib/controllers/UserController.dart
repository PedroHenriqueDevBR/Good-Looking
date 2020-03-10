import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/User.dart';

class UserController {
  var USER_TABLE = "user";

  Future<Database> getDatasabe() async {
    final pathDatabase = await getDatabasesPath();
    final localeDatabase = join(pathDatabase, "goodlook.db");

    Database db = await openDatabase(localeDatabase,
        version: 1, onCreate: (Database db, int version) async {});

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
    await db.close();
    return response;
  }

  getUserById(int id) async {
    Database db = await getDatasabe();
    String sql = 'select * from $USER_TABLE where id = $id;';
    List<Map> queryResult = await db.rawQuery(sql);
    await db.close();
    return queryResult;
  }

  usernameRegistered(String username) async {
    Database db = await getDatasabe();
    String sql = 'select * from $USER_TABLE where login like "$username";';
    List<Map> queryResult = await db.rawQuery(sql);
    await db.close();
    if (queryResult.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  login(String login, String password) async {
    if (login.isEmpty || password.isEmpty) {
      return -1;
    }

    Database db = await getDatasabe();
    String sql =
        'select id from $USER_TABLE where login like "$login" and password like "$password";';
    List<Map> queryResult = await db.rawQuery(sql);
    await db.close();

    if (queryResult.length > 0) {
      return queryResult[0]['id'];
    } else {
      return -1;
    }
  }

  updateData(User user, int id) async {
    Database db = await getDatasabe();
    String sql =
        'update $USER_TABLE set name = "${user.name}", login = "${user.login}" where id = $id;';
    int affectedLines = await db.rawUpdate(sql);
    await db.close();
    if (affectedLines > 0) {
      return true;
    } else {
      return false;
    }
  }

  updatePassword(int id, String password) async {
    Database db = await getDatasabe();
    String sql =
        'update $USER_TABLE set password = "$password" where id = $id;';
    int affectedLines = await db.rawUpdate(sql);
    await db.close();
    if (affectedLines > 0) {
      return true;
    } else {
      return false;
    }
  }

  deleteUser(int id) async {
    Database db = await getDatasabe();
    String sql = 'delete from $USER_TABLE where id = $id;';
    int affectedLines = await db.rawUpdate(sql);
    await db.close();
    if (affectedLines > 0) {
      return true;
    } else {
      return false;
    }
  }
}
