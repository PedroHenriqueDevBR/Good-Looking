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

  getAllClients(userId) async {
    Database db = await getDatasabe();
    String sql =
        'select c.* from client c inner join user u on c.user = u.id where u.id = $userId;';
    List<Map> clients = await db.rawQuery(sql);

    db.close();
    return clients;
  }

  getClient(clientId) async {
    Database db = await getDatasabe();
    String sql = 'select * from client where id = $clientId;';
    List<Map> client = await db.rawQuery(sql);
    db.close();
    return client;
  }

  newClient(Client client, userId) async {
    Database db = await getDatasabe();
    String sql =
        'insert into client (name, phone, email, address, observations, user) values ("${client.name}", "${client.phone}", "${client.email}", "${client.address}", "${client.observations}", $userId);';
    int id = await db.rawInsert(sql);
    db.close();

    if (id > 0) {
      return id;
    } else {
      return -1;
    }
  }

  updateClient(Client client, clientId) async {
    Database db = await getDatasabe();
    String sql =
        "update client set name = '${client.name}', phone = '${client.phone}', email = '${client.email}', address = '${client.address}', observations = '${client.observations}' where id = $clientId;";
    int response = await db.rawUpdate(sql);
    db.close();
    return response;
  }

  deleteClient(clientId) async {
    Database db = await getDatasabe();
    String sql = 'delete from client where id = $clientId;';
    int response = await db.rawDelete(sql);
    db.close();
    return response;
  }
}
